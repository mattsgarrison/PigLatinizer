require 'spec_helper'

describe WordsController do

  describe :new do
    it "should render successfully" do
      get :new
      response.should be_successful
    end

    it "should init word object" do
      get :new
      assigns(:word).should be_a(Word)
    end
  end

  describe :create do
    context "when word is invalid" do
      it "should redirect to new word path" do
        post :create, word: { word: nil }
        response.should redirect_to new_word_path
      end

      it "should set error message in flash" do
        post :create, word: { word: nil }
        flash[:notice].should == "Your word was invalid"
      end
    end

    context "when word is valid" do
      it "should redirect to new word path" do
        post :create, word: { word: "hi" }
        response.should redirect_to new_word_path
      end

      it "should call add_translation on word with :pig_latin" do
        Word.any_instance.expects(:add_translation).with(:pig_latin)
        post :create, word: { word: "hi" }
      end

      it "should return pig latin translation in flash" do
        post :create, word: { word: "hi" }
        flash[:notice].should == "Your word in Pig Latin is ihay"
      end
    end
  end
end