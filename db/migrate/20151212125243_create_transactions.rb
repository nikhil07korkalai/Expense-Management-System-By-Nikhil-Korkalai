class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_through_type
      t.integer :transaction_through_id
      t.integer :user_reference
      t.date :date
      t.timestamps null: false
    end
  end
end
