class Datacenter < ActiveRecord::Base
  validates_presence_of :name
  has_many :clusters
  has_one :type
end