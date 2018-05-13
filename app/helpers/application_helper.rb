module ApplicationHelper

 def greet
  begin
    now = Time.now
    today = Date.today.to_time

    morning = today.beginning_of_day
    noon = today.noon
    evening = today.change( hour: 17 )
    night = today.change( hour: 20 )
    tomorrow = today.tomorrow

      if (morning..noon).cover? now
        'Good Morning'
      elsif (noon..evening).cover? now
        'Good Afternoon'
      elsif (evening..night).cover? now
        'Good Evening'
      elsif (night..tomorrow).cover? now
        'Good Night'
      end
  rescue
    "Welcome"
  end
  end

  def weather
    response = Weather.lookup_by_location('pannaikadu', Weather::Units::CELSIUS)
    [response.condition.temp, response.condition.text]
  end

end
