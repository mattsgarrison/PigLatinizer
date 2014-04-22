require 'spec_helper'

describe PigLatinTranslator do

  let(:translator) { PigLatinTranslator.new }

  describe :translation do
    context "when word isn't set" do
      it "should return nil" do
        translator.translation.should be_nil
      end
    end
  end
end