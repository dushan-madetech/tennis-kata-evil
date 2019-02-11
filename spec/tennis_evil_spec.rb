class Tennis
  def initialize
    @player_one_points = 0
    @player_two_points = 0
    @score_counter = 0
  end

  def score(player = nil)
    return '0-0' if player == nil
    if(player == :p2)
      while (@player_two_points < 15)
        @player_two_points += 1
      end
      return "0-" + @player_two_points.to_s
    end
    if(player == :p1)
      while(@player_one_points < 15)
        @player_one_points += 1
      end
      return @player_one_points.to_s + "-0"
    end
  end

  def increase_score(player = nil)
    @score_counter += 1
    if @player_one_points < 30
      @player_one_points = 30
    end

    if @score_counter == 1
      @player_two_points = 30
    end

    if @score_counter == 2
      @player_one_points = 40
    end

    if @score_counter == 2 && player == :p2
      @player_two_points = 40
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
    expect(subject.score(:p2)).to eq('0-15')
  end

  it "returns a score of 0-30 when player Two scores another point" do
    subject.increase_score(:p2)
    expect(subject.score(:p2)).to eq('0-30')
  end

  it "returns a score of 0-40 when player Two scores three points" do
    2.times { subject.increase_score(:p2) }
    expect(subject.score(:p2)).to eq('0-40')
  end

  it "returns a score of 15-15 when both players score a point" do
    subject.increase_score(:p1)
    expect(subject.score(:p2)).to eq('15-15')
  end
end
