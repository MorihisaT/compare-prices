class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :sample, :share, :search, :tagsearch]

  def index
  end

  def new
    @item = ItemsTag.new
  end

  def create
    @item = ItemsTag.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to user_path(current_user.id)
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def tagsearch
    return nil if params[:input] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"] )
    render json: { inputword: tag }
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to user_path(current_user.id)
  end

  def sample
  end

  def share
    @items = Item.order("created_at DESC")
  end

  def search
    @items = Item.full_search(params[:keyword])
  end

  private

  def item_params
    params.require(:items_tag).permit(:image, :price, :number, :unit_price, :text, :name).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
