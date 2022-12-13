import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

const String apiKey = "MyApiKey";

Future<Set<Marker>> getMarkers(void Function(Place) callback) async {
  Set<Place> places = await getPlaces();
  Set<Marker> markers = {};
  places.toList().asMap().forEach((k, v) {
    markers.add(Marker(
      markerId: MarkerId(k.toString()),
      position: v.latlng,
      onTap: () => callback(v),
    ));
  });
  return markers;
}

// DBから取得する想定
Future<Set<Place>> getPlaces() async {
  LatLng latLng1 = LatLng(37.42747752203552, -122.08057852883495);
  LatLng latLng2 = LatLng(37.42246006639176, -122.08409675340478);
  LatLng latLng3 = LatLng(37.41746006639176, -122.08409675340478);
  LatLng latLng4 = LatLng(37.42546006639176, -122.09809675340478);
  Set<Place> places = {};
  [latLng1, latLng2, latLng3, latLng4].asMap().forEach((int i, LatLng v) {
    places.add(Place(
      name: "place${i}",
      info: "it is place ${i}",
      latlng: v,
    ));
  });
  return places;
}

Future<Set<Polyline>> getLines() async {
  Set<MapRoute> routes = await getRoutes();
  Set<Polyline> lines = {};
  for (int i = 0; i < routes.length; i++) {
    var route = routes.elementAt(i);
    List<LatLng> polylineCoordinates = [];
    polylineCoordinates.add(route.origin);
    List<LatLng> result = await getPolylineResult(
        route.origin, route.destination, route.wayPoints);
    polylineCoordinates.addAll(result);
    polylineCoordinates.add(route.destination);
    lines.add(Polyline(
      polylineId: PolylineId(i.toString()),
      jointType: JointType.round,
      points: polylineCoordinates,
      color: Colors.blue,
    ));
  }
  ;
  return lines;
}

// DBから取得する想定
Future<Set<MapRoute>> getRoutes() async {
  LatLng latLng1 = LatLng(37.42747752203552, -122.08057852883495);
  LatLng latLng2 = LatLng(37.42246006639176, -122.08409675340478);
  LatLng latLng3 = LatLng(37.41746006639176, -122.08409675340478);
  LatLng latLng4 = LatLng(37.42546006639176, -122.09809675340478);
  return {
    MapRoute(
      origin: latLng1,
      destination: latLng2,
    ),
    MapRoute(
      origin: latLng1,
      destination: latLng2,
      wayPoints: [
        latLng3,
        latLng4,
      ],
    ),
  };
}

Future<List<LatLng>> getPolylineResult(
    LatLng origin, LatLng destination, List<LatLng> wayPoints) async {
  var params = {
    "origin": "${origin.latitude},${origin.longitude}",
    "destination": "${destination.latitude},${destination.longitude}",
    "mode": "driving",
    "avoidHighways": "false",
    "avoidFerries": "true",
    "avoidTolls": "false",
    "key": apiKey
  };
  if (wayPoints.isNotEmpty) {
    List wayPointsArray = [];
    wayPoints.forEach((point) {
      String encoded = encodePolyline([
        [point.latitude.toDouble(), point.longitude.toDouble()]
      ]);
      wayPointsArray.add("enc:${encoded}:");
    });
    String wayPointsString = wayPointsArray.join('|');
    params.addAll({"waypoints": wayPointsString});
  }
  Uri uri =
      Uri.https("maps.googleapis.com", "maps/api/directions/json", params);
  var response = await http.get(uri);
  List<LatLng> polylineCoordinates = [];
  if (response.statusCode != 200) {
    return [];
  }
  var parsedJson = json.decode(response.body);
  if (parsedJson["status"]?.toLowerCase() != "ok" ||
      parsedJson["routes"] == null ||
      parsedJson["routes"].isEmpty) {
    return [];
  }
  List<List<num>> points =
      decodePolyline(parsedJson["routes"][0]["overview_polyline"]["points"]);
  points.forEach((point) {
    polylineCoordinates.add(LatLng(point[0].toDouble(), point[1].toDouble()));
  });
  return polylineCoordinates;
}

class Place {
  LatLng latlng;
  String name;
  String info;
  Place({this.name = "", this.info = "", this.latlng = const LatLng(0, 0)});
}

class MapRoute {
  LatLng origin;
  LatLng destination;
  List<LatLng> wayPoints;
  MapRoute(
      {this.origin = const LatLng(0, 0),
      this.destination = const LatLng(0, 0),
      this.wayPoints = const []});
}
