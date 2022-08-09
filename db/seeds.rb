# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Status.destroy_all
Status.create([
               {id: 1,descriptionStatus:"ACTIVE"},
               {id: 2,descriptionStatus:"INACTIVE"},
               {id: 3,descriptionStatus:"ON_LOAN"},
               {id: 4,descriptionStatus:"RETURNED"},
               {id: 5,descriptionStatus:"DELETED"}])

Authors.destroy_all
Authors.create([{id:1, name_author:"Test Author1", status_id:1},
               {id:2, name_author:"Test Author2", status_id:1 },
               {id:3, name_author:"Test Author3", status_id:1 },
               {id:4, name_author:"Test Author4", status_id:1},
               {id:5, name_author:"Test Author5", status_id:1},
               {id:6, name_author:"Test Author6", status_id:1 },
               {id:7, name_author:"Test Author7", status_id:1 }
              ])

Book.destroy_all
Book.create([
  {id:1, authors_id:1, name:"Test book1", location:"1-25-35", status_id:1},
  {id:2, authors_id:1, name:"Test book1", location:"1-25-35", status_id:1},
  {id:3, authors_id:1, name:"Test book1", location:"1-25-35", status_id:1},
  {id:4, authors_id:1, name:"Test book1", location:"1-25-35", status_id:1},
  {id:5, authors_id:1, name:"Test book1", location:"1-25-35", status_id:2},
  {id:6, authors_id:1, name:"Test book1", location:"1-25-35", status_id:1},
  {id:7, authors_id:1, name:"Test book1", location:"1-25-35", status_id:2},
  {id:8, authors_id:1, name:"Test book1", location:"1-25-35", status_id:1},
  {id:9, authors_id:2, name:"Test book2", location:"1-25-35", status_id:1},
  {id:10, authors_id:2, name:"Test book2", location:"1-25-35", status_id:1},
  {id:11, authors_id:2, name:"Test book2", location:"1-25-35", status_id:1},
  {id:12, authors_id:2, name:"Test book2", location:"1-25-35", status_id:2},
  {id:13, authors_id:2, name:"Test book2", location:"1-25-35", status_id:1},
  {id:14, authors_id:2, name:"Test book2", location:"1-25-35", status_id:1},
  {id:15, authors_id:2, name:"Test book2", location:"1-25-35", status_id:1},
  {id:17, authors_id:2, name:"Test book2", location:"1-25-35", status_id:1},
  {id:18, authors_id:3, name:"Test book3", location:"1-25-35", status_id:1},
  {id:19, authors_id:3, name:"Test book3", location:"1-25-35", status_id:1},
  {id:20, authors_id:4, name:"Test book4", location:"1-25-35", status_id:1},
  {id:21, authors_id:4, name:"Test book4", location:"1-25-35", status_id:2},
  {id:22, authors_id:4, name:"Test book4", location:"1-25-35", status_id:1},
  {id:23, authors_id:4, name:"Test book4", location:"1-25-35", status_id:1},
  {id:24, authors_id:4, name:"Test book4", location:"1-25-35", status_id:1},
  {id:25, authors_id:4, name:"Test book4", location:"1-25-35", status_id:1},
  {id:26, authors_id:5, name:"Test book5", location:"1-25-35", status_id:2},
  {id:27, authors_id:6, name:"Test book6", location:"1-25-35", status_id:1},
  {id:28, authors_id:7, name:"Test book7", location:"1-25-35", status_id:1},
  {id:29, authors_id:7, name:"Test book7", location:"1-25-35", status_id:1},
  {id:30, authors_id:7, name:"Test book7", location:"1-25-35", status_id:1},
  {id:31, authors_id:7, name:"Test book7", location:"1-25-35", status_id:1}
])

Member.destroy_all
Member.create([
              {id:1, first_name:'pero', last_name:"peric", username:"ppseric", status_id:1},
              {id:2, first_name:'šetf', last_name:"peric", username:"šperic", status_id:1},
              {id:3, first_name:'pero', last_name:"štefić", username:"pštevic", status_id:1},
              {id:4, first_name:'joža', last_name:"peric", username:"jpseric", status_id:1}
            ])

Loan.destroy_all
Loan.create([
              {id:1, member_id:1, book_id:1, status_id:3},
              {id:2, member_id:1, book_id:2, status_id:3},
              {id:3, member_id:1, book_id:3, status_id:3},
              {id:4, member_id:2, book_id:4, status_id:3},
              {id:5, member_id:3, book_id:5, status_id:3},
              {id:6, member_id:3, book_id:6, status_id:4},
              {id:7, member_id:4, book_id:7, status_id:4},
              {id:8, member_id:4, book_id:8, status_id:4},
              {id:9, member_id:4, book_id:9, status_id:4},
              {id:10, member_id:4, book_id:11, status_id:4},
              {id:11, member_id:4, book_id:10, status_id:4},
              {id:12, member_id:4, book_id:12, status_id:4},
              {id:13, member_id:4, book_id:13, status_id:4},
              {id:14, member_id:4, book_id:14, status_id:4}
            ]

)