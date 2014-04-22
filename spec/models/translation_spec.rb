require 'spec_helper'

describe Translation do
  it { should belong_to(:word) }
  it { should validate_presence_of(:translated_word) }
  it { should validate_uniqueness_of(:translated_word) }
end