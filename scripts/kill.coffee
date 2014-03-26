# Description:
#   kills something
#
# Commands:
#   hubot kill <name> - responds with "<name> has been killed <picture of death>

deathImageUrl = "http://s.bebo.com/img/emoji/emoji-E410.png"

module.exports = (robot) ->
  robot.respond /kill (.*)/i, (msg) ->
    name = msg.match[2]
    msg.send "#{name} has been killed #{deathImageUrl}"
