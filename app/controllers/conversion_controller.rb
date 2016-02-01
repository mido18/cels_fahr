class ConversionController < ApplicationController
  before_action :set_units
  def index
  end

  def convert
    @results = Unit.convert(params)
    render :index
  end

  private
  def set_units
    @units = Unit.all
  end
end
