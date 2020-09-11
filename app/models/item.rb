class Item < ApplicationRecord
  belongs_to :user
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
  has_one_attached :image

  def self.search(search, id)
    if search != ""
      Item.joins(:tags).where(tags: {name: "#{search}"} , user_id: id)
    else 
      Item.where(user_id: id)
    end
  end

end
