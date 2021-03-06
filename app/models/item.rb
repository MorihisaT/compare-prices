class Item < ApplicationRecord
  belongs_to :user
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations, dependent: :destroy
  has_one_attached :image
  has_many :comments, dependent: :destroy

  def self.search(search, id)
    if search != ""
      Item.joins(:tags).where(tags: {name: "#{search}"} , user_id: id)
    else 
      Item.where(user_id: id)
    end
  end

  def self.full_search(search)
    if search != ""
      Item.joins(:tags).where(tags: {name: "#{search}"})
    else
      Item.all
    end
  end

end
