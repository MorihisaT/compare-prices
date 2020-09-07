class ItemsTag

  include ActiveModel::Model
  attr_accessor :image, :price, :number, :unit_price, :text, :name

  with_options presence: true do
    validates :image
    validates :price
    validates :number
    validates :unit_price
    validates :text
    validates :name
  end

  def save
    item = Item.create(image: image, price: price, number: number, unit_price: unit_price, text: text, user_id: current_user.id)
    tag = Tag.create(name: name)

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end