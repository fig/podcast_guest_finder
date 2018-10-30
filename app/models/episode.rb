class Episode < ApplicationRecord
  belongs_to :show
  validates :show, presence: true
  validates :name, presence: true
end
