class ItemsTag

  include ActiveModel::Model
  attr_accessor :image, :price, :number, :unit_price, :text, :name, :user_id

  with_options presence: true do
    validates :image
    validates :price
    validates :number
    validates :unit_price
    validates :name
  end

  def save
    item = Item.create(image: image, price: price, number: number, unit_price: unit_price, text: text, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end