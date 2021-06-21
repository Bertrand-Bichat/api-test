class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
end
