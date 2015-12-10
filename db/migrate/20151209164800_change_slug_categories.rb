class ChangeSlugCategories < ActiveRecord::Migration
  def change
    add_index :categories, :slug, unique: true
  end
end
