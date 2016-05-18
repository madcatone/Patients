require 'rails_helper'

describe '#Location' do
  before(:each) do
    @params = { 
      code: "121.0000, 31.0000",
      name: "Shanghai Station"
    }
    @location = Location.new(@params)
  end

  it ".create with the given params" do
    expect(@location.code).to eq(@params[:code])
    expect(@location.name).to eq(@params[:name])
  end
end