require "spec_helper"

describe Nationality do

  context "constants" do
    it { should have_constant(:NATIONALITY) }
  end

  context "::NATIONALITY" do
    it "should be 201" do
      Nationality::NATIONALITY.count.should == 201
    end
  end

  context "::REGION_DATA" do
    let(:countries) { Nationality::YML_NATIONALITY.map { |_, v| v}.flatten.sort }

    it "provinces should be consistent with PROVINCES" do
      countries.should == Nationality::NATIONALITY
    end
  end
end
