Date::DATE_FORMATS[:month_ordinal] = lambda { |date| 
  date.strftime("%A, %B #{date.day.ordinalize}") 
}