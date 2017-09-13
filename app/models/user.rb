class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :format => {
    :with => /\A[0-9a-zA-Z]{5,13}@\d{5}\Z/i,
    :message => "ขออภัย Username ไม่ถูกต้อง"
  }

  validates_length_of :password, :in => 6..20, :allow_blank => true
end
