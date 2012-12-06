require 'sinatra'
require 'active_record'
require 'json'
require 'models/datacenter'
require 'models/location'
require 'models/cluster'
require 'models/server'
require 'models/type'
require 'models/datalog'

#configure :development do
#set :database, 'sqlite://development.db'
#end
#configure :production do
#  set :database, 'sqlite://production.db'
#end
#configure :test do
#  set :database, 'sqlite://test.db'
#end
ActiveRecord::Base.establish_connection(:adapter => 'postgresql', :encoding => "utf8", 
  :username => "root", :password => "", :database => 'psl_development')

get '/' do
  @title = "PowerSmart Manager: Home"

  #@datacenter = Datacenter.find(3)

  erb :index
end

get '/:datacenter/:cluster/usage.json' do
  @cluster = Cluster.where(:name => params[:cluster]).first
  @servers = Server.where(:cluster_id => @cluster.id)

  cluster = Hash.new
  servers = Array.new
  puts @servers.inspect
  @servers.each do |s|
    server = Hash.new
    server[:name] = s.name
    server[:ip] = s.ipaddress
    server[:model] = s.model
    @cpu = Datalog.where(:server_id => s.id, :key => "cpu").order('created_at DESC').first
    @mem = Datalog.where(:server_id => s.id, :key => "mem").order('created_at DESC').first
    @power = Datalog.where(:server_id => s.id, :key => "power").order('created_at DESC').first
    server[:cpu] = @cpu.value unless @cpu.value.nil?
    server[:mem] = @mem.value unless @mem.value.nil?
    server[:power] = @power.value unless @power.value.nil?
    servers << server
  end
  cluster[:aaData] = servers
  content_type :json
    cluster.to_json
end

post '/:datacenter/:cluster/:server/cpu?' do
  @server = Server.where(:name => params[:server]).first
  puts @server.inspect
  puts params.inspect


end

post '/:datacenter/:cluster/:server/mem?' do


end

post '/:datacenter/:cluster/:server/temp?' do

end

post '/:datacenter/:cluster/:server/power?' do

end


get '/echo' do
  value = %x[ echo 'dick' ]

  erb :index
end

get '/new/datacenter' do
  erb :new_datacenter
end

post '/new/datacenter' do
  @loc = Location.new(:address => params[:addr], :city => params[:city], :state => params[:state], :zipcode => params[:zip], :country => params[:country])
  @loc.save!
  @datacenter = Datacenter.new(:name => params[:name], :location_id => @loc.id)
  @datacenter.save!

  erb :new_datacenter
end

get '/new/cluster' do
  erb :new_cluster
end

post '/new/cluster' do
  @type = Type.new(:name => params[:type])
  @type.save!
  @cluster = Cluster.new(:name => params[:name], :type_id => @type.id)
  @cluster.save!

  erb :new_cluster
end

get '/new/server' do
  erb :new_server
end

post '/new/server' do
  @cluster = Cluster.where(:name => params[:cluster]).first
  @server = Server.new(:name => params[:name], :ipaddress => params[:ipaddress], :model => params[:model], :cluster_id => @cluster.id)

  @server.save!

  erb :new_server
end

get '/new/datalog' do
  erb :new_datalog
end

post '/new/datalog' do

  puts params.inspect

  @server = Server.where(:name => params[:server]).first
  puts @server.id
  @datalog = Datalog.new(:key => params[:key], :value => params[:value], :server_id => @server.id)

  @datalog.save!

  erb :new_datalog
end


get '/login' do
  content_type :json
    { :key1 => 'value1', :key2 => 'value2' }.to_json
end

get '/charts' do 
  erb :charts
end

get '/:datacenter' do
  @datacenter = Datacenter.where(:name => params[:datacenter])
 #@datacenter = Datacenter.find(1)
  erb :datacenter
end
