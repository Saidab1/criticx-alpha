# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
file_companies = File.open "db/companies.json"
data_companies = JSON.load file_companies
file_companies.close 

data_companies.each do |row|
  company = Company.find_or_create_by(
    name: row["name"],
    description: row["description"],
    start_date: row["start_date"],
    country: row["country"]
  )
end 

file_genres = File.open "db/genres.json"
data_genres = JSON.load file_genres
file_genres.close 

data_genres.values[0].each do |value|
   Genre.find_or_create_by(
    name: value
  )
end 

file_platforms = File.open "db/platforms.json"
data_platforms = JSON.load file_platforms
file_platforms.close 

data_platforms.each do |row|
  platform = Platform.find_or_create_by(
    name: row["name"],
    category: row["category"]
  )
end 

file_other_tables = File.open "db/games.json"
data_other_tables = JSON.load file_other_tables
file_other_tables.close 

data_other_tables.each do |row|
  game = Game.find_or_create_by!(
    name: row["name"],
    summary: row["summary"],
    release_date: row["release_date"],
    category: row["category"],
    rating: row["rating"],
    parent_id: row["parent"].nil? ? row["parent"] :  Game.find_by(name: row["parent"]).id
  )
 
  

  if !row["genres"].nil?
  row["genres"].each do |value|
    game.genres << Genre.find_by(name: value)
  end 
  end 
   
  if !row["platforms"].nil?
    row["platforms"].each do |value|
      game.platforms << Platform.find_by(name:value["name"])
    end 
  end 
 if !row["involved_companies"].nil?
  row["involved_companies"].each do |value|
    company = Company.find_by(name: value["name"])
    involved_company = InvolvedCompany.find_or_create_by(
    developer: value["developer"], 
    publisher: value["publisher"],
    game: game,
    company: company
    )
  end 
end 
end 



