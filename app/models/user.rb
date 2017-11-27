class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
  validates :username, :password, presence: true, :on => :create
  validates :username, uniqueness: true
  validates :password, length: { in: 6..20}
  validates :username, length: { in: 3..20}

end
