class Building < ActiveRecord::Base
  attr_accessible :name, :info
  has_many :ips, :dependent => :nullify
  has_many :locations, :dependent => :nullify

  def to_s
    name
  end
end
