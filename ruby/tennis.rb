
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
      player_one_pointsScore()
    else
      player_two_pointsScore()
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
    
    player_one_pointsres = ''
    player_two_pointsres = ''
    if (@player_one_points > 0 and @player_two_points==0)
      if (@player_one_points==1)
        player_one_pointsres = 'Fifteen'
      end
      if (@player_one_points==2)
        player_one_pointsres = 'Thirty'
      end
      if (@player_one_points==3)
        player_one_pointsres = 'Forty'
      end
      player_two_pointsres = 'Love'
      result = player_one_pointsres + '-' + player_two_pointsres
    end
    if (@player_two_points > 0 and @player_one_points==0)
      if (@player_two_points==1)
        player_two_pointsres = 'Fifteen'
      end
      if (@player_two_points==2)
        player_two_pointsres = 'Thirty'
      end
      if (@player_two_points==3)
        player_two_pointsres = 'Forty'
      end
      
      player_one_pointsres = 'Love'
      result = player_one_pointsres + '-' + player_two_pointsres
    end
    
    if (@player_one_points>@player_two_points and @player_one_points < 4)
      if (@player_one_points==2)
        player_one_pointsres='Thirty'
      end
      if (@player_one_points==3)
        player_one_pointsres='Forty'
      end
      if (@player_two_points==1)
        player_two_pointsres='Fifteen'
      end
      if (@player_two_points==2)
        player_two_pointsres='Thirty'
      end
      result = player_one_pointsres + '-' + player_two_pointsres
    end
    if (@player_two_points>@player_one_points and @player_two_points < 4)
      if (@player_two_points==2)
        player_two_pointsres='Thirty'
      end
      if (@player_two_points==3)
        player_two_pointsres='Forty'
      end
      if (@player_one_points==1)
        player_one_pointsres='Fifteen'
      end
      if (@player_one_points==2)
        player_one_pointsres='Thirty'
      end
      result = player_one_pointsres + '-' + player_two_pointsres
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

  def setplayer_one_pointsScore(number)
    (0..number).each do |i|
        player_one_pointsScore()
    end
  end

  def setplayer_two_pointsScore(number)
    (0..number).each do |i|
      player_two_pointsScore()
    end
  end

  def player_one_pointsScore
    @player_one_points +=1
  end
  
  def player_two_pointsScore
    @player_two_points +=1
  end
end

class TennisGame3
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
    if not_advantage_or_win?
      scores = ['Love', 'Fifteen', 'Thirty', 'Forty']
      if same_points? 
         "#{scores[@player_one_points]}-All" 
      else
         "#{scores[@player_one_points]}-#{scores[@player_two_points]}"
      end
    else
      if same_points?
        'Deuce'
      else
        leading_player = @player_one_points > @player_two_points ? @player_one_name : @player_two_name
        (@player_one_points - @player_two_points).abs == 1 ? "Advantage #{leading_player}" : "Win for #{leading_player}"
      end
    end
  end

  def not_advantage_or_win?
    @player_one_points < 4 && @player_two_points < 4 && @player_one_points + @player_two_points < 6
  end

  def same_points?
    @player_one_points == @player_two_points
  end

  

end
