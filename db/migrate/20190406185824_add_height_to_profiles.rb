class AddHeightToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :height, :string
  end
end
