class CreateTherapists < ActiveRecord::Migration[7.0]
  def change
    create_table :therapists do |t|
      t.string :name
      t.string :insurance
      t.boolean :remote
      t.string :location

      t.timestamps
    end
  end
end
