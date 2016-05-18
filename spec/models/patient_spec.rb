require 'rails_helper'

describe '#Patient' do

  before(:each) do
    @params = { 
      first_name: "Shanghai",
      last_name: "Wang",
      gender: "male"
    }
    @patient = Patient.new(@params)
  end

  it ".create valid with a patient" do
    expect(@patient).to be_valid
  end
  it ".create valid with a patient delete status :flase" do
    expect(@patient.deletion).to eq(false)
  end
  it ".create with the given params" do
    expect(@patient.first_name).to eq(@params[:first_name])
    expect(@patient.last_name).to eq(@params[:last_name])
    expect(@patient.gender).to eq(@params[:gender])
  end
end