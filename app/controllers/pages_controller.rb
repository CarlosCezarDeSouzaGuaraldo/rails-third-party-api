class PagesController < ApplicationController
  before_action :page_permitted_params, only: :api

  def api
    character = Character.new(params[:id])
      
    unless character.valid?
      @message = "Invalid character ID. Please enter a valid character ID."
      return @message
    end    
    
    @data = character.fetch_character_data
    unless @data
      @message = "Failed to fetch data from the third-party API. Please try again later."
    end
  end

  private

  def page_permitted_params
    params.require(:id)
  end
end