class Profile < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 255 } 
  
  
  has_many :comment, dependent: :destroy
  belongs_to :user
  
  mount_uploader :profile_image, ImageUploader
  
  def self.search(search)
    if search
      Profile.where(["name LIKE :name OR content LIKE :name", name: "%#{search}%"])
    else
      Profile.all
    end
  end
  
end
