class Customer::PairsController < ApplicationController

  before_action :authenticate_customer!, except: [:index]
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    @pairs = Pair.all.order(created_at: :DESC).page(params[:page]).per(12)
  end

  def show
    @pair = Pair.find(params[:id])
    @comment = Comment.new
    @comments = @pair.comments.page(params[:page]).per(10)
  end

  def new
    @pair = Pair.new
  end

  def create
    @pair = Pair.new(pair_params)
    @pair.customer_id = current_customer.id
    tag_list = params[:pair][:tag_ids].delete(" ").split(',')
    if @pair.save
      @pair.save_tags(tag_list)
      flash[:notice] = "投稿の作成が完了しました"
      redirect_to pair_path(@pair)
    else
      render :new
    end
  end

  def edit
    @pair = Pair.find(params[:id])
    @tag_list = @pair.tags.pluck(:name).join(',')
  end

  def update
    @pair = Pair.find(params[:id])
    tag_list = params[:pair][:tag_ids].delete(" ").split(',')
    if @pair.update(pair_params)
      @pair.save_tags(tag_list)
      flash[:notice] = "投稿の編集が完了しました"
      redirect_to pair_path(@pair)
    else
      render :edit
    end
  end

  def destroy
    @pair = Pair.find(params[:id])
    @pair.destroy
    flash[:notice] = "投稿の削除が完了しました"
    redirect_to pairs_path
  end

  # タイトル、説明検索
  def search
    @content = params[:search][:content]
    @records = search_for(@content).page(params[:page]).per(12)

  end

  # タグ検索
  def tag_search
    @tag_list = Tag.all.page(params[:tag_page]).per(50)
    @tag = Tag.find(params[:tag_id])
    @pairs = @tag.pairs.all.page(params[:pair_page]).per(9)
  end

  # 並び替え
  def sort
    selection = params[:keyward]
    @pairs = Pair.sort(selection)
    @pairs = Kaminari.paginate_array(@pairs).page(params[:page]).per(12)
  end

  private

  def pair_params
    params.require(:pair).permit(:title, :image, :caption, tag_ids: [])
  end

  def ensure_correct_customer
    @pair = Pair.find(params[:id])
    unless @pair.customer == current_customer
      redirect_to pairs_path
    end
  end

  def search_for(content)
    Pair.where('title LIKE ?', '%' + content + '%').page(params[:page]).per(9)
  end

end