class Prototype < ApplicationRecord
  belongs_to :user
  # has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :comments
    #↪︎UserモデルおよびPrototypeモデルにも、commentに対するアソシエーションを設定した（必要に応じてdependent: :destroyオプションを使用した）
  with_options presence: true do
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  end
end