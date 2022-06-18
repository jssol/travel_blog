class RemoveRefFromLike < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :user, foreign_key: true
  end
end
