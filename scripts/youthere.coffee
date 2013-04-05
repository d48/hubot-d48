# Description:
#   responses to you there
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

youthere_lines = [
  "Nope. Yup.",
  "mmmmmm hmmmmmmmmmmmmmmmm",
  "No.",
  "Dude, I'm here. Stop bugging me.",
  "[*cricket, cricket, cricket]",
  "Fo sho homeboy. What you want?",
  "Let's see. If I say no, he'll know I'm here."
]

module.exports = (robot) ->
  robot.hear /(you|u)( there)/i, (msg) ->
    msg.send msg.random youthere_lines
