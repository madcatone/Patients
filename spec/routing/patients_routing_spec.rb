require "rails_helper"

RSpec.describe "routes for Patients", :type => :routing do

  context "should route to correct route" do
    before(:each) do
      @params = { 
        first_name: "Shanghai",
        last_name: "Wang",
        gender: "male"
      }
      @patient = Patient.new(@params)
    end

    it "should 'new'" do

      expect(:get => new_patient_path)
        .to route_to(
        controller: "patients",
        action: "new"
      )
    end
    it "should 'edit'" do

      expect(:get => edit_patient_path(1))
        .to route_to(
        controller: "patients",
        action: "edit",
        id: "1"
      )
    end
    it "should 'show'" do

      expect(:get => patient_path(1))
        .to route_to(
        controller: "patients",
        action: "show",
        id: "1"
      )
    end

  end

end