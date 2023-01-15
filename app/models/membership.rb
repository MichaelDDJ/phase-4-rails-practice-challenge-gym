class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client
    validates :gym, :client, :charge, presence: true
    validates :client_id, uniqueness: {scope: :gym_id}
end
