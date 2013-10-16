# Description:
#   responses to sigh 
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

sigh_lines = [
  "Girl look at that body",
  "mmm hmmm, you're so fly",
  "I work out. Look at my arms bro",
  "Sup, how you doin?"
]

module.exports = (robot) ->
  robot.hear /(sigh)/i, (msg) ->
    msg.send msg.random sigh_lines
