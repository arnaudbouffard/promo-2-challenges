# This "require" line loads the contents of the 'date' file from the standard
# Ruby library, giving you access to the Date class.
require 'date'


def age_in_days(day, month, year)
  #TODO: return the age expressed in days given the day, month, and year of birth
  ((Time.now-Time.new(year, month, day)).round / (60*60*24)).to_i
end
