require './app/helpers/chapters_helper'
include (ChaptersHelper)

User.destroy_all
Chapter.destroy_all
Saga.destroy_all

u1 = User.create(name: "Nico", email: "eskimo@hohoho.com", about_me: "First I model. Then I sing with Velvet Underground. Then much better records I make alone. Then drugs soon after. I later die.", image_url: "http://media.tumblr.com/deacbdce2e4ff2e94fc57de0812c4fcb/tumblr_inline_mi9z6qJkQl1qz4rgp.jpg", gender: "female", city: "Mitte", state: "Berlin", country: "Germany", password: "password", password_confirmation: "password")
u2 = User.create(name: "Miki Berenyi", email: "miki@lush.com", about_me: "My name is Miki, you might know me as one half of the songwriting team in the band Lush.", image_url: "http://i275.photobucket.com/albums/jj319/vonpip_miki/Lush_photos_0030_BIG-1.jpg", gender: "female", city: "Havering", state: "London", country: "United Kingdom", password: "password", password_confirmation: "password")
u3 = User.create(name: "Sean Drinkwater", email: "sean@lifestyleland.com", about_me: "I'm a veteran synth pop musician and synthesizer expert", image_url: "http://imvdb.com/assets/img/n/sean-t.-drinkwater-music-videos.jpg", gender: "male", city: "Somerville", state: "MA", country: "United States", password: "password", password_confirmation: "password")
u4 = User.create(name: "Jared", email: "primitivereflex@gmail.com", about_me: "I'm pretty cool I guess.", image_url: "http://image1.findagrave.com/photos/2010/291/60332111_128752747301.jpg", gender: "male", city: "Palm Springs", state: "CA", country: "United States", password: "password", password_confirmation: "password")

s1 = Saga.create(title: "Nico's Saga", user_id: u1.id)
s2 = Saga.create(title: "Miki's Saga", user_id: u2.id)
s3 = Saga.create(title: "Sean's Saga", user_id: u3.id)
s4 = Saga.create(title: "Jared's First Saga", user_id: u4.id)
s5 = Saga.create(title: "Jared's Second Saga", user_id: u4.id)

