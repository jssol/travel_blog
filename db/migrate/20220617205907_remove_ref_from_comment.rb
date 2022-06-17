class RemoveRefFromComment < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :user, foreign_key: true
  end
end
