import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PageHome extends StatefulWidget
{
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 14-01 - mapa"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body() {
    return Container(
        child: GoogleMap(
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            initialCameraPosition: CameraPosition(
                target: _gps1(),
                zoom: 15,
            ),

            markers: _getListMarkers(),
        ),
      );
  }

  _gps1() {
    return LatLng(-5.2036578,-37.3251447);
  }

  Set<Marker> _getListMarkers()
  {
    Marker mark1 = Marker(
      markerId: MarkerId('marcador1'),
      position: LatLng(-5.2037,-37.3255),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      onTap: () { print("click no marcador 1"); },
      infoWindow: InfoWindow(
        title: 'Janela 1',
        onTap: () { print("click na janela 1"); }
      ),
    );

    Marker mark2 = Marker(
      markerId: MarkerId('marcador2'),
      position: LatLng(-5.2055,-37.3299),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      onTap: () { print("click no marcador 2"); },
      infoWindow: InfoWindow(
        title: 'Janela 2',
        onTap: () { print("click na janela 2"); }
      ),
    );

    return { mark1, mark2 };
  }


}