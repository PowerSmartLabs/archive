class Location < ActiveRecord::Base
  validates_presence_of :address, :city, :state, :zipcode, :country
  belongs_to :datacenter
end