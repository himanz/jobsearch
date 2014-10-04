require 'spec_helper'

RSpec.describe CompaniesController, :type => :controller do
  describe 'GET #index' do
  	it "populates an array with all the companies" do
  		company1 = create(:company)
  		company2 = create(:company2)
  		get :index
  		expect(assigns(:companies)).to match_array([company1, company2])
  	end

  	it "renders the :index view" do
  		get :index
  		expect(response).to render_template :index
  	end
  end

  describe 'GET #show' do
  	it "returns the requested company to @company" do
  		company = create(:company)
  		get :show, id: company
  		expect(assigns(:company)).to eq company
  	end

    it "renders the show template" do
    	company = create(:company)
    	get :show, id: company
    	expect(response).to render_template :show
    end
  end
end
