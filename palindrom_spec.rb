require './palindrom.rb'

describe "palindrom?" do
  it { expect(585.palindrom?).to be true }
  it { expect(0.palindrom?).to be true }
  it { expect(998.palindrom?).to be false }
  it { expect((-1).palindrom?).to be false }
end

describe "bin_palindrom?" do
  it { expect(1111.palindrom?).to be true }
  it { expect(1000.palindrom?).to be false  }
  it { expect(10001.palindrom?).to be true }
  it { expect(101011.palindrom?).to be false  }
  it { expect(10.palindrom?).to be false  }
end

describe "sum_palindroms" do
  it { expect(10.sum_palindroms).to eql(25) }
  it { expect(5.sum_palindroms).to eql(9) }
  it { expect(999999.sum_palindroms).to eql(872187) }
end