# README

It  contain a calendar backend implementation which includes following API's

1 - User login http://localhost:3000/api/users/login
2 - User register http://localhost:3000/api/users
3 - user info http://localhost:3000/api/user
4 - update user http://localhost:3000/api/user
5 - create event http://localhost:3000/api/events
6 - update event http://localhost:3000/api/events/1
7 - show/detail event http://localhost:3000/api/events/1
8 - my event listing by date http://localhost:3000/api/events/?date=2020-09-22

As far as app architecture is consider  I implemented it using docker for deployment and used JWT for authentication and used postgres as  database

It also contain the postman api collection for  trying it.

Command to run the project using docker

'docker-compose up --build'

after building the docker image it can be stop with

'docker-compose down'

and can be restarted with

'docker-compose up'

