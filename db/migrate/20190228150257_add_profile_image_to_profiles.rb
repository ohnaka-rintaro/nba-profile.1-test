class AddProfileImageToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :Profile_image, :string
  end
end
