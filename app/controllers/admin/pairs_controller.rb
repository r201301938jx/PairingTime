class Admin::PairsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @pairs = Pair.all.page(params[:page]).per(10)
  end

  def show
    @pair = Pair.find(params[:id])
    @comments = @pair.comments
  end

  def destroy
    @pair = Pair.find(params[:id])
    @pair.destroy
    flash[:notice] = "投稿の削除が完了しました"
    redirect_to admin_pairs_path
  end

  def sort
    selection = params[:keyward]
    @pairs = Pair.sort(selection)
    @pairs = Kaminari.paginate_array(@pairs).page(params[:page]).per(10)
  end

  def search
    @content = params[:search][:content]
    @records = search_for(@content).page(params[:page]).per(10)
  end

  private

  def search_for(content)
    Pair.where('title LIKE ? OR caption LIKE ?', '%' + content + '%', '%' + content + '%').page(params[:page]).per(10)
  end

end