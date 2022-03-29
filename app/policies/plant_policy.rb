# frozen_string_literal: true

class PlantPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    mine?
  end

  def destroy?
    mine?
  end

  def permitted_attributes
    [:name]
  end

  private

  def mine?
    record.user == user
  end
end
