# == Schema Information
#
# Table name: movies
#
#  id            :integer         not null, primary key
#  showtime_date :date
#  showtime_time :time
#  created_at    :datetime
#  updated_at    :datetime
#

class Movie < ActiveRecord::Base
  def showtime
  "#{formatted_date} (#{formatted_time})"
  end
  def formatted_date
  showtime_date.strftime("%B %d, %Y")
  end
  def formatted_time
  showtime_time.strftime("%l:%M%p").strip.downcase
  end
end
