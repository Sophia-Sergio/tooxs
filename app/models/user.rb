class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  enum role: [:admin]
  enum status: [:active, :disabled]

  def fullname
    [name, lastname].join(' ').titleize
  end

  def listname
    [lastname, name].join(' ').titleize
  end


end
