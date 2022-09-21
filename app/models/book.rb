class Book < ApplicationRecord
  
  # has_one_attached :imageユーザーの画像だけ使うからいらない。
  belongs_to :user
  
  
  # 上のがいらないってことはこれもいらない
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  
  
end
