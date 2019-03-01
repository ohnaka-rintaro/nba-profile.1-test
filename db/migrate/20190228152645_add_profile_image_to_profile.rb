class AddProfileImageToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :profile_image, :string
  end
end
