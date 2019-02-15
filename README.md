# Sokoplace

Delivery logistics for Africa

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

A step by step series of examples that tell you how to get a development env running

Install postgresql:

```
brew install postgresql
```

Clone the project:

```
git clone https://github.com/sokoplace/sokoplace.git
```

Change directory (cd) into `sokoplace` and set up your environment:

```
bin/setup
```

Start the Rails server

```
bin/rails server
```

Open the application

```
http://localhost:3000
```

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


### Acknowledgments

* DHH
* Sandi Metz
* Martin Fowler
