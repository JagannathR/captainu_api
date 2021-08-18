class Assessment < ApplicationRecord
  has_many :notes
  belongs_to :user
  belongs_to :tournament
  belongs_to :player
end
