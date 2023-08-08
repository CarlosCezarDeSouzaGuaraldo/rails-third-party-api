# rails-third-party-api
This repository serves as a practical playground to explore how to use a third-party API in a Rails application. The focus of this project is on integrating the "Rick and Morty API" into a Rails environment, showcasing the process of fetching and displaying data from an external service.

## Steps:

To run the applicaton:

```bash
  $ docker compose run web rake db:create
  $ docker compose up
```

When the application is running, you can access the API endpoint for character data by visiting the following URL in your web browser:

`http://0.0.0.0:3000/pages/api/:id`

> Replace `:id` with the specific ID of the character you want to retrieve from the Rick and Morty API.

To run the rspec tests:

```bash
  docker compose run --rm web bundle exec rspec
```
