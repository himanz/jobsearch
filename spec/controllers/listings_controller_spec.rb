require 'spec_helper'

describe ListingsController do
  describe 'GET #index' do
    context 'without params' do
    	it "populates an array of all listings" do
    		listing1 = create(:listing)
    		listing2 = create(:listing2)
    		get :index
    		expect(assigns(:listings)).to match_array([listing1, listing2])
    	end

    	it "renders the :index view" do
    		get :index
        expect(response).to render_template :index
    	end
    end
  end

  describe 'GET #show' do
  	it "assigns the requested listing to @listing" do
  		listing = create(:listing)
  		get :show, id: listing
  		expect(assigns(:listing)).to eq listing
  	end

  	it "renders the :show template" do
  		listing = create(:listing)
  		get :show, id: listing
  		expect(response).to render_template :show
  	end
  end

  describe 'GET #new' do
  	it "assigns a new listing to @listing" do
  		get :new
  		expect(assigns(:listing)).to be_a_new(Listing)
  	end
  	
  	it "renders the :new template" do
  		get :new
  		expect(response).to render_template :new
  	end
  end

  describe 'POST #create' do
  	context "with valid attributes" do
  		it "saves the new listing in the database" do
  			expect{
          post :create, listing: attributes_for(:listing)
  			}.to change(Listing, :count).by(1)
  		end
  		it "redirects to listing #show"
  	end

  	context "with invalid attributes" do
  		it "does not save the new listing in the database"
  		it "re-renders the :new template"
  	end
  end
end
