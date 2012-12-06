class Cluster < ActiveRecord::Base
  validates_presence_of :name, :type_id
  belongs_to :datacenter
  has_many :servers

end