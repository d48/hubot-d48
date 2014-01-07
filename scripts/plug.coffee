# Description:
#   A way to get/set plug.dj link
#
# Commands:
#   hubot plug me <url> - Gets plug.dj url saved 
#   hubot plug save <url> - Saves plug.dj url

request = require('request')

module.exports = (robot) ->
  robot.respond /plug me/i, (msg) ->
    plugMe '', (url) ->
      msg.send "plug.dj url is: #{url}"

  robot.respond /plug save (http:\/\/(www.)?plug.dj\/.*)/i, (msg) ->
    plugMe msg.match[2], (url) ->
      msg.send "plug url has been saved"

plugMe = (query, cb) ->
  options = 
    url: 'http://design48.net/api'
    qs: tturl: query
    json: true

  request options, (err, res, body) ->
    if !err and res.statusCode == 200
      cb body.tturl
