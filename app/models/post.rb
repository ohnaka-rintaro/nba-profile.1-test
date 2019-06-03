class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  
  mount_uploader :post_image, ImageUploader
end
