require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].find do |person| 
    if person["status"] == "Winner"
      return person["name"].split(' ').shift
    end
  end
end


def all_contestants(data)
  contestants = []
  data.map do |season, people|
    people.map do |contestant|
      contestants << contestant
    end
  end
  contestants
end

def get_contestant_name(data, occupation)
  all_contestants(data).find do |contestant|
    if contestant["occupation"] == occupation
      return contestant["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  all_contestants(data).reduce(0) do |hometown_count, contestant|
    contestant["hometown"] == hometown ? hometown_count + 1 : hometown_count
  end
end

def get_occupation(data, hometown)
  all_contestants(data).find do |contestant|
    if contestant["hometown"] == hometown
      return contestant["occupation"]
    end
  end
end

def get_average_age_for_season(data, season)
  contestant_ages = data[season].map { |contestant| contestant["age"].to_f }
  average_age = (contestant_ages.sum / contestant_ages.length).round
  #binding.pry
end
