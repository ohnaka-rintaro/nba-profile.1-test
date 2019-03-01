class RemoveProfileImageToProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :Profile_image, :string
  end
end
