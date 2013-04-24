# Description:
#   Responds to bro
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   bro me - Returns random string with bro
#
# Author:
#   d48 
brocab = require('brocabulary')

bro_prefix = [
  "Over there dude, over there",
  "Behind the stove",
  "Did you trying looking in the fridge",
  "Dude, I told you already",
  "Stop bugging me",
  "Try google maps, it may help",
  "Just use `require`, you'll find it",
  "Ahhhhh, over there",
  "Now I found it. Thanks"
]

module.exports = (robot) ->
  robot.respond /bro me/i, (msg) ->
    prefix = msg.random bro_prefix
    broMe (broism) ->
      msg.send prefix + " " + broism

broMe = (cb) ->
  brocab (dict) ->
    cb dict.random()
