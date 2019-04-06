class AddWeightToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :weight, :string
  end
end
