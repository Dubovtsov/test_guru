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

## Тест Гуру

**Test**
* id
* title
* level
* category_id

**Category**
* id
* title

**Question**
* id
* body
* test_id

**Answer**
* id
* body
* correct
* question_id

**User**
* id
* login
* email

**Сompleted_test**
* user_id
* test_id
