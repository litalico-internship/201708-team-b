class CreateDirectMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :direct_messages do |t|
      t.text :text
      t.integer :sender_id
      t.integer :receiver_id
      t.index :sender_id
      t.index :receiver_id
      t.timestamps
    end
  end
end
