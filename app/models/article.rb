class Article < ApplicationRecord
  has_many :comments , dependent: :destroy
  # 用于数据校验
  validates :title ,presence: true ,
            length: {minimum: 5}
end
