import 'package:app_14_03_route/route_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:latlong2/latlong.dart';

class MapaHome extends StatefulWidget
{
  const MapaHome({Key? key}) : super(key: key);

  @override
  State<MapaHome> createState() => _MapaHomeState();
}

class _MapaHomeState extends State<MapaHome>
{
  final RouteAPI osmrConnect = Get.put(RouteAPI());
  final MapController _controller = MapController();

  //TODO ADICIONAR PONTOS DE TESTE AQUI
  List<LatLng> _points = [ LatLng(-5.2031232,-37.326215), LatLng(-5.1718734,-37.4145734) ];

  // route polyline points
  List<LatLng> _ppoints = [ ];
  
  // METHOD TO CREATE POLYLINE
  void _setPolyline() async 
  {
    var response = await osmrConnect.getRouteFromLatLng(_points);
    if (response.isOk) {
      var data = RouteAPI.getMap(response);
      if (data == null) {
        return;
      }
      var dataList = (data['routes'] as List<dynamic>).elementAt(0);
      var polyline = dataList['geometry'];

      final decodedPolyline = decodePolyline(polyline);
      print(decodedPolyline);
      for (List<num> element in decodedPolyline) {
        _ppoints.add(LatLng(
            element.elementAt(0).toDouble(), element.elementAt(1).toDouble()));
      }
    }
  }

  @override
  void initState() {
    _setPolyline();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return FlutterMap(
      mapController: _controller,
      options: MapOptions(
          maxZoom: 18,
          center: LatLng(-5.2031232,-37.326215),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        PolylineLayer(
          polylines: [
            Polyline(points: _ppoints, strokeWidth: 5, color: Colors.blue),
          ],
        ),
      ],
    );
  }
}
