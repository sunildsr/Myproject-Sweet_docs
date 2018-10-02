# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
###################### SEPT 2018 Readings #######################
sept_2018_dates = [DateTime.parse("September 01 2018"),
                   DateTime.parse("September 02 2018"),
                   DateTime.parse("September 02 2018"),
                   DateTime.parse("September 03 2018")]
glucose_levels = [16, 10, 20, 35]

sept_readings = sept_2018_dates.zip(glucose_levels)

sept_readings.each do |date, reading|
  Reading.create(created_at: date, glucose_reading: reading)
end

#################### August 2018 Readings ###########################################

Aug_dates = [DateTime.parse("August 10 2018"),
                   DateTime.parse("August 10 2018"),
                   DateTime.parse("August 10 2018"),
                   DateTime.parse("August 11 2018"),
                   DateTime.parse("August 12 2018")]
glucose_levels = [35, 40, 32, 50, 21]

aug_readings = Aug_dates.zip(glucose_levels)

aug_readings.each do |date, reading|
  Reading.create(created_at: date, glucose_reading: reading)
end

############### Jan 2017 Readings #############################
jan_dates = [DateTime.parse("January 20 2017"),
                  DateTime.parse("January 21 2017"),
                  DateTime.parse("January 22 2017")]
glucose_levels = [3, 12, 41]

jan_readings = jan_dates.zip(glucose_levels)

jan_readings.each do |date, reading|
  Reading.create(created_at: date, glucose_reading: reading)
end

############### August 2017 Readings #############################
aug_2017_dates = [DateTime.parse("August 01 2017"),
                  DateTime.parse("August 01 2017"),
                  DateTime.parse("August 02 2017"),
                  DateTime.parse("August 02 2017"),
                  DateTime.parse("August 02 2017"),
                  DateTime.parse("August 02 2017"),
                  DateTime.parse("August 03 2017")]
glucose_levels = [16, 15, 18, 30, 22, 20, 15]

aug_2017_readings = aug_2017_dates.zip(glucose_levels)

aug_2017_readings.each do |date, reading|
  Reading.create(created_at: date, glucose_reading: reading)
end

