require 'pry'

def get_winner_of_season seasons, season_label
    seasons[season_label].find { |person| person["status"] == "Winner" }
end

def get_first_name_of_season_winner seasons, season_label
  winner = get_winner_of_season(seasons, season_label)
  winner["name"].split(' ').shift
end


def get_all_contestants seasons 
  seasons.reduce([]) do |all_contestants, (season_label, contestants)|
    contestants_with_season = contestants.map do |contestant| 
      contestant["season"] = season_label
      contestant
    end
    all_contestants.concat contestants_with_season
  end
end

def get_contestant_by_field seasons, key, value
  get_all_contestants(seasons).find { |contestant| contestant[key] == value }
end

def get_contestant_name seasons, occupation
  get_contestant_by_field(seasons, "occupation", occupation)["name"]
end

def count_contestants_by_hometown seasons, hometown
  get_all_contestants(seasons).reduce(0) do |hometown_count, contestant|
    contestant["hometown"] == hometown ? hometown_count + 1 : hometown_count
  end
end

def get_occupation seasons, hometown
  contestant = get_all_contestants(seasons)
    .find { |contestant| contestant["hometown"] == hometown }
  contestant["occupation"]
end

def get_average_age_for_season seasons, season_label 
  contestant_ages = seasons[season_label].map { |contestant| contestant["age"].to_f }
  average_age = (contestant_ages.sum / contestant_ages.length).round
  #binding.pry
end
