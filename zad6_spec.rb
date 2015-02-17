require './zad6.rb'

describe 'Test class' do
  context 'method missing' do
    let!(:test) { TestClass.new('initial') }

    context 'when method is valid' do
      it 'returns true when method exists' do
        expect(test.attribute.initial?).to be true
      end
    end

    context 'when method is invalid' do
      it 'returns false when method not exists' do
        expect(test.attribute.new?).to be false
      end

      it 'raises exception when method have incorrect name' do
        expect{ test.attribute.example }.to raise_error(NoMethodError)
      end
    end
  end

  context 'respond_to?' do
    let!(:test) { TestClass.new('example') }

    context 'when method is valid' do
      it 'returns true when method exsists' do
        expect(test.respond_to?('example?')).to be true
      end
    end

    context 'when method is invalid' do
      it 'returns false when method exsists' do
        expect(test.respond_to?('new?')).to be false
      end
    end
  end
end