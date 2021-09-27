class PackagesController < ApplicationController
  def index; end

  def create
    @courier = Courier.find(params[:courier_id])

    i = params[:delivery_status].to_i
    @package = @courier&.packages.create(:tracking_number => @tracking_number, :delivery_status => i)
    redirect_to courier_path(@courier)
  end

  def delivery_status
    byebug
    @courier = Courier.find(params[:courier_id])
    @package ||= Package.find(params[:package_id])
    st = @package.delivery_status.to_i
    @package.update(delivery_status: st)

    redirect_to courier_path(@courier)
  end
    
  private
    
  def package_params
    params.require(:package).permit(:delivery_status)
  end
end
