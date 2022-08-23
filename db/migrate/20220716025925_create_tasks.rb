class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
