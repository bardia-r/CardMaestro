# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'cards3.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => "bom|utf-8")


csv.each do |row|
	c = Card.new
	c.title=row['title']
	c.collection='Yu-Gi-Oh!'
	c.set=row['set']
	c.text='N/A'
	c.imageurl=row['url']
	c.approved='true'
	c.save
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'cards1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => "bom|utf-8")

csv.each do |row|
	c = Card.new
	c.title=row['title']
	c.collection='Magic Gathering Singles'
	c.set=row['set']
	desc = row['desc'].to_s.gsub(/<br>/,'')
	desc = desc.gsub("::", ",")
	desc = desc.gsub("<br>", "\n")
	c.text=desc
	c.imageurl=row['url']
	c.approved='true'
	c.save
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'cards2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => "bom|utf-8")

csv.each do |row|
	c = Card.new
	c.title=row['title']
	c.collection='Yu-Gi-Oh!'
	c.set=row['set']
	desc = row['desc'].to_s.gsub(/<br>/,'')
	desc = desc.gsub("::", ",")
	desc = desc.gsub("<br>", "\n")
	c.text=desc
	c.imageurl=row['url']
	c.approved='true'
	c.save
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'cards4.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => "bom|utf-8")

csv.each do |row|
	c = Card.new
	c.title=row['title']
	c.collection='Pokemon TCG'
	c.set=row['set']
	c.text='N/A'
	c.imageurl=row['url']
	c.approved='false'
	c.save
end