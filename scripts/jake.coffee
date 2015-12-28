module.exports = (robot) ->
  # your code here

  eric_gif = (url) ->
    erics = robot.brain.get('erics')
    erics = url if not erics
    erics = erics.split(':::')
    index = erics.indexOf(url)
    if index < 0
      erics.push(url)
      erics = erics.join(":::")
      robot.brain.set 'erics', erics

  robot.respond /jake me/i, (res) ->
    jakes = robot.brain.get('jakes') * 1 or 0
    robot.brain.set 'jakes', jakes+1
    res.send "jake gif " + jakes

  robot.respond /eric me/i, (res) ->
    erics = robot.brain.get('erics')
    erics = erics.split(':::')
    res.send res.random erics

  robot.hear /(.+.gif)/i, (res) ->
    name = res.message.user.name.toLowerCase()
    url = res.match[1]

    expression = /\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/i;
    regex = new RegExp(expression);

    if url.match(regex) and (name == 'e-jameson' or name == 'shell')
      eric_gif(url)
      # res.send "heard gif from " + name + "( " + url + ")"
      erics = robot.brain.get('erics')
