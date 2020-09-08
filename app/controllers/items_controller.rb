class ItemsController < ApplicationController
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

  private

  def item_params
    params.require(:items_tag).permit(:image, :price, :number, :unit_price, :text, :name)
  end

end
