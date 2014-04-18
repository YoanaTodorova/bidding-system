class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.float :starting_price
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
  end
end
