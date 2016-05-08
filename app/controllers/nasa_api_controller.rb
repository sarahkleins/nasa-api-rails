class NasaApiController < ApplicationController
  def index
    @nasa_api = NasaApi.get_api_info
    @media_type_video = @nasa_api['media_type'].eql?('video')
  end
end
