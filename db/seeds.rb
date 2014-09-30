# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Listing.create(
	role: "Ruby Developer",
	company: "Ruby Workshop",
	location: "Toronto, ON",
	description: "Senior Ruby Developer only"
)

Listing.create(
	role: "Expired",
	company: "Should not appear",
	location: "Toronto, ON",
	created_at: (Time.now - 15.days),
	description: "This should be expired"
)

Listing.create(
	role: "Yesterday",
	company: "Appear under Yesterday",
	location: "Toronto, ON",
	created_at: (Time.now - 1.day),
	description: "This is only yesterday"
)