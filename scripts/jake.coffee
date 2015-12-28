module.exports = (robot) ->
  # your code here

  robot.respond /jake me/i, (res) ->
    jakes = robot.brain.get('jakes') * 1 or 0
    robot.brain.set 'jakes', jakes+1
    res.send "jake gif " + jakes

  robot.hear /(.+.gif)/i, (res) ->
    name = res.message.user.name.toLowerCase()
    url = res.match[1]

    expression = /\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/i;
    regex = new RegExp(expression);

    if url.match(regex) and name == 'e-jameson'
      res.send "heard gif from " + name + "( " + url + ")"
