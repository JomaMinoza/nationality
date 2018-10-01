require 'spec_helper'

describe Nationality do
  context 'constants' do
    it { should have_constant(:NATIONALITY) }
    it { should have_constant(:NATIONALITY_EXPANDED_SPELLING) }
  end

  context '::NATIONALITY' do
    it 'should be 196' do
      expect(Nationality::NATIONALITY.count).to eq(196)
    end
  end

  context '::NATIONALITY_EXPANDED_SPELLING' do
    it 'should be 196' do
      expect(Nationality::NATIONALITY_EXPANDED_SPELLING.count).to eq(498)
    end
  end

  describe '::Nationality Class' do
    describe '#default_option method' do
      context 'When Nationality exists' do
        it 'should return the first option selected' do
          expect(Nationality::Nationality.default_option('filipino')[0]).to eq('Filipino')
        end
      end

      context 'When Nationality does not exists' do
        it 'should raise NationalityNotFound error' do
          expect { Nationality::Nationality.default_option('Jejemon') }.to raise_error(Nationality::NationalityNotFound)
        end
      end

      context 'When Nationality with Expanded Spelling exists' do
        it 'should return the first option selected' do
          expect(Nationality::Nationality.default_option('belorussian', 'expanded')[0]).to eq('Belorussian')
        end
      end

      context 'When Nationality does not exists' do
        it 'should raise NationalityNotFound error' do
          expect { Nationality::Nationality.default_option('Jejemon', 'expanded') }.to raise_error(Nationality::NationalityNotFound)
        end
      end

    end

    describe '#count method' do
      it 'should return total count of Nationalities' do
        expect(Nationality::Nationality.count).to eq(196)
      end
    end
  end

  describe '::NationalityNotFound Error Class' do
    it 'should raise NationalityNotFound error' do
      expect { raise Nationality::NationalityNotFound }.to raise_error(Nationality::NationalityNotFound)
    end
  end
end
