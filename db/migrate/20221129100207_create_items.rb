class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.float :tax_rate
      t.float :amount
      t.string :status

      t.timestamps
    end
  end
end
