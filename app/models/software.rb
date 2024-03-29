class Software < ActiveRecord::Base
  attr_accessible :name, :license_key, :os, :number_of_licenses, :storage_location, :info, :operating_system_id
  has_many :installations, :dependent=>:destroy
  has_many :items, :through=>:installations
  belongs_to :operating_system

  delegate :name, :to => :operating_system, :prefix => true, :allow_nil => true

  default_scope :order=>"name"
  def to_s
    name
  end
end
