# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cat_1 = Cat.create({name: "Whiskers", color: "Brown", sex: "M", age: 5, birth_date: "2016/8/12", description: "Got long whiskers"})
cat_2 = Cat.create({name: "Bob", color: "White", sex: "F", age: 8, birth_date: "2013/8/18", description: "Got long legs"})
cat_3 = Cat.create({name: "Ollie", color: "Black", sex: "M", age: 4, birth_date: "2017/8/15", description: "Got long ears"})
cat_4 = Cat.create({name: "Earl", color: "Orange", sex: "F", age: 9, birth_date: "2012/8/14", description: "Got a long tail"})