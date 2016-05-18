require 'rails_helper'

RSpec.describe PatientsController, :type => :controller do

  context "GET new" do

    it "assigns a blank patient to the view" do
      get :new
      expect(assigns(:patient)).to be_a_new(Patient)
    end

  end

  context "POST create" do

    it "redirects to patient index page" do
      params = { patient: { first_name: "example", last_name: "tld", status: "initial", location_id: 1 } }
      post :create, params

      expect(response).to redirect_to(patients_path)
    end

    it "raises an error if missing params" do
      params = { patient: { first_name: "example" } }

      expect do
        post :create, params
      end.to raise_error ActiveRecord::StatementInvalid
    end

  end

end