class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  
  attr_accessor :password
  before_save :hash_password
  
  private
  
  def hash_password
    self.encrypted_password = BCrypt::Password.create(password) if password
  end
end
