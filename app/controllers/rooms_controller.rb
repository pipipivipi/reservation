class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :location, :image))
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "施設を新規登録しました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def own
    @rooms = Room.where(user_id: current_user.id)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduction, :price, :location, :image))
      flash[:notice] = "施設情報を更新しました"
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to :rooms
  end

  private

  def set_q
    @q = Room.ransack(params[:q])
  end
end
