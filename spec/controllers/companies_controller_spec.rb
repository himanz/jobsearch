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

  describe 'GET #new' do
  	it "assigns a new company to @company" do
  		get :new
  		expect(assigns(:company)).to be_a_new(Company)
  	end

  	it "renders the new template" do
  		get :new
  		expect(response).to render_template :new
  	end
  end

  describe 'POST #create' do
  	context "with valid attributes" do
  		it "saves the new company to the database" do
  			expect{
  				post :create, company: attributes_for(:company)
  			}.to change(Company, :count).by(1)
  		end

  		it "redirects to company #show" do
  			post :create, company: attributes_for(:company)
  			expect(response).to redirect_to company_path(assigns(:company))
  		end
  	end

  	context "with invalid attributes" do
  		it "does not save the new company to the database"
  		it "re-renders :new template"
  	end
  end
end
