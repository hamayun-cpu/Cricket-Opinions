class RemoveAuthorIdFromOpinion < ActiveRecord::Migration[6.0]
  def change
    remove_column :opinions, :author_id, :integer
  end
end
