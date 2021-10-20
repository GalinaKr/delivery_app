class CourierPolicy < ApplicationPolicy
  attr_reader :courier

  def initialize(user, courier)
    super(user, courier)
    @user = user
    @package = courier
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
