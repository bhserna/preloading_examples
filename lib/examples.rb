require_relative "models"
require_relative "helpers"

puts "-----------------------------"
puts "TASK"
puts "1. Fetch all acomodations preloading rooms (with includes)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.includes(:rooms)"
puts
puts "EXECUTE"
accomodations = Accomodation.includes(:rooms)
display_with_rooms(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "2. Fetch all acomodations preloading rooms (with preload)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.preload(:rooms)"
puts
puts "EXECUTE"
accomodations = Accomodation.preload(:rooms)
display_with_rooms(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "3. Fetch all acomodations preloading rooms (with eager load)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.eager_load(:rooms)"
puts
puts "EXECUTE"
accomodations = Accomodation.eager_load(:rooms)
display_with_rooms(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "4. Fetch all acomodations preloading review (with includes)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.includes(:reviews)"
puts
puts "EXECUTE"
accomodations = Accomodation.includes(:reviews)
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "5. Fetch all acomodations preloading review (with preload)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.preload(:reviews)"
puts
puts "EXECUTE"
accomodations = Accomodation.preload(:reviews)
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "6. Fetch all acomodations preloading review (with eager_load)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.eager_load(:reviews)"
puts
puts "EXECUTE"
accomodations = Accomodation.eager_load(:reviews)
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "7. Fetch all acomodations preloading reviews and rooms (with includes)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.includes(:reviews, :rooms)"
puts
puts "EXECUTE"
accomodations = Accomodation.includes(:reviews, :rooms)
display_with_reviews_and_rooms(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "8. Fetch all acomodations preloading reviews and rooms (with preload)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.preload(:reviews, :rooms)"
puts
puts "EXECUTE"
accomodations = Accomodation.preload(:reviews, :rooms)
display_with_reviews_and_rooms(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "9. Fetch all acomodations preloading reviews and rooms (with eager_load)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.eager_load(:reviews, :rooms)"
puts
puts "EXECUTE"
accomodations = Accomodation.eager_load(:reviews, :rooms)
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "10. Fetch all acomodations for exactly 4 guests, preloading review (with includes)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.where(guests_count: 4).includes(:reviews)"
puts
puts "EXECUTE"
accomodations = Accomodation.where(guests_count: 4).includes(:reviews)
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "11. Fetch all acomodations for exactly 4 guests, preloading review (with preload)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.where(guests_count: 4).preload(:reviews)"
puts
puts "EXECUTE"
accomodations = Accomodation.where(guests_count: 4).preload(:reviews)
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "12. Fetch all acomodations for exactly 4 guests, preloading review (with eager_load)"
puts
puts "ACTIVE_RECORD"
puts "Accomodation.where(guests_count: 4).eager_load(:reviews)"
puts
puts "EXECUTE"
accomodations = Accomodation.where(guests_count: 4).eager_load(:reviews)
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "13. Fetch all acomodations with reviews of 4 stars (not in average), preloading reviews (with includes)"
puts
puts "ACTIVE_RECORD"
puts 'Accomodation.includes(:reviews).where(reviews: {stars: 4})'
puts
puts "EXECUTE"
accomodations = Accomodation.includes(:reviews).where(reviews: {stars: 4})
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "14. Fetch all acomodations with reviews of 4 stars (not in average), preloading review (with preload)"
puts
puts "ACTIVE_RECORD"
puts 'Accomodation.joins(:reviews).where(reviews: {stars: 4}).preload(:reviews)'
puts
puts "EXECUTE"
accomodations = Accomodation.joins(:reviews).where(reviews: {stars: 4}).distinct(true).preload(:reviews)
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "15. Fetch all acomodations with reviews of 4 stars (not in average), preloading review (with eager_load)"
puts
puts "ACTIVE_RECORD"
puts 'Accomodation.eager_load(:reviews).where(reviews: {stars: 4})'
puts
puts "EXECUTE"
accomodations = Accomodation.eager_load(:reviews).where(reviews: {stars: 4})
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "16. List of accomodations with reviews of 4 stars (in average), preloading reviews (with preload)"
puts
puts "ACTIVE_RECORD"
puts 'Accomodation.joins(:reviews).group(:id).having("avg(reviews.stars) > 4").preload(:reviews)'
puts
puts "EXECUTE"
accomodations = Accomodation.joins(:reviews).group(:id).having("avg(reviews.stars) >= 4").preload(:reviews)
display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "17. List of accomodations with reviews of 4 stars (in average), preloading reviews (with includes)"
puts
puts "ACTIVE_RECORD"
puts "I was not able to make it work with includes, postgres returns the next error"
puts 'ERROR:  column "reviews.id" must appear in the GROUP BY clause or be used in an aggregate function (ActiveRecord::StatementInvalid)'
puts
puts 'Accomodation.joins(:reviews).group(:id).having("avg(reviews.stars) > 4").includes(:reviews)'
puts
#puts accomodations = Accomodation.joins(:reviews).group(:id).having("avg(reviews.stars) >= 4").includes(:reviews)
#puts display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "18. List of accomodations with reviews of 4 stars (in average), preloading reviews (with eager_load)"
puts
puts "ACTIVE_RECORD"
puts "I was not able to make it work with eager_load, postgres returns the next error"
puts 'ERROR:  column "reviews.id" must appear in the GROUP BY clause or be used in an aggregate function (ActiveRecord::StatementInvalid)'
puts
puts 'Accomodation.joins(:reviews).group(:id).having("avg(reviews.stars) > 4").includes(:reviews)'
puts
#accomodations = Accomodation.joins(:reviews).group(:id).having("avg(reviews.stars) >= 4").includes(:reviews)
#display_with_reviews(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "19. List of accomodations with exactly 2 rooms, preloading rooms (with preload)"
puts
puts "ACTIVE_RECORD"
puts 'Accomodation.joins(:rooms).group(:id).having("count(rooms.id) = 2").preload(:rooms)'
puts
puts "EXECUTE"
accomodations = Accomodation.joins(:rooms).group(:id).having("count(rooms.id) = 2").preload(:rooms)
display_with_rooms(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "20. List of accomodations with exactly 2 rooms, preloading rooms (with includes)"
puts
puts "ACTIVE_RECORD"
puts "I was not able to make it work with includes, postgres returns the next error"
puts 'ERROR:  column "rooms.id" must appear in the GROUP BY clause or be used in an aggregate function (ActiveRecord::StatementInvalid)'
puts
puts 'Accomodation.joins(:rooms).group(:id).having("count(rooms.id) = 2").includes(:rooms)'
puts
#accomodations = Accomodation.joins(:rooms).group(:id).having("count(rooms.id) = 2").includes(:rooms)
#display_with_rooms(accomodations)
puts "-----------------------------"

puts "-----------------------------"
puts "TASK"
puts "21. List of accomodations with exactly 2 rooms, preloading rooms (with eager_load)"
puts
puts "ACTIVE_RECORD"
puts "I was not able to make it work with includes, postgres returns the next error"
puts 'ERROR:  column "rooms.id" must appear in the GROUP BY clause or be used in an aggregate function (ActiveRecord::StatementInvalid)'
puts
puts 'Accomodation.joins(:rooms).group(:id).having("count(rooms.id) = 2").eager_load(:rooms)'
puts
#accomodations = Accomodation.joins(:rooms).group(:id).having("count(rooms.id) = 2").eager_load(:rooms)
#display_with_rooms(accomodations)
puts "-----------------------------"
