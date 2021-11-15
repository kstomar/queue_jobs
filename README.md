# Queue Jobs

## Table of contents

* Dependencies
* Set up
* Contributing
* Branches

## Dependencies

* Ruby 3.0.1
* Rails '~> 6.1.4'
* SQL Database: PostgreSQL
* Background Process: Sidekiq

## Set up.

* Install PostgreSQL

    https://www.postgresql.org/docs/11/tutorial-install.html
    https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04

    Follow the steps in any of above links.

* Install Elasticsearch

    https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html


* Clone the repo.

      git clone https://github.com/kstomar/queue_jobs.git

* Install dependencies

      cd queue_jobs
      bundle install

* Add database configuration and add your system user.
```
    cp database.example.yml database.yml
```

* Create database.

```
    rails db:create
```
* Migrate database.

```
    rails db:migrate
```
* Seed database.

```
    rails db:seed
```

* Postman collection - 
  
  https://www.getpostman.com/collections/43569c8ce732e5014914