require 'spec_helper'

describe WordsController do

  describe :index do
    it "should render successfully" do
      get :index
      response.should be_successful
    end

    it "should init word object" do
      assigns(:word).should be_a(Word)
    end
  end
end