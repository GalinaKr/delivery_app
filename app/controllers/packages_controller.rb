class PackagesController < ApplicationController
  def index
    authorize @package
    @packages = Package.all
  end

  def show

  end

  def new

  end
end
