class CreateNivers < ActiveRecord::Migration[7.0]
  def change
    create_table :nivers do |t|
      t.string :nome
      t.date :data_de_nascimento
      

      t.timestamps
    end
  end
end
