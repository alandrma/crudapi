class CreateArtikels < ActiveRecord::Migration[6.1]
  def change
    create_table :artikels do |t|
      t.string :judul
      t.string :isi
      t.string :media

      t.timestamps
    end
  end
end
