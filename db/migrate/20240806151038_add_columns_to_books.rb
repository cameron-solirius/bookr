class AddColumnsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :author, :string
    add_column :books, :stars, :decimal
    add_column :books, :finished, :boolean, default: false
    add_column :books, :thoughts, :string
    add_column :books, :finishedDate, :date
  end
end
