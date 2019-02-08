class Profile < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 255 } 
  
  
  has_many :comment
  belongs_to :user
end
