# Hogwarts bot

[![CircleCI](https://circleci.com/gh/youse-seguradora/youse.svg?&style=shield&circle-token=4832d496dfedf7343703c1ecc1398984f7495228)](https://circleci.com/gh/arturcp/hogwarts_bot)

Hogwarts bot is a [Slack Webhook](https://rubyslackapi.slack.com/services/B1RQD447R?added=1)
created to allow teams to interact with each other in a hackaton by sending special messages on slack. The
idea for this code came from this [Khan Academy thematic hackaton](http://engineering.khanacademy.org/posts/healthy-hackathons.htm).

This hook captures messages starting with `1 point to` and adds a point to the house indicated by the original message.
The `Houses` concept comes from Harry Potter world:

* Gryffindor
* Hufflepuff
* Ravenclaw
* Slytherin

For example, if a slack users sends a message like `1 point to Ravenclaw because Jane Roe helped me a lot in my project`,
Ravenclaw will receive a point and a link to the house cup panel will be returned to the users.


## Setup

Just run the setup script to configure the app:

```bash
  bin/setup
```

Now you should be able to run the tests:

```bash
  bin/rspec
```

Run the the app:

```bash
  bin/rails server
```

## Environment dependencies

*   Ruby 2.3.1
*   PostgreSQL
