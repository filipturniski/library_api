# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Status.destroy_all
Status.create([{idStatus: 0,descriptionStatus:"INACTIVE"},
               {idStatus: 1,descriptionStatus:"ACTIVE"},
               {idStatus: 2,descriptionStatus:"ON_LOAN"},
               {idStatus: 3,descriptionStatus:"DELETED"}])