class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype
  #↪︎Commentモデルに、userおよびprototypeに対するアソシエーションを設定した

  validates :text, presence: true
  validates :user, presence: true
  validates :prototype, presence: true
  #↪︎Commentモデルに、テキストに関するバリデーションを記述した
end
