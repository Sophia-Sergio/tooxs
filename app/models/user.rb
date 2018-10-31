class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: %i[admin gcc gcp gz gt gv jd colaborador]
  enum status: %i[active disabled]
  belongs_to :store
  belongs_to :department
  has_many :request

  def fullname
    [name, lastname].join(' ').titleize
  end

  def listname
    [lastname, name].join(' ').titleize
  end

  def can_wiew_sale_planification?
    can_view %w[admin gcc gcp gz gt gv jd]
  end

  def can_view_colaborators?
    can_view %w[admin gv jd]
  end

  def can_view_change_plan?
    can_view %w[admin gcc gcp gz gt gv]
  end

  def can_view(roles_admitted)
    role.in?(roles_admitted)
  end

  after_initialize do
    if self.new_record?
      self.role ||= :colaborador
      self.status ||= :active
    end
  end

end
