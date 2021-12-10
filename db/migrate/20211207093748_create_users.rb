class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :IdCardNumber
      t.string :BirthDate
      t.string :gender
      

      t.timestamps
    end
  end
end
