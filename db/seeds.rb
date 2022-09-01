# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Release.destroy_all
List.destroy_all
User.destroy_all

puts "Creating a user"
denis = User.create(email: "denis@gmail.com", password: "denis123")

puts "Creating 3 default lists"

heard = List.new(title: "heard")
heard.user = denis
heard.save!

spotlight = List.new(title: "spotlight")
spotlight.user = denis
spotlight.save!

buy = List.new(title: "buy")
buy.user = denis
buy.save!

puts "Creating 3 releases"

third_nature = Release.new(
  artist: "Roza Terenzi",
  title: "Third Nature",
  label: "Step Ball Chain",
  catalog_number: "STEP04",
  format: 'Vinyl, 12", 33 ⅓ RPM',
  released: "2022-01-19",
  styles: ["Downtempo", "Techno", "Drum n Bass"],
  tracklist: ["Bedtime Ritual", "Geysers", "Memories Of The Secret", "Triptych"],
  cover_url: "https://i.discogs.com/_NgAEPPVJWqeqGQkitn9xXMK9jK8usliqioC_6KmnZE/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIxODg0/ODkwLTE2NDMxMjUz/MjItNzMyOS5qcGVn.jpeg"
)

third_nature.list = spotlight
third_nature.save!

sweat_ur_prayers = Release.new(
  artist: "Byron Yeates",
  title: "Sweat Ur Prayers",
  label: "Radiant Love",
  catalog_number: "RADIANTLOVE005",
  format: 'Vinyl, 12"',
  released: "2022-05-06",
  styles: ["Breakbeat", "Downtempo", "Deep Techno", "Progressive House"],
  tracklist: ["Sweat Ur Prayers", "Waves", "Dreaming Is Essential", "Sweat Ur Prayers (Lawrence Lee Remix)"],
  cover_url: "https://i.discogs.com/IyI1V91zVcrKuedHZUu33NBU6hRYlkCcXSgU7DOqn9I/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIzNDky/NjMzLTE2NTQ1Nzky/NDktODA5MC5qcGVn.jpeg"
)

sweat_ur_prayers.list = spotlight
sweat_ur_prayers.save!

electronic_brain = Release.new(
  artist: "Liquid Earth",
  title: "The Electronic Brain EP",
  label: "Liquid Earth Physical",
  catalog_number: "LEP001",
  format: 'Vinyl, 12", 33 ⅓ RPM, EP',
  released: "2022-10-01",
  styles: ["House", "Tech House", "Progressive House", "Deep House"],
  tracklist: ["The Electronic Brain", "Vector Boy And The Horse With Three Legs", "Bubble Pop", "Stingray Shuffle"],
  cover_url: "https://i.discogs.com/hxIVNSAkombvViSiF_GczwfB0FVIjC4II5uLndU55b0/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI0Mjg0/NTUyLTE2NjEyMDg5/NTEtMTUxMi5qcGVn.jpeg"
)

electronic_brain.list = spotlight
electronic_brain.save!

puts "Finished!"
