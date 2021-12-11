class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :fullname
      t.string :PracticeLocation
      t.string :specialist
      t.string :profile

      t.timestamps
    end
  end
end
