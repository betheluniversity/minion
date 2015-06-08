# Description:
#   Reply with stuff vedmic says
#
# Dependencies:
#  "ntwitter": "0.2.10"
#
# Configuration:
#   HUBOT_TWITTER_CONSUMER_KEY
#   HUBOT_TWITTER_CONSUMER_SECRET
#   HUBOT_TWITTER_ACCESS_TOKEN_KEY
#   HUBOT_TWITTER_ACCESS_TOKEN_SECRET
#
# Commands:
#   None
#
# Author:
#   Eric Jameson

module.exports = (robot) ->

  robot.hear /vedmic/, (res) ->
    res.send "stuff"
