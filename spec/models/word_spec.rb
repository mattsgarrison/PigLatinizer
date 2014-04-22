require 'spec_helper'

describe Word do
  it { should validate_presence_of(:word) }
  it { should have_many(:translations) }

  describe "format validations" do
    context "for word" do
      context "when format is invalid" do
        ["abc123", "123"].each do |invalid|
          it { should_not allow_value(invalid).for(:word) }
        end
      end

      context "when format is valid" do
        ["validword", "a"].each do |valid|
          it { should allow_value(valid).for(:word) }
        end
      end
    end
  end

  describe :add_translation do
    let(:word) { FactoryGirl.create(:word) }

    context "when translation isn't valid type" do
      it "should return that it isn't a valid type" do
        word.add_translation(nil).should == "This is not a valid translation type"
      end
    end

    context "when translation is pig_latin" do
      context "when word isn't valid" do
        it "should return nil" do
          word.stubs(:word).returns nil
          lambda {
            word.add_translation(:pig_latin).should == nil
          }.should change(word.translations.pig_latin, :count).by(0)
        end
      end

      context "when word is valid" do
        it "should return translated word" do
          word.stubs(:word).returns "hi"
          correct_response = "ihay"
          lambda {
            word.add_translation(:pig_latin).should == correct_response
          }.should change(word.translations.pig_latin, :count).by(1)
        end
      end
    end
  end
end