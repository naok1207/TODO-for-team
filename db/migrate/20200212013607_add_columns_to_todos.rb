class AddColumnsToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :by_time, :text
    add_column :todos, :title, :text
    add_index :todos, :title
  end
end
