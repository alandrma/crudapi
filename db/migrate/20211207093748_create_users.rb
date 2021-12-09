class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :alamat
      t.string :no_ktp
      t.string :tanggal_lahir
      t.string :jenis_kelamin
      

      t.timestamps
    end
  end
end
