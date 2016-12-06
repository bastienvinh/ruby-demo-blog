class Page < ApplicationRecord

  acts_as_list :scope => :subject

  belongs_to :subject, :optional => true
  has_and_belongs_to_many :admin_users
  has_many :sections

  scope :sorted, lambda { order(:position => :asc) }
  scope :visible, lambda { where(:visible => true) }

  validates_presence_of :name
  validates_length_of :name, :maximum => 255

  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3...255
  validates_uniqueness_of :permalink

end
