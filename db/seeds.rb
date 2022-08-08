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

Author.destroy_all
Author.create([{idAuthor:1, nameAuthor:"Test Author1", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
               {idAuthor:2, nameAuthor:"Test Author2", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
               {idAuthor:3, nameAuthor:"Test Author3", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
               {idAuthor:4, nameAuthor:"Test Author4", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
               {idAuthor:5, nameAuthor:"Test Author5", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
               {idAuthor:6, nameAuthor:"Test Author6", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
               {idAuthor:7, nameAuthor:"Test Author7", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" }
              ])

Book.destroy_all
Book.create([
  {idBook:1, idAuthor:1, nameBook:"Test book1", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:1, idAuthor:1, nameBook:"Test book1", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:1, idAuthor:1, nameBook:"Test book1", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:1, idAuthor:1, nameBook:"Test book1", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:1, idAuthor:1, nameBook:"Test book1", bookLocation:"1-25-35", status: 2, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:1, idAuthor:1, nameBook:"Test book1", bookLocation:"1-25-35", status: 2, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:1, idAuthor:1, nameBook:"Test book1", bookLocation:"1-25-35", status: 2, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:1, idAuthor:1, nameBook:"Test book1", bookLocation:"1-25-35", status: 2, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:2, idAuthor:2, nameBook:"Test book2", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:2, idAuthor:2, nameBook:"Test book2", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:2, idAuthor:2, nameBook:"Test book2", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:2, idAuthor:2, nameBook:"Test book2", bookLocation:"1-25-35", status: 2, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:2, idAuthor:2, nameBook:"Test book2", bookLocation:"1-25-35", status: 2, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:2, idAuthor:2, nameBook:"Test book2", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:2, idAuthor:2, nameBook:"Test book2", bookLocation:"1-25-35", status: 3, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:2, idAuthor:2, nameBook:"Test book2", bookLocation:"1-25-35", status: 3, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:3, idAuthor:3, nameBook:"Test book3", bookLocation:"1-25-35", status: 3, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:3, idAuthor:3, nameBook:"Test book3", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:4, idAuthor:4, nameBook:"Test book4", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:4, idAuthor:4, nameBook:"Test book4", bookLocation:"1-25-35", status: 2, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:4, idAuthor:4, nameBook:"Test book4", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:4, idAuthor:4, nameBook:"Test book4", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:4, idAuthor:4, nameBook:"Test book4", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:4, idAuthor:4, nameBook:"Test book4", bookLocation:"1-25-35", status: 3, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:5, idAuthor:5, nameBook:"Test book5", bookLocation:"1-25-35", status: 2, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:6, idAuthor:6, nameBook:"Test book6", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:7, idAuthor:7, nameBook:"Test book7", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:7, idAuthor:7, nameBook:"Test book7", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:7, idAuthor:7, nameBook:"Test book7", bookLocation:"1-25-35", status: 3, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" },
  {idBook:7, idAuthor:7, nameBook:"Test book7", bookLocation:"1-25-35", status: 1, createDate:DateTime.strptime("08/07/2022 8:00", "%m/%d/%Y %H:%M"), createBy:"test_username" }
])