class AddDatetimeOnPosts < ActiveRecord::Migration
  def change
    add_column :posts, :datetime, :date
  end
end
