require 'spec_helper'

describe PigLatinTranslator do

  let(:translator) { PigLatinTranslator.new }

  describe :translation do
    context "when word isn't set" do
      it "should return nil" do
        translator.translation.should be_nil
      end
    end

    context "when word begins with vowel" do
      it "should call vowel_translation" do
        translator.word = "a"
        translator.expects(:vowel_translation)
        translator.translation
      end

      it "should return word with ay appened to the end" do
        translator.word = "a"
        translator.translation.should == "aay"
      end
    end

    context "when word doesn't begin with vowel" do
      it "should call consonant translation" do
        translator.word = "q"
        translator.expects(:consonant_translation)
        translator.translation
      end
    end
  end
end