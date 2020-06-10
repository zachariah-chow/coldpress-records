class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
