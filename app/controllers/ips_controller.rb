class IpsController < ApplicationController
  def index
    @ips = Ip.all
  end

  def show
    @ip = Ip.find(params[:id])
  end

  def new
    @ip = Ip.new
  end

  def create
    @ip = Ip.new(params[:ip])
    if @ip.save
      flash[:notice] = "Successfully created ip #{@ip.number}"
      redirect_to new_ip_path
    else
      render :action => 'new'
    end
  end

  def edit
    @ip = Ip.find(params[:id])
  end

  def update
    @ip = Ip.find(params[:id])
    if @ip.update_attributes(params[:ip])
      flash[:notice] = "Successfully updated ip."
      redirect_to ips_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ip = Ip.find(params[:id])
    @ip.destroy
    flash[:notice] = "Successfully destroyed ip."
    redirect_to ips_path
  end
end
