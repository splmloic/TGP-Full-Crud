class Gossip < ApplicationRecord
    belongs_to :user
    has_many :join_tag_with_gossips
    has_many :tags, through: :join_tag_with_gossips
    validates :title, presence: true, length: { minimum: 3, maximum: 14 }
    validates :content, presence: true
end
