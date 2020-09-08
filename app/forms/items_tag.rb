class ItemsTag

  include ActiveModel::Model
  attr_accessor :image, :price, :number, :unit_price, :text, :name, :user_id

  with_options presence: true do
    validates :image
    validates :price
    validates :number
    validates :unit_price
    validates :text
    validates :name
  end

  def save
    item = Item.create(image: params[:image], price: params[:price], number: params[:number], unit_price: params[:unit_price], text: params[:text], user_id: current_user.id)
    tag = Tag.where(name: params[:name]).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end