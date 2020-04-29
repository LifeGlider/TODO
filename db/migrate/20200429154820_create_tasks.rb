class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :done
      t.text :todo
      t.integer :important

      t.timestamps
    end
  end
end
