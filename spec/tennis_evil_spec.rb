class Tennis
  def score(player = :p2)
    if(player == :p1)
      player_one_points = 0
      while(player_one_points < 15)
        player_one_points += 1
      end
      return player_one_points.to_s + "-0"
    end
    return '0-0'
  end
end

describe Tennis do
  it "can start a game" do
    expect(subject.score).to eq('0-0')
  end

  it "returns a score of 15-0 when player One scores a point" do
    expect(subject.score(:p1)).to eq('15-0')
  end
end
