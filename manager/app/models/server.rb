class Server < ActiveRecord::Base
  validates_presence_of :name, :ipaddress, :model, :cluster_id
  belongs_to :cluster
  has_many :datalogs
end