c1 = Chapter.create(title: "Hanglide in La Jolla", description: "soar over the golden coastline", image_url: "http://www.ushpa.aero/media/photos/hg_2008_09_hires.jpg", scope:"In the next five years", category: "Adreneline/Sports")
c2 = Chapter.create(title: "Hanglide in Vermont", description: "Glide over farms in Vermont", image_url: "http://www.ushpa.aero/media/photos/hg_2008_09_hires.jpg", scope:"In the next five years", category: "Adreneline/Sports")
c3 = Chapter.create(title: "Get married", description: "Marry the person of my dreams", image_url: "http://www.clichemag.com/wp-content/uploads/2014/07/wedding-venues.jpg", scope:"Within my lifetime", category: "Milestones")
c4 = Chapter.create(title: "Own a house", description: "Have a place to call home", image_url: "http://www.regardinghomes.com/wp-content/uploads/2014/06/House-elegant-design-beautiful-house-interior-and-exterior-design.jpg", scope:"In the next five years", category: "Milestones")
c5 = Chapter.create(title: "Adopt a pet", description: "Give a home to a loving pet", image_url: "http://onebigphoto.com/uploads/2012/09/flower-petal-and-the-puppy.jpg", scope:"Within a year", category: "Milestones")
c6 = Chapter.create(title: "Learn to Make Vegan Tacos", description: "I need to eat healthier.", image_url: "http://ohmyveggies.com/wp-content/uploads/2013/02/tempeh_tacos_recipe.jpg", scope: "Within a year", category: "food")
c7 = Chapter.create(title: "Eat a shark", description: "To prove that I'm on top of the food chain.", image_url: "http://i.dailymail.co.uk/i/pix/2010/01/14/article-0-0624B5110000044D-13_468x579.jpg", scope: "In the next 5 years", category: "food")
c8 = Chapter.create(title: "Learn to cook French cuisine", description: "I need to learn how to cook in general.", image_url: "http://www.travelwithcarnet.com/imageuploads/-carnet-french-chef-thanksgiving-dinner.jpg", scope: "In the next 5 years", category: "food")
c9 = Chapter.create(title: "Eat an alligator", description: "I have a fetish for eating animals that could normally kill me in the wild in order to prove that I'm on top of the food chain.", image_url: "http://www.crocodopolis.net/warning.jpg", scope: "In the next 5 years", category: "food")
c10 = Chapter.create(title: "Boat Prep, Shove Off and Dry Tortugas!", description: "This sailing trip will be a month long and  will separated into three chapters: Key West, Cuba and Isla Mujeres.", image_url: "http://i.imgur.com/hXlOfyS.jpg", scope: "Within a year", category: "Travel")
c11 = Chapter.create(title: "Santorini", description: "WILL GO THERE WITH THE ONE I LOVE.", image_url: "http://cache.graphicslib.viator.com/graphicslib/thumbs674x446/2462/SITours/santorini-island-day-trip...", scope: "In my lifetime", category: "Travel")
c12 = Chapter.create(title: "Write love letters to him/her once a month", description: "Love notes", image_url: "http://career-city.com/resumeimages/love-letter-2.gif", scope: "In the next 5 years", category: "Romance")
c13 = Chapter.create(title: "Dance in the rain", description: "Kiss him/her, then tell him you love him/her", image_url: "http://24.media.tumblr.com/tumblr_md87e4SO3y1rkae0qo1_400.gif", scope: "In my lifetime", category: "Romance")
c14 = Chapter.create(title: "Vermont Sunrise", description: "Watch the sunrise and sunset with someone special in Vermont", image_url: "http://3.bp.blogspot.com/-P6DW7Uozh-0/UC5hw4lVsAI/AAAAAAAAGNQ/TWaTQ2UOdzE/s1600/romantic_couple_suns...", scope: "In the next 5 years", category: "Romance")
c15 = Chapter.create(title: "Enjoy a candle lit dinner with someone special", description: "Cook for him/her while being naked", image_url: "http://2.bp.blogspot.com/-hvnUGyWd0NY/TjbJFNWQ8tI/AAAAAAAAG8w/guebDNe-h8U/s640/candle+light+dinner+3...", scope: "Within a year", category: "Romance")
c16 = Chapter.create(title: "Learn French", description: "Do you love the language of love? Time to stop putting it off.", image_url: "http://nairalandnews.com/wp-content/uploads/2014/05/58.jpg", scope: "within one year", category: "education", saga_id: nil)

 c1.saga_id = s1.id
 c2.saga_id = s4.id
 c3.saga_id = s3.id
 c4.saga_id = s2.id
 c5.saga_id = s1.id
 c6.saga_id = s4.id
 c7.saga_id = s3.id
 c8.saga_id = s2.id
 c9.saga_id = s1.id
c10.saga_id = s4.id
c11.saga_id = s3.id
c12.saga_id = s2.id
c13.saga_id = s1.id
c14.saga_id = s4.id
c15.saga_id = s3.id
c16.saga_id = s2.id

c1.add_tag_to_chapter(c1.id, "hang-gliding")
c2.add_tag_to_chapter(c2.id, "hang-gliding, Vermont")
c3.add_tag_to_chapter(c3.id, "romance")
c4.add_tag_to_chapter(c4.id, "homelife")
c5.add_tag_to_chapter(c5.id, "family, homelife")
c6.add_tag_to_chapter(c6.id, "cooking")
c7.add_tag_to_chapter(c7.id, "bizarre foods, sea")
c8.add_tag_to_chapter(c8.id, "French, cooking")
c9.add_tag_to_chapter(c9.id, "bizarre foods")
c10.add_tag_to_chapter(c10.id, "sea")
c11.add_tag_to_chapter(c11.id, "romance, homelife")
c12.add_tag_to_chapter(c12.id, "romance")
c13.add_tag_to_chapter(c13.id, "romance")
c14.add_tag_to_chapter(c14.id, "Vermont, romance")
c15.add_tag_to_chapter(c15.id, "romance")
c16.add_tag_to_chapter(c16.id, "French")

c1.save
c2.save
c3.save
c4.save
c5.save
c6.save
c7.save
c8.save
c9.save
c10.save
c11.save
c12.save
c13.save
c14.save
c15.save
c16.save

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
