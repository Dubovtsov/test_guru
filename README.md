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
* answer
* test_id

**Answer**
* id
* body
* correct
* question_id

**User**
* id
* login
* password
* first_name
* last_name
* admin

**Сompleted_test**
* user_id
* test_id
* question_id
* answer_id
* rating