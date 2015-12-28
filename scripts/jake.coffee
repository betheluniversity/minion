module.exports = (robot) ->

  jake_gif = (url) ->
    jakes = robot.brain.get('jakes')
    jakes = url if not jakes
    jakes = jakes.split(':::')
    index = jakes.indexOf(url)
    if index < 0
      jakes.push(url)
      jakes = jakes.join(":::")
      robot.brain.set 'jakes', jakes

  robot.respond /jake me/i, (res) ->
    jakes = robot.brain.get('jakes')
    jakes = jakes.split(':::')
    res.send res.random jakes

  robot.hear /(.+.gif)/i, (res) ->
    name = res.message.user.name.toLowerCase()
    url = res.match[1]

    expression = /\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/i;
    regex = new RegExp(expression);

    if url.match(regex) and name == 'johjacb'
      # add the gif to the list
      jake_gif(url)
