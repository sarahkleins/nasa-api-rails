require 'rails_helper'

describe 'NasaApi' do
  before do
    @api_response = {
      'copyright' => 'Roberto Colombari',
      'date' => '2016-04-28',
      'explanation' => 'This huge ball of stars predates our Sun. Long before humankind evolved, before dinosaurs roamed, and even before our Earth existed, ancient globs of stars condensed and orbited a young Milky Way Galaxy. Of the 200 or so globular clusters that survive today, Omega Centauri is the largest, containing over ten million stars. Omega Centauri is also the brightest globular cluster, at apparent visual magnitude 3.9 it is visible to southern observers with the unaided eye. Cataloged as NGC 5139, Omega Centauri is about 18,000 light-years away and 150 light-years in diameter.  Unlike many other globular clusters, the stars in Omega Centauri show several different ages and trace chemical abundances, indicating that the globular star cluster has a complex history over its 12 billion year age.',
      'hdurl'=> 'http://apod.nasa.gov/apod/image/1604/OmegaCen_Colombari_1833.jpg',
      'media_type'=> 'image',
      'service_version'=> 'v1',
      'title'=> 'Omega Centauri: The Brightest Globular Star Cluster',
      'url' => 'http://apod.nasa.gov/apod/image/1604/OmegaCen_Colombari_960.jpg'
    }.to_json
  end

  it '::get_api_info' do
    allow(Net::HTTP).to receive(:get).and_return(@api_response)
    response = NasaApi.get_api_info

    expect(response.keys).to include('copyright')
    expect(response.keys).to include('date')
    expect(response.keys).to include('explanation')
    expect(response.keys).to include('hdurl')
    expect(response.keys).to include('media_type')
    expect(response.keys).to include('service_version')
    expect(response.keys).to include('title')
    expect(response.keys).to include('url')
  end
end

