class Team < ActiveRecord::Base
  before_save :update_slug
  after_update :crop_image

  mount_uploader  :image, ImageUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  attr_accessible :name, :photo_url, :url, :video_url, :location, :organization_name, :slug, :image, :bio
  attr_accessible :crop_x, :crop_y, :crop_w, :crop_h

  attr_accessible :is_visible

  validates_presence_of :name, :location

  validates :name, :presence => true, :uniqueness => true

  has_many  :cars
  has_many  :people

  scope :visible, where(:is_visible => true)

  def team_url
    uri = URI.parse(self.url)
    if uri.kind_of?(URI::HTTP)
      uri.to_s
    else
      nil
    end
  rescue
    nil
  end

  def update_slug
    self.slug = self.name.parameterize
  end
  
  def to_param
    slug
  end

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
