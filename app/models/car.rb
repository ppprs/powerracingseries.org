class Car < ActiveRecord::Base
  after_update :crop_image

  attr_accessible :description, :name, :photo_url, :team_id, :number, :image

  mount_uploader  :image, ImageUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :crop_x, :crop_y, :crop_w, :crop_h

  belongs_to :team

  validates_presence_of :description, :name, :number
  validates_uniqueness_of :number
  validates_uniqueness_of :name

  def crop_image
    image.recreate_version! if crop_x.present?
  end
end
