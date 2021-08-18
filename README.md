# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

rails g model Player first_name:string last_name:string height:integer weight:integer birthday:string graduation_year:integer position:string recruit:boolean

rails g model Tournament name:string city:string state:string start_date:date

rails g model Team name:string age_group:string coach:string

rails g model User email:string password:string

rails g model Assessment rating:integer assessment_type:string user:references tournament:references player:references

rails g model Note user:references note:string assessment:references





rails d model Player first_name:string last_name:string height:integer weight:integer birthday:string graduation_year:integer position:string recruit:boolean

rails d model Tournament name:string city:string state:string start_date:date

rails d model Team name:string age_group:string coach:string

rails d model User email:string password:string

rails d model Assessment rating:integer assessment_type:string user:references tournament:references player:references

rails d model Note user:references note:string assessment:references





rails g controller api/v1/Notes 

rails g controller api/v1/Players 

rails g controller api/v1/Tournaments 

rails g controller api/v1/Teams 

rails g controller api/v1/Users 

rails g controller api/v1/Assessments 
# captainu_api
# captainu_api
