# Description:
#   Insert iframe into chat window
#
# Commands:
#   iframe|ifr me <url> - inserts iframe into chat window with src set to url and dimensions set to 500x500
#   iframe|ifr me <url> <width> - inserts iframe into chat window with url and width set, height is blank
#   iframe|ifr me <url> <width> <height> - inserts iframe into chat window with url, width and height set

request = require('request')

module.exports = (robot) ->
  robot.hear /(iframe|ifr) me (.*)/i, (msg) ->
    iframeMe msg.match[2], (html) ->
      msg.send "here you go mang"
      msg.send html

iframeMe = (params, cb) ->
  parts = params.split " "
  htmlStart = "<iframe src=\"#{parts[0]}\""
  htmlEnd = "</iframe>"

  if not parts[1]? and not parts[2]?
    iWidth = 500
    iHeight = 500
  else
    iWidth = if parts[1]? then parts[1] else ""
    iHeight = if parts[2]? then parts[2] else ""

  htmlString = htmlStart + " width=\"" + iWidth + "\" height=\"" + iHeight + "\" >" + htmlEnd
  cb htmlString
