class PackagesController < ApplicationController
  def index; end

  def create
    @courier = Courier.find(params[:courier_id])
    @package = @courier&.packages.create(package_params)
    redirect_to courier_path(@courier)
  end

  def delivery_status
    @courier = Courier.find(params[:courier_id])
    @package ||= Package.find(params[:package_id])
    st = @package.delivery_status == true ? false : true
    @package.update(delivery_status: st)

    redirect_to courier_path(@courier)
  end
    
  private
    
  def package_params
    params.require(:package).permit(:tracking_number, :delivery_status)
  end
end
