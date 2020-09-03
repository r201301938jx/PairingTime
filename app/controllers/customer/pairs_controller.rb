class Customer::PairsController < ApplicationController

  def index
    @pairs = Pair.all
  end

  def show
    @pair = Pair.find(params[:id])
  end

  def new
    @pair = Pair.new
  end

  def create
    @pair = Pair.new(pair_params)
    @pair.customer_id = current_customer.id
    @pair.save
    flash[:notice] = "投稿の作成が完了しました"
    redirect_to pair_path(@pair)
  end

  def edit
    @pair = Pair.find(params[:id])
  end

  def update
    @pair = Pair.find(params[:id])
    @pair.update(pair_params)
    flash[:notice] = "投稿の編集が完了しました"
    redirect_to pair_path(@pair)
  end

  def destroy
    @pair = Pair.find(params[:id])
    @pair.destroy
    flash[:notice] = "投稿の削除が完了しました"
    redirect_to pairs_path
  end

  private

  def pair_params
    params.require(:pair).permit(:title, :image, :caption, :tag_list)
  end

end
