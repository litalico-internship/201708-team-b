$(document).ready ->
  coordinates = ""
  $.ajax
    url: '/api/maps/get_location'
    type: 'GET'
    success: (data)->
      initializeMap(data)

initializeMap = (data) ->
  mymap = L.map('map').setView([
    data[0]
    data[1]
  ], 5)
  L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiamlqaWltYWMiLCJhIjoiY2o2aXNwMXQ5MHdxZzJybXFmbnNmZmZidyJ9.pqeK5-VL5jI3d8g5lFTLkA',
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>'
    maxZoom: 18
    id: 'mapbox.streets'
    accessToken: 'pk.eyJ1IjoiamlqaWltYWMiLCJhIjoiY2o2aXNwMXQ5MHdxZzJybXFmbnNmZmZidyJ9.pqeK5-VL5jI3d8g5lFTLkA').addTo mymap
  circle = L.circle([
    data[0]
    data[1]
  ],
    color: 'red'
    radius: 80000).addTo(mymap)
  $.ajax
    url: '/api/users/get_all_users'
    type: 'GET'
    success: (data)->
      initializeMarkers(data, mymap)

initializeMarkers = (data, mymap) ->
  _.each(data, (user, index, array) ->
    marker = L.marker([user.latitude, user.longitude]).addTo(mymap)
    marker.bindPopup("<b>" + user.nickname + "さん</b><br><a href='http://0.0.0.0:3000/users/" + user.id + "'>プロフィールを見る</a>")
  )
