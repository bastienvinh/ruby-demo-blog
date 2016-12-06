class Section < ApplicationRecord

  acts_as_list :scope => :page

  belongs_to :page, :optional => true
  has_many :section_edits

  scope :sorted, lambda { order(:position => :asc) }
  scope :visible, lambda { where(:visible => true) }


  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, :maximum => 255

  validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content_type
  
end
