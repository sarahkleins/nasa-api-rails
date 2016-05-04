class NasaApiController < ApplicationController
  def index
    @nasa_api = NasaApi.get_api_info
  end
end
