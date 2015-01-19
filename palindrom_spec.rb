require './palindrom.rb'

describe "palindrom?" do
  it { expect(585.palindrom?).to eql(true) }
  it { expect(0.palindrom?).to eql(true) }
  it { expect(998.palindrom?).to eql(false) }
  it { expect((-1).palindrom?).to eql(false) }
end

describe "bin_palindrom?" do
  it { expect(1111.palindrom?).to eql(true) }
  it { expect(1000.palindrom?).to eql(false) }
  it { expect(10001.palindrom?).to eql(true) }
  it { expect(101011.palindrom?).to eql(false) }
  it { expect(10.palindrom?).to eql(false) }
end

describe "sum_palindroms" do
  it { expect(10.sum_palindroms).to eql(25) }
  it { expect(5.sum_palindroms).to eql(9) }
  it { expect(999999.sum_palindroms).to eql(872187) }
end