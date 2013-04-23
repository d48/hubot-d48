# Description:
#   Insert iframe into chat window
#
# Commands:
#   iframe me <url> - inserts iframe into chat window with src set to url

request = require('request')

module.exports = (robot) ->
  robot.hear /(iframe|ifr) me (.*)/i, (msg) ->
    iframeMe msg.match[2], (html) ->
      msg.send "here you go mang"
      msg.send html

iframeMe = (url, cb) ->
  html = "<iframe src=\"#{url}\"></iframe>"
  cb html
