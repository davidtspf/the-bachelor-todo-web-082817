def get_first_name_of_season_winner(data, season)
  first_name = ""
  data.each do |the_season, profile_hash|
    if the_season == season
      profile_hash.each do |criteria, string_value|
        if criteria["status"] == "Winner"
          first_name = criteria["name"].split(" ")[0 ]
        end
      end
    end
  end
  return first_name
end

def get_contestant_name(data, occupation)
  data.each do |the_season, profile_hash|
    profile_hash.each do |criteria, string_value|
      if criteria["occupation"] == occupation
        return criteria["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0

  data.each do |the_season, profile_hash|
    profile_hash.each do |criteria, string_value|
      if criteria["hometown"] == hometown
        counter += 1
      end
    end
  end
  return counter
end

def get_occupation(data, hometown)
  data.each do |the_season, profile_hash|
    profile_hash.each do |criteria, string_value|
      if criteria["hometown"] == hometown
        return criteria["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  total_age = 0
  counter = 0
  average = 0

  data.each do |the_season, profile_hash|
    if the_season == season
      profile_hash.each do |criteria, string_value|
        floating_point_age = criteria["age"].to_f
        total_age = total_age + floating_point_age
        counter += 1.0
      end
    end
  end
  average = (total_age / counter).round
  return average
end
