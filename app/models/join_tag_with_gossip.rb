class JoinTagWithGossip < ApplicationRecord
    validates :user_id, uniqueness: {scope: :gossip_id}
    belongs_to :gossip
    belongs_to :tag
end
