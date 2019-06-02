# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.6.3

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Сущности проекта Тест Гуру

**Test**
* title
* level
* category_id

**Category**
* title

**Question**
* body
* answer
* test_id

**Answer**
* user_id
* test_id
* question_id
* user_answer
* rating

**User**
* login
* password
* first_name
* last_name
* admin
