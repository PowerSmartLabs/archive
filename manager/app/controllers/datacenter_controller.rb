class DatacenterController < ApplicationController
  def index
  end
  
  def create
    def create
      @datacenter = Datacenter.new(params[:datacenter])
      @location = @datacenter.locations.build(params[:location])
      if @datacenter.save
        redirect_to :action => 'index'
      else
        render :action => 'new'
      end
    end
  end
  
  def new
    @location = Location.new
    @datacenter = Datacenter.new
  end
  
  def edit
  end
  
  def show 
  end
  
  def show 
  end
  
  def update
  end
  
  def destroy
  end
end
