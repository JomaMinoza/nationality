require "spec_helper"

describe Nationality do

  context "constants" do
    it { should have_constant(:NATIONALITY) }
  end

  context "::NATIONALITY" do
    it "should be 196" do
      Nationality::NATIONALITY.count.should == 196
    end
  end

  describe "::Nationality Class" do

    describe '#default_option method' do
      context "When Nationality exists" do
        it "should return the first option selected" do
          expect(Nationality::Nationality.default_option('filipino')[0]).to eq("Filipino")
        end
      end

      context "When Nationality does not exists" do
        it "should raise NationalityNotFound error" do
          expect { Nationality::Nationality.default_option('Jejemon') }.to raise_error( Nationality::NationalityNotFound )
        end
      end
    end

    describe '#count method' do
      it 'should return total count of Nationalities' do
        expect(Nationality::Nationality.count).to eq(196)
      end
    end
  end

  describe "::NationalityNotFound Error Class" do
    it "should raise NationalityNotFound error" do
      expect { raise Nationality::NationalityNotFound }.to raise_error( Nationality::NationalityNotFound )
    end
  end
end
