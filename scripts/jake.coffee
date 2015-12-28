module.exports = (robot) ->
  # your code here

  robot.respond /jake me/i, (res) ->
    jakes = robot.brain.get('jakes') * 1 or 0
    robot.brain.set 'jakes', jakes+1
    res.send "jake gif " + jakes

  robot.hear /.gif/i, (res) ->
    name = res.message.user.name.toLowerCase()
    res.send "heard gif from " + name
