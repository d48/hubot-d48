# Description:
#   Display a random tweet from loudbot if someone YELLS in chat
#
# Dependencies:
#    "ntwitter" : "https://github.com/sebhildebrandt/ntwitter/tarball/master",
#
# Configuration:
#   HUBOT_TWITTER_CONSUMER_KEY
#   HUBOT_TWITTER_CONSUMER_SECRET
#   HUBOT_TWITTER_ACCESS_TOKEN_KEY
#   HUBOT_TWITTER_ACCESS_TOKEN_SECRET
#
# Commands:
#   CHAT LIKE THIS - Returns a random tweet from loudbot in caps
#
#
# Author:
#   d48

ntwitter = require 'ntwitter'
inspect = require('util').inspect


module.exports = (robot) ->
  auth =
    consumer_key: process.env.HUBOT_TWITTER_CONSUMER_KEY
    consumer_secret: process.env.HUBOT_TWITTER_CONSUMER_SECRET
    access_token_key: process.env.HUBOT_TWITTER_ACCESS_TOKEN_KEY
    access_token_secret: process.env.HUBOT_TWITTER_ACCESS_TOKEN_SECRET

  twit = undefined
  myRobot = process.env.HUBOT_NAME 

  # robot.hear /(^[^a-z]*$)/, (msg) ->
  robot.hear /(kaya)/, (msg) ->
    unless auth.consumer_key
      msg.send "Please set the HUBOT_TWITTER_CONSUMER_KEY environment variable."
      return
    unless auth.consumer_secret
      msg.send "Please set the HUBOT_TWITTER_CONSUMER_SECRET environment variable."
      return
    unless auth.access_token_key
      msg.send "Please set the HUBOT_TWITTER_ACCESS_TOKEN_KEY environment variable."
      return
    unless auth.access_token_secret
      msg.send "Please set the HUBOT_TWITTER_ACCESS_TOKEN_SECRET environment variable."
      return

    twit ?= new ntwitter auth

    twit.verifyCredentials (err, data) ->
      num = Math.floor(Math.random() * 15) + 1

      if err
        msg.send "Encountered a problem verifying twitter credentials :(", inspect err
        return

      if not robot.brain.data.statuses?
        twit.getUserTimeline {'screen_name':'loudbot', 'count': '15'}, (err, data) ->
          if err
            msg.send "Encountered a problem twitter searching :(", inspect err
            return

          if data
            robot.brain.data.statuses = data
            robot.brain.emit 'save'
            msg.send data[num].text

      else
        msg.send msg.random robot.brain.data.statuses[num].text
