
class TennisGame1
  def initialize(player_one_name, player_two_name)
    @player_one_name = player_one_name
    @player_two_name = player_two_name
    @player_one_points = 0
    @player_two_points = 0
  end
        
  def won_point(player_name)
    player_name == @player_one_name ? @player_one_points += 1 : @player_two_points += 1
  end
  
  def score
    if @player_one_points == @player_two_points
      same_score(@player_one_points)
    elsif has_more_than_four_points?(@player_one_points, @player_two_points)
      difference_of_points = @player_one_points - @player_two_points
      difference_of_points.abs == 1 ? advantage(difference_of_points) : win(difference_of_points) 
    else
      convert_points_to_score(@player_one_points, @player_two_points) 
    end
  end

  private 

  def has_more_than_four_points?(player_one_points, player_two_points)
    player_one_points >= 4 || player_two_points >= 4
  end

  def same_score(player_one_points)
    {
      0 => 'Love-All',
      1 => 'Fifteen-All',
      2 => 'Thirty-All',
    }.fetch(player_one_points, 'Deuce')
  end

  def advantage(points_difference)
    points_difference == 1 ? "Advantage #{@player_one_name}" : "Advantage #{@player_two_name}"
  end

  def win(points_difference)
    points_difference >= 2 ? "Win for #{@player_one_name}" : "Win for #{@player_two_name}"
  end

  def convert_points_to_score(player_one_points, player_two_points)
    english_score = {
      0 => 'Love',
      1 => 'Fifteen',
      2 => 'Thirty',
      3 => 'Forty'
    }
    "#{english_score[player_one_points]}-#{english_score[player_two_points]}"
  end
end

class TennisGame2
  def initialize(player_one_name, player_two_name)
    @player_one_name = player_one_name
    @player_two_name = player_two_name
    @player_one_points = 0
    @player_two_points = 0
  end
      
  def won_point(player_name)
    if player_name == @player_one_name
      p1Score()
    else
      p2Score()
    end
  end

  def score
    result = ''
    if (@player_one_points == @player_two_points and @player_one_points < 3)
      if (@player_one_points==0)
        result = 'Love'
      end
      if (@player_one_points==1)
        result = 'Fifteen'
      end
      if (@player_one_points==2)
        result = 'Thirty'
      end
      result += '-All'
    end
    if (@player_one_points==@player_two_points and @player_one_points>2)
        result = 'Deuce'
    end
    
    p1res = ''
    p2res = ''
    if (@player_one_points > 0 and @player_two_points==0)
      if (@player_one_points==1)
        p1res = 'Fifteen'
      end
      if (@player_one_points==2)
        p1res = 'Thirty'
      end
      if (@player_one_points==3)
        p1res = 'Forty'
      end
      p2res = 'Love'
      result = p1res + '-' + p2res
    end
    if (@player_two_points > 0 and @player_one_points==0)
      if (@player_two_points==1)
        p2res = 'Fifteen'
      end
      if (@player_two_points==2)
        p2res = 'Thirty'
      end
      if (@player_two_points==3)
        p2res = 'Forty'
      end
      
      p1res = 'Love'
      result = p1res + '-' + p2res
    end
    
    if (@player_one_points>@player_two_points and @player_one_points < 4)
      if (@player_one_points==2)
        p1res='Thirty'
      end
      if (@player_one_points==3)
        p1res='Forty'
      end
      if (@player_two_points==1)
        p2res='Fifteen'
      end
      if (@player_two_points==2)
        p2res='Thirty'
      end
      result = p1res + '-' + p2res
    end
    if (@player_two_points>@player_one_points and @player_two_points < 4)
      if (@player_two_points==2)
        p2res='Thirty'
      end
      if (@player_two_points==3)
        p2res='Forty'
      end
      if (@player_one_points==1)
        p1res='Fifteen'
      end
      if (@player_one_points==2)
        p1res='Thirty'
      end
      result = p1res + '-' + p2res
    end
    if (@player_one_points > @player_two_points and @player_two_points >= 3)
      result = 'Advantage ' + @player_one_name
    end
    if (@player_two_points > @player_one_points and @player_one_points >= 3)
      result = 'Advantage ' + @player_two_name
    end
    if (@player_one_points>=4 and @player_two_points>=0 and (@player_one_points-@player_two_points)>=2)
      result = 'Win for ' + @player_one_name
    end
    if (@player_two_points>=4 and @player_one_points>=0 and (@player_two_points-@player_one_points)>=2)
      result = 'Win for ' + @player_two_name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
        p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

  def p1Score
    @player_one_points +=1
  end
  
  def p2Score
    @player_two_points +=1
  end
end

class TennisGame3
  def initialize(player_one_name, player_two_name)
    @p1N = player_one_name
    @p2N = player_two_name
    @p1 = 0
    @p2 = 0
  end
      
  def won_point(n)
    if n == @p1N
        @p1 += 1
    else
        @p2 += 1
    end
  end
  
  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = ['Love', 'Fifteen', 'Thirty', 'Forty']
      s = p[@p1]
      @p1 == @p2 ? s + '-All' : s + '-' + p[@p2]
    else
      if (@p1 == @p2)
        'Deuce'
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1-@p2)*(@p1-@p2) == 1 ? 'Advantage ' + s : 'Win for ' + s
      end
    end
  end
end
