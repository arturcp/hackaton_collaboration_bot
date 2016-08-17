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

For example, if a slack users sends a message like '1 point to \`Ravenclaw\` because Jane Roe helped me a lot in my project',
Ravenclaw will receive a point and a link to the house cup panel will be returned to the users. Notice that the house name must
be enclosed between backticks (`)

Check it out:

![](http://g.recordit.co/5QHNmRlbIB.gif)

To configure the response messages, all you need to do is to set the attributes
in the House Cup entry:

  * success_text:

    it will interpolate your message with three variables:

    * house_name: the name of the house that has just received points
    * points: the total points of the given house
    * dashboard_url: the url to the dashboard

    To use these variables, include in your success response string the pattern
    `%{ variable_name }`. For example, you can configure your outgoing message as:

    `%{house_name} has now %{points} points! Check the house cup dashboard in %{dashboard_url}`

  * error_text:

    it does not accept any parameter. The string in the variable will be the text displayed
    on slack if a user tries to give points to a house that does not exist, for example.

  * error_color:

    a vertical bar is inserted at the left of the error message. This attribute
    allows you to choose the color of the bar.

  * error_pretext:

    a small text that will be prepend above the error image

  * error_image:

    an image to be displayed when an error occurs.


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

  * Ruby 2.3.1
  * PostgreSQL


# Dashboard

There is an admin panel to configure the hackatons. It is accessible on the `/admin`
url and the user and password are set through env variables (ADMIN_USER and
ADMIN_PASSWORD).

# Dashboard

There is a dashboard with the points of each house. It is accessible on the `/dashboard` url.


# TODO
  * Allow easy configuration of houses
  * List users per house and prevent them to award points to their houses (maybe some points should be removed from the house as a punishment)
  * Allow many hackatons at the same time. Each house must be linked to one HouseCup, and they should be able to coexist
