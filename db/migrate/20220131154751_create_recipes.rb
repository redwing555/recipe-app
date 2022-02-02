class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :preparation_time
      t.decimal :cooking_time
      t.text :description
      t.boolean :public, default: true
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
