class List < ApplicationRecord
  has_one_attached:image
  #上記の記述により画像を扱うためのimageカラムが追記されたかのように扱うことが
  validates:title, presence:true
  validates:body, presence:true
  validates:image, presence:true

end
