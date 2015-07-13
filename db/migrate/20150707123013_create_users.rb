class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    	t.string :email
      t.integer :role_id, null: false, default: "10"

      t.timestamps
    end
  end
end

