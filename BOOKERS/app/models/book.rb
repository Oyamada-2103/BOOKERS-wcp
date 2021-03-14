class Book < ApplicationRecord

# # 空欄時に書き込みさせない
  validates :title, presence: true
  validates :body, presence: true

end
