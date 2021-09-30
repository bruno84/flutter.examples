import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'comp/comp_elevatedbutton.dart';

class PageHome extends StatefulWidget
{
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  // Completer: permite fazer requisicoes para APIs
  Completer<GoogleMapController> _completerGoogle = Completer();
  MapType _mapType = MapType.normal;

  Set<Marker> _setMarker = {};
  Set<Polyline> _setPolyline = {};

  LatLng _target = LatLng(0, 0);           // centro do mapa
  double _zoom = 17;        // quanto maior, mais proximo
  double _tilt = 0;         // rotaciona em X
  double _bearing = 0;      // rotaciona em Z


  @override
  void initState()
  {
    super.initState();

    _setMarker = _getListMarker();
    _setPolyline = _getListPolyline();
    _target = _gps1();
    _listenerLocalizacao();
  }

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

  _body()
  {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          child: GoogleMap(
              mapType: _mapType,
              onMapCreated: _onMapCreated,

              compassEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,

              markers: _setMarker,
              polylines: _setPolyline,

              initialCameraPosition: CameraPosition(target: _target, zoom: _zoom ),
          ),
        ),

        Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CompElevatedButton("Mudar mapa", _onClickMudarMapa, height: 30, fontSize: 20, colorBG: Colors.blue),
              SizedBox(height: 10),
              CompElevatedButton("Mover camera", _onClickMoverCamera, height: 30, fontSize: 20, colorBG: Colors.blue),
              SizedBox(height: 10),
              CompElevatedButton("Onde estou?", _onClickObterCoordUsuario, height: 30, fontSize: 20, colorBG: Colors.blue),
            ]
          )
        )
      ]
    );
  }

  //----------------------------------------------------------------------------
  // COORDENADAS
  //----------------------------------------------------------------------------
  _gps1() {
    return LatLng(-5.2036578,-37.3251447);
  }

  _gps2() {
    return LatLng(-5.21,-37.33);
  }

  _gpsP1() {
    return LatLng(-5.2037,-37.3255);
  }

  _gpsP2() {
    return LatLng(-5.2055,-37.3299);
  }

  //----------------------------------------------------------------------------
  // UTEIS
  //----------------------------------------------------------------------------
  _onMapCreated( GoogleMapController googleMapController ){
    _completerGoogle.complete( googleMapController );
  }

  _movimentarCamera() async
  {
    GoogleMapController googleMapController = await _completerGoogle.future;
    googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: _target,
                zoom: _zoom,
                tilt: _tilt,
                bearing: _bearing
            )
        )
    );
  }

  _listenerLocalizacao()
  {
    Geolocator.getPositionStream(
        desiredAccuracy: LocationAccuracy.high,
        distanceFilter: 10
    ).listen((Position position)
    {
      print("position stream: " + position.toString() );

      Marker marckerUsuario = Marker(
        markerId: MarkerId("usuario"),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: InfoWindow(title: "Title: usuario"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      );

      setState(() {
        _target = LatLng(position.latitude, position.longitude);
        _zoom = 17;
        _setMarker.add(marckerUsuario);
        _movimentarCamera();
      });

    });
  }

  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  _onClickMudarMapa()
  {
    setState(() {
      _mapType = (_mapType == MapType.hybrid) ? MapType.normal : MapType.hybrid;
    });
  }

  _onClickMoverCamera() async
  {
    setState(() {
      _target = _gps2();
      _tilt = 60;
      _bearing = 180;
      _zoom = 17;
      _movimentarCamera();
    });
  }

  _onClickObterCoordUsuario() async
  {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );

    print("position: " + position.toString() );

    setState(() {
      _target = LatLng(position.latitude, position.longitude);
      _zoom = 17;
      _tilt = 0;
      _bearing = 0;
      _movimentarCamera();
    });
  }

  //----------------------------------------------------------------------------
  // COLECOES
  //----------------------------------------------------------------------------
  Set<Marker> _getListMarker()
  {
    Set<Marker> setMarker = {};

    Marker mark1 = Marker(
      markerId: MarkerId('marcador1'),
      position: _gpsP1(),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      onTap: () { print("click no marcador 1"); },
      infoWindow: InfoWindow(
        title: 'Janela 1',
        onTap: () { print("click na janela 1"); }
      ),
    );

    Marker mark2 = Marker(
      markerId: MarkerId('marcador2'),
      position: _gpsP2(),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      onTap: () { print("click no marcador 2"); },
      infoWindow: InfoWindow(
        title: 'Janela 2',
        onTap: () { print("click na janela 2"); }
      ),
    );

    setMarker.add(mark1);
    setMarker.add(mark2);

    return setMarker;
  }

  Set<Polyline> _getListPolyline()
  {
    Set<Polyline> setPolyline = {};

    Polyline linha1 = Polyline(
        polylineId: PolylineId("rota"),
        color: Colors.red,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.round,
        points: [
          _gps2(),
          _gpsP1(),
          _gpsP2(),
        ],
        consumeTapEvents: true,   // habilita o click na linha
        onTap: (){
          print("cliquei na linha");
        }
    );

    setPolyline.add(linha1);

    return setPolyline;
  }

}