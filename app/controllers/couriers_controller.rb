class CouriersController < ApplicationController
  def index
    @couriers = Courier.all
  end

  def show
    @courier = Courier.find(params[:id])
  end

  def new
    @courier = Courier.new
  end

  def create
    @courier = Courier.new(courier_params)

    if @courier.save
      redirect_to @courier
    else
      render :new
    end
  end

  def edit
    @courier = Courier.find(params[:id])
  end

  def update
    @courier = Courier.find(params[:id])

    if @courier.update(courier_params)
      redirect_to @courier
    else
      render :edit
    end
  end

  def destroy
    @courier = Courier.find(params[:id])
    @courier.destroy

    redirect_to root_path
  end

  private

  def courier_params
    params.require(:courier).permit(:name, :email)
  end
end
