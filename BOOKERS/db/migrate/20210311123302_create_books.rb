class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
# 上記３行は作成当初から記入済み

  # rails３章
  t.string :title
  t.text :body


      t.timestamps
    end
  end
end
