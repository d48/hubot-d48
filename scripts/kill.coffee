# Description:
#   kills something
#
# Commands:
#   hubot kill <name> - responds with "<name> has been killed <picture of death>

deathEmoji = ':skull:'

module.exports = (robot) ->
  robot.respond /kill (.*)/i, (msg) ->
    name = msg.match[1]
    msg.send "#{name} has been killed #{deathEmoji}"
