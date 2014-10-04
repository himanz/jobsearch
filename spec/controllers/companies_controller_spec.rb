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

  describe 'GET #edit' do
  	it "assigns the requested company to @company" do
  		company = create(:company)
  		get :edit, id: company
  		expect(assigns(:company)).to eq company
  	end

  	it "renders the :edit template" do
  		company = create(:company)
  		get :edit, id: company
  		expect(response).to render_template :edit
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
  		it "does not save the new company to the database" do
  			expect{
  				post :create, company: attributes_for(:company, name: nil)
  			}.to_not change(Company, :count)
  		end

  		it "re-renders :new template" do
  			post :create, company: attributes_for(:company, name: nil)
  			expect(response).to render_template :new
  		end
  	end
  end

  describe "PATCH #update" do
  	before :each do
  		@company = create(:company, name: "Job Searcher", information: "Search for jobs", location: "Toronto, ON")
  	end

  	context "with valid attributes" do
  		it "located the requested @company" do
  			patch :update, id: @company, company: attributes_for(:company)
  			expect(assigns(:company)).to eq @company
  		end

  		it "changes @company's attributes" do
  			patch :update, id: @company, company: attributes_for(:company, name: "The Job Finder", information: "Best search for jobs")
  			@company.reload
  			expect(@company.name).to eq "The Job Finder"
  			expect(@company.information).to eq "Best search for jobs"
  			expect(@company.location).to eq "Toronto, ON"
  		end

  		it "redirects to the updated company" do
  			patch :update, id: @company, company: attributes_for(:company)
  			expect(response).to redirect_to @company
  		end
  	end

  	context "with invalid attributes" do
  		it "does not change the company's attributes" do
  			patch :update, id: @company, company: attributes_for(:company, name: "Hello", information: nil, location: "Markham, ON")
  			@company.reload
  			expect(@company.name).to_not eq "Hello"
  			expect(@company.location).to_not eq "Markham, ON"
  			expect(@company.name).to eq "Job Searcher"
  			expect(@company.information).to eq "Search for jobs"
  			expect(@company.location).to eq "Toronto, ON"
  		end

  		it "re-renders the edit template" do
  			patch :update, id: @company, company: attributes_for(:company, name: "Hello", information: nil, location: "Markham, ON")
  			expect(response).to render_template :edit
  		end
  	end
  end
end
