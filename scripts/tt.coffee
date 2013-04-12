# Description:
#   A way to get/set turntable.fm link
#
# Commands:
#   hubot tt me <url> - Gets turntable.fm url saved 
#   hubot tt save <url> - Saves turntable.fm url

request = require('request')

module.exports = (robot) ->
  robot.respond /(tt|turntable) me/i, (msg) ->
    ttMe '', (url) ->
      msg.send "tt url is: #{url}"

  robot.respond /(tt|turntable) save (http:\/\/(www.)?turntable.fm\/.*)/i, (msg) ->
    ttMe msg.match[2], (url) ->
      msg.send "tt url has been saved"

ttMe = (query, cb) ->
  options = 
    url: 'http://design48.net/api'
    qs: tturl: query
    json: true

  request options, (err, res, body) ->
    if !err and res.statusCode == 200
      cb body.tturl
