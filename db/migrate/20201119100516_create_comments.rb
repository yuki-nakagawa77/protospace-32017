class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text       :text
      t.references :user
      t.references :prototype
      t.timestamps
      #↪︎マイグレーションファイルに、テキストのためのカラムを追加した
      #↪︎マイグレーションファイルに、userおよびprototypeを参照するための外部キーを記述した（references型を用いる）
    end
  end
end
 