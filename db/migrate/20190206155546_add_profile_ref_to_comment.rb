class AddProfileRefToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :profile, foreign_key: true
  end
end
