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

  //ADICIONAR PONTOS DE TESTE AQUI
  List<LatLng> _points = [ LatLng(-5.208434357984569, -37.33252259139461), LatLng(-5.203495107883598, -37.32586032821583) ];

  // lista vazia
  List<LatLng> _ppoints = [  ];
  
  // METHOD TO CREATE POLYLINE
  void _setPolyline() async 
  {
    /// API de Rotas
    var response = await osmrConnect.getRouteFromLatLng(_points);
    if (response.isOk)
    {
      var data = RouteAPI.getMap(response);
      if (data == null) {
        return;
      }

      var dataList = (data['routes'] as List<dynamic>).elementAt(0);
      var polyline = dataList['geometry'];

      final decodedPolyline = decodePolyline(polyline);
      print(decodedPolyline);

      for (List<num> element in decodedPolyline) {
        _ppoints.add(LatLng(element.elementAt(0).toDouble(), element.elementAt(1).toDouble()));
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
          initialCenter: LatLng(-5.2070016,-37.3243035),
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
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(-5.208434357984569, -37.33252259139461),
              width: 100,
              height: 100,
              child: GestureDetector(
                onTap: () => print("Ponto A"),
                child: Icon(Icons.not_started),
              )
            ),
            Marker(
              point: LatLng(-5.203495107883598, -37.32586032821583),
              width: 100,
              height: 100,
              child: GestureDetector(
                onTap: () => print("Ponto B"),
                child: Icon(Icons.flag_circle),
              )
            ),
            Marker(
              point: LatLng(-5.2084390311565025, -37.33178481105348),
              width: 100,
              height: 50,
              child: Text("oi"),
            ),
          ],
        )
      ],

    );
  }
}
