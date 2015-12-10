class ChangeSlugOnAdmin < ActiveRecord::Migration
  def change
    add_index :admins, :slug, unique: true
  end
end
