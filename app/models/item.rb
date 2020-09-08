class Item < ApplicationRecord
  belongs_to :user
  has_many :tweet_tag_relations
  has_many :tags, through: :item_tag_relations
  has_one_attached :image
end
