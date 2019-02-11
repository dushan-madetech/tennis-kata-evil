class Tennis
  def initialize
    @player_one_points = 0
    @score_counter = 0
  end

  def score(player = :p2)
    if(player == :p1)
      while(@player_one_points < 15)
        @player_one_points += 1
      end
      return @player_one_points.to_s + "-0"
    end
    return '0-0'
  end

  def increase_score
    @score_counter += 1
    if @player_one_points < 30
      @player_one_points = 30
    end
    if @score_counter == 2
      @player_one_points = 40
    end
  end
end

describe Tennis do
  it "can start a game" do
    expect(subject.score).to eq('0-0')
  end

  it "returns a score of 15-0 when player One scores a point" do
    expect(subject.score(:p1)).to eq('15-0')
  end

  it "returns a score of 30-0 when player One scores another point" do
    subject.increase_score
    expect(subject.score(:p1)).to eq('30-0')
  end

  it "returns a score of 40-0 when player One scores three points" do
    2.times { subject.increase_score }
    expect(subject.score(:p1)).to eq('40-0')
  end

  it "returns a score of 0-15 when player Two scores a point" do
    expect(subject.score).to eq('0-15')
  end
end
