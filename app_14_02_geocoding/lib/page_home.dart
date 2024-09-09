import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'comp/comp_textformfield.dart';


class PageHome extends StatefulWidget
{
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  // Completer: permite fazer requisicoes para APIs
  Completer<GoogleMapController> _completerGoogle = Completer();
  TextEditingController _contBuscar = TextEditingController();

  @override
  void initState()
  {
    super.initState();
    _initializeMapRenderer();
  }

  void _initializeMapRenderer()
  {
    final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = true;
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 14-02 - geocoding"),
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
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,

              compassEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,

              initialCameraPosition: CameraPosition(target: _gps1(), zoom: 17 ),

              onTap: (LatLng latLng) {
                _obterPlacemark(latLng.latitude, latLng.longitude);
              },

          ),
        ),

        Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CompTextFormField("Buscar", "Digite uma localização", _contBuscar,
                inputType: TextInputType.streetAddress,
                inputAction: TextInputAction.send,
                inputActionSubmit: _onClickBuscar,
                inputMaxLength: 100,
              ),
              SizedBox(height: 10),
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

  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  _onClickBuscar()
  {
    String str = _contBuscar.text;
    print("str: $_contBuscar");

    _obterLocation(str);
  }

  //----------------------------------------------------------------------------
  // UTEIS
  //----------------------------------------------------------------------------
  _onMapCreated( GoogleMapController googleMapController ){
    _completerGoogle.complete( googleMapController );
  }

  // ATENÇÃO: essas operações foram movidas da lib "geolocator" para "geocoding"

  _obterLocation(String str) async
  {
    print("_obterLocation");

    List<Location> list = await locationFromAddress( str );

    print("length: ${list.length}" );

    if( list != null && list.length > 0 ){

      Location location = list[0];

      String resultado;

      resultado  = "\n latitude: ${location.latitude}";
      resultado += "\n longitude: ${location.longitude}";

      print("resultado location: " + resultado );
    }

  }

  _obterPlacemark(double lat, double lng) async
  {
    print("_obterPlacemark");

    List<Placemark> list = await placemarkFromCoordinates(lat, lng);

    print("length: ${list.length}" );

    if( list != null && list.length > 0 )
    {
      String resultado = "";

      // ATENÇÃO: normalmente o primeiro elemento é o mais significativo
      for(Placemark placemark in list)
      {
        resultado  = "\n administrativeArea:  ${placemark.administrativeArea}";
        resultado += "\n subAdministrativeArea: ${placemark.subAdministrativeArea}";
        resultado += "\n locality: ${ placemark.locality}";
        resultado += "\n subLocality: ${placemark.subLocality}";
        resultado += "\n thoroughfare: ${placemark.thoroughfare}";
        resultado += "\n subThoroughfare: ${placemark.subThoroughfare}";
        resultado += "\n name: ${placemark.name}";
        resultado += "\n street: ${placemark.street}";
        resultado += "\n postalCode: ${placemark.postalCode}";
        resultado += "\n country: ${placemark.country}";
        resultado += "\n isoCountryCode: ${placemark.isoCountryCode}";
        resultado += "\n toString: ${placemark.toString()}";

        print("resultado placemark: " + resultado + "\n\n");
      }

    }

  }


}