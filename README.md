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

## Without Docker / The Normal Rails Way (Preferred for development)

Install Postgresql

```
brew install postgresql
```

Clone the project to your own directory, eg `project_z`

```
git clone https://github.com/borenho/nipishe.git project_z
```

Use `sed` to find and replace all appearances of `Nipishe` to `Project_Z`, for example.

If you're on `zsh`, the following command will work

```
sed -i 's/NipisheSchema/ProjectZSchema/g' **/*.rb(D.)
sed -i 's/Nipishe/ProjectZ/g' **/*.rb(D.)
```

You can read more about search and replacing with sed here - https://unix.stackexchange.com/questions/112023/how-can-i-replace-a-string-in-a-files

If you're using Vim, I found this helpful https://vi.stackexchange.com/questions/2776/vim-search-replace-all-files-in-current-project-folder

Please crosscheck manually if there are still appearances of Nipishe or NipisheSchem and rename appropriately.

You'll also find that there are, for example database names, that start with `nipishe_development`. Find and replace those manually too, they are few.

If you check origins, you'll find that they point to `https://github.com/kaka-ruto/nipishe.git` or `git@github.com:kaka-ruto/nipishe.git`, plase change them to your own with the following

```
git remote set-url git@github.com:YOUR-USERNAME/YOUR-REPO.git
```

Confirm it's been correctly set with `git remote -v`

Open your `/etc/hosts` file

```
sudo vim /etc/hosts
```

Map your machine's Postgres db host `localhost` to docker's db host `postgres`, which we
have defined in `docker-compose.yml` and referenced in `config/database.yml`

```
# /etc/hosts
127.0.0.1   postgres
```

Change directory (cd) into `nipishe` and set up your development environment:

```
bin/setup
```

Start the Rails server

```
bin/rails server
```

Open the application at http://localhost:3000

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

Open the application at http://localhost:3000

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
