class PackagePolicy < ApplicationPolicy
  attr_reader :package

  def initialize(user, package)
    super(user, package)
    @user = user
    @package = package
  end

  def update?
    @user.is_a?(DeliveryManager)
  end

  def index?
    @user.is_a?(DeliveryManager)
  end

  def create?
    @user.is_a?(DeliveryManager)
  end

  def new?
    @user.is_a?(DeliveryManager)
  end

  def edit?
    @user.is_a?(DeliveryManager)
  end

  def destroy?
    @user.is_a?(DeliveryManager)
  end
end
