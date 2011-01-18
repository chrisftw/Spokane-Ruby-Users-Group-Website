require 'spec_helper'

describe PlacesController do

  def mock_place(stubs={})
    @mock_place ||= mock_model(Place, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all places as @places" do
      Place.stub(:all) { [mock_place] }
      get :index
      assigns(:places).should eq([mock_place])
    end
  end

  describe "GET show" do
    it "assigns the requested place as @place" do
      Place.stub(:find).with("37") { mock_place }
      get :show, :id => "37"
      assigns(:place).should be(mock_place)
    end
  end

  describe "GET new" do
    it "assigns a new place as @place" do
      Place.stub(:new) { mock_place }
      get :new
      assigns(:place).should be(mock_place)
    end
  end

  describe "GET edit" do
    it "assigns the requested place as @place" do
      Place.stub(:find).with("37") { mock_place }
      get :edit, :id => "37"
      assigns(:place).should be(mock_place)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created place as @place" do
        Place.stub(:new).with({'these' => 'params'}) { mock_place(:save => true) }
        post :create, :place => {'these' => 'params'}
        assigns(:place).should be(mock_place)
      end

      it "redirects to the created place" do
        Place.stub(:new) { mock_place(:save => true) }
        post :create, :place => {}
        response.should redirect_to(place_url(mock_place))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved place as @place" do
        Place.stub(:new).with({'these' => 'params'}) { mock_place(:save => false) }
        post :create, :place => {'these' => 'params'}
        assigns(:place).should be(mock_place)
      end

      it "re-renders the 'new' template" do
        Place.stub(:new) { mock_place(:save => false) }
        post :create, :place => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested place" do
        Place.should_receive(:find).with("37") { mock_place }
        mock_place.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :place => {'these' => 'params'}
      end

      it "assigns the requested place as @place" do
        Place.stub(:find) { mock_place(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:place).should be(mock_place)
      end

      it "redirects to the place" do
        Place.stub(:find) { mock_place(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(place_url(mock_place))
      end
    end

    describe "with invalid params" do
      it "assigns the place as @place" do
        Place.stub(:find) { mock_place(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:place).should be(mock_place)
      end

      it "re-renders the 'edit' template" do
        Place.stub(:find) { mock_place(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested place" do
      Place.should_receive(:find).with("37") { mock_place }
      mock_place.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the places list" do
      Place.stub(:find) { mock_place }
      delete :destroy, :id => "1"
      response.should redirect_to(places_url)
    end
  end

end
