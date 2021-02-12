class RemoveuserIdFromOpinion < ActiveRecord::Migration[6.0]
  def change
    remove_column :opinions, :user_id, :integer
  end
end
