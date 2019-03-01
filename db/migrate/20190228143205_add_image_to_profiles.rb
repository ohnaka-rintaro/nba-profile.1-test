class AddImageToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :Image, :string
  end
end
