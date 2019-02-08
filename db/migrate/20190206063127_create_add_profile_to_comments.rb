class CreateAddProfileToComments < ActiveRecord::Migration[5.0]
  def change
    create_table :add_profile_to_comments do |t|

      t.timestamps
    end
  end
end
