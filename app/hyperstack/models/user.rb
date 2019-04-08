class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  unless RUBY_ENGINE == 'opal'
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  end

  def self.current
    Hyperstack::Application.acting_user_id ? find(Hyperstack::Application.acting_user_id) : User.new
  end
end
