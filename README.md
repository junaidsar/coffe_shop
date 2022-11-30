# README

# Requirements

* Ruby version: `2.7.6`
* Database: `Sqlite3`
* Rails: `7.0.3`

# How to run the project

* `bundle install`
* `rake db:create`
* `rake db:migrate`
* `rake db:seed`
* `rails s`


# How to run the test suite
	
I used minitest for the item and order tests, You can use following command to execute the tests
* `rails test`

# Database Schema

Here are the Entities we created for this:
- Item
- Order
- Order_item [midle table for many to many]
- Discount

<img width="571" alt="image" src="https://user-images.githubusercontent.com/93181848/204894873-88ec748c-a938-470b-91af-fa7fa510c1d6.png">

# Endpoints

For the purpose of this exercise all the endpoints are open [No authentication required]
You can access the documentation via this postman export link: https://www.getpostman.com/collections/59854f781334599ee428
