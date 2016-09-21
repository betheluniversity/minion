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
        res.send({
            attachments: [{
                title: 'Cascade Status',
                fallback: 'Cascade Status',
                fields: [{
                    title: "Status",
                    value: "#{body}",
                    short: false
                }],
            }],
            username: process.env.HUBOT_SLACK_BOTNAME,
            as_user: true,
        });

  robot.respond /cascade workflows/i, (res) ->
    robot.http("https://wsapi.bethel.edu/cascade/workflows")
      .get() (err, rs, body) ->
        if err
          rs.reply "Unable to load status from Cascade. Is it down?"
          robot.emit 'error', err, rs
          return
        res.send "#{body}"
