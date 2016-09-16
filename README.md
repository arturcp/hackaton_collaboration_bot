# Hackaton collaboration bot

[![CircleCI](https://circleci.com/gh/youse-seguradora/youse.svg?&style=shield&circle-token=4832d496dfedf7343703c1ecc1398984f7495228)](https://circleci.com/gh/arturcp/hackaton_collaboration_bot)

Hackaton Collaboration Bot is a Webhook created to encourage teams to interact
with each other during a hackaton by sending special messages on messaging apps
(like slack, for example). The idea for this repo was stolen from the [Khan Academy thematic hackaton](http://engineering.khanacademy.org/posts/healthy-hackathons.htm).

The first version is integrated with slack by using the
[slack webhook](https://rubyslackapi.slack.com/services/B1RQD447R?added=1). The hook
captures messages starting with a specific text (such as `1 point to`) and
assigns points to the team indicated in the original message

The example included in the `seeds.rb` uses Harry Potter `Houses` as teams:

  * Gryffindor
  * Hufflepuff
  * Ravenclaw
  * Slytherin

For example, if a slack users sends a message like '1 point to \`Ravenclaw\`
because Jane Roe helped me a lot in my project', Ravenclaw will receive a point
and a link to the hackaton dashboard will be returned to the users. Please notice
that the team name must be enclosed between backticks (`).

Check it out:

![](http://g.recordit.co/5QHNmRlbIB.gif)

## Hackaton settings

To configure the response messages, each hackaton is built with specific
attributes relative to how the messages will be delived back to the users. The
valid attributes are:

  * success_pretext:

    This message will be interpolated with three other variables before being
    sent back to the users:

    * team_name: the name of the team that has just received points
    * points: the total points assigned to the team
    * dashboard_url: the url to the dashboard of the current hackaton

    To use these variables, include in your hackaton `success_pretext` the pattern
    `%{variable_name}`. For example, you can configure your outgoing message as:

    `%{team_name} has now %{points} points! Check the house cup dashboard in %{dashboard_url}`

    It will be displayed in the first line of the message.

  * success_text:

    This message will be interpolated with the team name before being
    sent back to the users. For example, you can configure your outgoing message as:

    `Good work, %{team_name}!

    It will be displayed above the image, as if it was the image caption. **The
    success image will be the avatar of the team that is receiving the points**.

  * error_pretext:

    It does not accept any parameters and will not interpolate. This string will
    be the text displayed on the messaging app if a user tries to give points to
    a team that does not exist, for example.

  * error_color:

    A vertical bar is inserted at the left of the error message. This attribute
    allows you to choose the color of the bar.

  * error_image:

    An image to be displayed with the error message.

  * error_text:

    A text that works as a caption for the image above


## Setup

Just run the setup script to configure the app:

```bash
  bin/setup
```

Now you should be able to run the tests:

```bash
  bin/rspec
```

To run the the app:

```bash
  bin/rails server
```

## Environment dependencies

  * Ruby 2.3.1
  * PostgreSQL


## Admin Panel

There is an admin panel to configure the hackatons. It is accessible on the `/admin`
url and the user and password are set through env variables (ADMIN_USER and
ADMIN_PASSWORD).

## Dashboard

There is a dashboard with the points of each team. It is accessible on the
`/dashboard` url.


## TODO
  * Allow easy configuration of teams
  * List users per team and prevent them to award points to their teams
  (maybe some points should be removed from the team as a punishment)
  * Allow many hackatons at the same time. Each team must be linked to one
  Hackaton, and they should be able to coexist
