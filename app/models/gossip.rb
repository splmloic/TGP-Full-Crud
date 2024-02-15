class Gossip < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :join_tag_with_gossips
    has_many :tags, through: :join_tag_with_gossips
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 3, maximum: 14 }
    validates :content, presence: true
end
