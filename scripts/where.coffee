# Description:
#   responses to where
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   where  
#
# Author:
#   d48 

where_lines = [
  "Over there dude, over there.",
  "Behind the stove.",
  "Did you trying looking in the fridge?",
  "Dude, I told you already.",
  "Stop bugging me.",
  "Try google maps, it may help.",
  "Just use `require`, you'll find it",
  "Ahhhhh, over there.",
  "Now I found it. Thanks."
]

module.exports = (robot) ->
  robot.hear /(where)/i, (msg) ->
    msg.send msg.random where_lines
