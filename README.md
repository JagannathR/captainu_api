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

# captainu_api

# Home brew installation(In mac if missing)
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Installing ruby env
	brew install rbenv ruby-build

# Add rbenv to bash so that it loads every time you open a terminal
	echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
	source ~/.zshrc

# Install Ruby
	rbenv install 3.0.1
	rbenv global 3.0.1
	ruby -v

# Creating api app
rails new captainu_api --api --mysql
cd myapp

# If you setup MySQL or Postgres with a username/password, modify the
# config/database.yml file to contain the username/password that you specified

# Create the database
	rake db:setup #for first time
	rake db:migrate

	rails server



# Git setup
	
	Create a private/public repo in Github account

	echo "# CaptainU" >> README.md
	git init
	git add README.md
	git commit -m "first commit"
	git branch -M master
	git remote add origin https://github.com/JagannathR/CaptainU.git
	git push -u origin master


# References
	https://gorails.com/setup/osx/11.0-big-sur
	https://gorails.com/setup/osx/11.0-big-sur



# Commands to generate models

	rails g model Player first_name:string last_name:string height:integer weight:integer birthday:string graduation_year:integer position:string recruit:boolean

	rails g model Tournament name:string city:string state:string start_date:date

	rails g model Team name:string age_group:string coach:string

	rails g model User email:string password:string

	rails g model Assessment rating:integer assessment_type:string user:references tournament:references player:references

	rails g model Note user:references note:string assessment:references


# Commands to delete models
	rails d model Player first_name:string last_name:string height:integer weight:integer birthday:string graduation_year:integer position:string recruit:boolean

	rails d model Tournament name:string city:string state:string start_date:date

	rails d model Team name:string age_group:string coach:string

	rails d model User email:string password:string

	rails d model Assessment rating:integer assessment_type:string user:references tournament:references player:references

	rails d model Note user:references note:string assessment:references



# Commands to generate controllers
	rails g controller api/v1/Notes

	rails g controller api/v1/Players

	rails g controller api/v1/Tournaments

	rails g controller api/v1/Teams

	rails g controller api/v1/Users 

	rails g controller api/v1/Assessments


