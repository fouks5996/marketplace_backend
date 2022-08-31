class AddColumnPriceToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :price, :decimal
  end
end
