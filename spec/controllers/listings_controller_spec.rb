require 'spec_helper'

describe ListingsController do
  describe 'GET#index' do
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
end
