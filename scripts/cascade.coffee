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
        #res.send "#{body}"
        # create the message with attachment object
        msgData = {
          channel: res.message.room
          text: "Cascade Status"
          attachments: [
            {
              fallback: "",
              title: "Cascade Status"
              title_link: ""
              text: body
              mrkdwn_in: ["text"]
            }
          ]
        }

        # post the message
        robot.adapter.customMessage msgData
        # robot.emit 'slack-attachment',
        # message:
        #   room: msg.message.room
        # content: body
