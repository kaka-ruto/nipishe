# Nipishe

A Rails + GraphQL starter kit template with authentication, authorization and basic user account management features

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## Prerequisites

What things you need to install the software and how to install them; https://gorails.com/setup
is a good one

```
Ruby -v 2.5.0,
Rails -v 5.2.1
```

# Installation Instructions

A step by step series of examples that tell you how to get your development environment up and running

## Without Docker / The Normal Rails Way

Install Postgresql

```
brew install postgresql
```

Clone the project

```
git clone https://github.com/borenho/nipishe.git
```

Change directory (cd) into `nipishe` and set up your environment:

```
bin/setup
```

Start the Rails server

```
bin/rails server
```

## With Docker
Docker will allow us to containerize our app into a light-weight, stand-alone
and executable package of a piece of software that includes everything needed to run
it, be it the OS, libraries, gems and any other dependency.

### Installing Docker
For Mac users, download Docker for mac on https://github.com/docker/for-mac

For Windows users, get docker on https://github.com/docker/for-win

If you are on Ubuntu, the following steps are recommended:

Update your local database of software to get the latest revisions

```
sudo apt-get update
```

Get/download Docker

```
sudo apt install docker.io
```

Start and automate Docker
```
sudo systemctl start docker
```
```
sudo systemctl enable docker
```

### Installing Docker Compose

```
brew install docker-compose
```

### Provisioning the app
Clone the project:

```
git clone https://github.com/borenho/nipishe.git
```

Change directory (cd) into `nipishe`.
Set up your docker environment, by building the docker image
```
docker-compose build
```

Setup the database(create, migrate, seed)
```
docker-compose run runner ./bin/setup
```

Now run the sweet Rails app
```
docker-compose up rails
```

Open the application

```
http://localhost:3000
```

To use the GraphiQL web interface make sure you have a file at `app/assets/config/manifest.js` with the following content:

```
//= link graphiql/rails/application.css
//= link graphiql/rails/application.js

```

You're all set! Now you're ready to code!

# GraphQL

Todo: Show how to run mutations and queries on the API


## Tests

Run the tests

```
bin/rspec
```


# Deployment

Todo: Add notes about how to deploy this on a live system


### Built With

* [Ruby on Rails](https://rubyonrails.org/) - The loved web framework
* [GraphQL](https://graphql.org/) - A query language and runtime for APIs


### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

