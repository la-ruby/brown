class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # https://stackoverflow.com/a/3809360
  has_one :my_settings
  after_create :create_my_settings

  has_many :properties

  # has the  quad of credentials been supplied by user
  def my_settings?
    my_settings.zaibatsu_username.present? &&
      my_settings.zaibatsu_password.present? &&
      my_settings.dufrenite_username.present? &&
      my_settings.dufrenite_password.present?
  end
end
