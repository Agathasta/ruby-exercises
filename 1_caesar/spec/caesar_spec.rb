require './lib/caesar'

describe "#caesar_cipher" do
  it "move forward within the alphabet" do
    expect(caesar_cipher('abcd', 2)).to eql('cdef')
  end

  it "move backward within the alphabet" do
    expect(caesar_cipher('cdef', -2)).to eql('abcd')
  end

  it "respect upper case letters" do
    expect(caesar_cipher('AbCd', 2)).to eql('CdEf')
  end

  it "move forward outside the alphabet" do
    expect(caesar_cipher('xyZ', 2)).to eql('zaB')
  end

  it "move backward outside the alphabet" do
    expect(caesar_cipher('zaB', -2)).to eql('xyZ')
  end
end
