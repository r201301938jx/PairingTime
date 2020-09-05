class Admin::PairsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @pairs = Pair.all
  end

  def show
    @pair = Pair.find(params[:id])
  end

  def destroy
    @pair = Pair.find(params[:id])
    @pair.destroy
    flash[:notice] = "投稿の削除が完了しました"
    redirect_to admin_pairs_path
  end

end
