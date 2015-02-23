require './zad6.rb'

describe 'StringInquirer' do
  context 'method missing' do
    let!(:test) { StringInquirer.new('initial') }

    it 'returns true when comparing strings are equal' do
      expect(test.initial?).to be true
    end

    it 'returns false when comparing strings are not equal' do
      expect(test.example?).to be false
    end

    it 'raises exception when method have incorrect name' do
      expect{ test.example }.to raise_error(NoMethodError)
    end
  end

  context 'respond_to?' do
    let!(:test) { StringInquirer.new('example') }

    it 'returns true when method exsists' do
      expect(test.respond_to?('example?')).to be true
    end

    it 'returns false when method exsists' do
      expect(test.respond_to?('initial?')).to be false
    end
  end
end