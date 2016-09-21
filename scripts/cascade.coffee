# Description:
#   Have Hubot check the status of Casacde.
#
# Commands:
#   hubot cascade status - check the status of Casacde.
#
# Author:
#   e-jameson
#

module.exports = (robot) ->
  robot.respond /cascade status/i, (res) ->
    robot.http("https://wsapi.bethel.edu/cascade/status")
      .get() (err, rs, body) ->
        if err
          rs.reply "Unable to load status from Cascade. Is it down?"
          robot.emit 'error', err, rs
          return
        res.send "#{body}"


  robot.respond /cascade workflows/i, (res) ->
    res.send({
      "attachments": [
          {
              "fallback": "Cascade Status",
              "color": "#36a64f",
              "author_name": "Minion",
              "title": "Workflow Status",
              "title_link": "https://wsapi.bethel.edu/cascade/workflows"
          }
      ]
    })
