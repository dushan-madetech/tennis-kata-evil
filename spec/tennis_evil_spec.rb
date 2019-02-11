class Tennis
  def score
    return '0-0'
  end
end

describe Tennis do
  it "can start a game" do
    expect(subject.score).to eq("0-0")
  end
end
