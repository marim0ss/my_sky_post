class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birth_date
      t.integer :age
      t.string :birthplace
      t.string :gender
      t.string :how_are_you

      t.timestamps
    end
  end
end
