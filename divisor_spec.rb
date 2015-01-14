require "./divisor.rb"

describe "divisor" do
	it { expect(divisor([3])).to eql [1] }
	it { expect(divisor([3, 20])).to eql [1, 22] }
	it { expect(divisor([])).to eql [] }
	it { expect(divisor([3, 2, 10, 20])).to eql [1, 1, 8, 22] }
	it { expect(divisor([3, 2, 10, 20, 3, 2])).to eql [1, 1, 8, 22, 1, 1] }
end

describe "divisor_sum function" do
	it { expect(divisor_sum(20)).to eql 22 }
	it { expect(divisor_sum(3)).to eql 1 }
	it { expect(divisor_sum(-10)).to eql 0 }
end