class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :standard]
  enum status: [:active, :disabled]

  def fullname
    [name, lastname].join(' ').titleize
  end

  def listname
    [lastname, name].join(' ').titleize
  end
  
  after_initialize do
    if self.new_record?
      self.role ||= :standard
      self.status ||= :active
    end
  end

end
