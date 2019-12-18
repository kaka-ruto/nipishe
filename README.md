# Nipishe

A Rails + GraphQL starter kit template with authentication, authorization and basic user account management features

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them; https://gorails.com/setup
is a good one

```
Ruby -v 2.5.0,
Rails -v 5.2.1
```

### Installing

A step by step series of examples that tell you how to get your development environment up and running

## Without Docker

Install postgresql:

```
brew install postgresql
```

Clone the project:

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

I'll be giving examples on how you can get started on OS X (mac). If you're
using a different OS, please Google it and once you have the steps working for
you, come back and raise a PR for the same here :), because this is OSS

# Getting Started on Mac OS X

Install VirtualBox and Homebrew Cask
```
brew install caskroom/cask/brew-cask
brew cask install virtualbox
```

Install Docker and Docker Machine
```
brew install docker docker-machine
```

Create a new VM in Virtualbox named default, then run it
```
docker-machine create --driver virtualbox default
docker-machine start default
```

Export the Docker environment variables to your shell(you'd have to run this on
every new terminal session)
```
eval "$(docker-machine env default)"
```

To make your work easier, add the previous command to your `.bashrc` or `zshrc` file, so that it's available any time you subsequently open a terminal.
```
eval $(docker-machine env default)
```

Install Docker Compose
```
brew install docker-compose
```

# Provisioning the app
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

To use the GraphiQL web interface make sure you have a file at app/assets/config/manifest.js with the following content:

```
//= link graphiql/rails/application.css
//= link graphiql/rails/application.js

```
 
You're all set! Now you're ready to code!

### GraphQL

Todo: Show how to run mutations and queries on the API


### Tests

Run the tests

```
bin/rspec
```


### Deployment

Todo: Add notes about how to deploy this on a live system


### Built With

* [Ruby on Rails](https://rubyonrails.org/) - The loved web framework
* [GraphQL](https://graphql.org/) - A query language and runtime for APIs


### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

