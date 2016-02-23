class Person < ActiveRecord::Base
  after_update :crop_image

  mount_uploader :image, ImageUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :crop_x, :crop_y, :crop_w, :crop_h

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :address, :bio, :email, :first_name, :last_name, :location, :personal_url, :phone, :team_id, :twitter, :birthday, :is_admin, :image
  
  attr_accessible :password, :password_confirmation, :remember_me

  belongs_to :team

  validates_presence_of :first_name, :last_name, :email, :phone

  validates :email, :presence => true, :email => true, :uniqueness => true

  validates :phone, :length => { :minimum => 10, :maximum => 11 }, :numericality => { :only_integer => true }

#  validates :password, :length => { :minimum => 8 }

  def admin?
    self.is_admin
  end

  def crop_image
    image.recreate_version! if crop_x.present?
  end

  def phone=(num)
    num.gsub!(/\D/, '') if num.is_a?(String)
    super(num)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
