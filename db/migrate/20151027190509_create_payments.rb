class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :title
      t.string :app
      t.string :url

      t.timestamps null: false
    end
  end
end
