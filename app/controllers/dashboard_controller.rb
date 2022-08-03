# frozen_string_literal: true

class DashboardController < ApplicationController
  def show
    authorize :dashboard, :show?

    @plants = policy_scope(Plant)
  end
end
