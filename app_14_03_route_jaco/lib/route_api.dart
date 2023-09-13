import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class RouteAPI extends GetConnect
{
  @override
  void onInit() {
    Get.log('Base Connect Inicializado');

    //URL base
    httpClient.baseUrl = 'http://router.project-osrm.org';

    httpClient.addResponseModifier((request, response) {
      if (Get.isLogEnable) {
        debugPrint('${request.method}');
        debugPrint('${request.url}');
      }
      debugPrint('${response.body}');
      return response;
    });

    httpClient.defaultContentType = 'application/json; charset=utf-8';

    //Tempo de duração das requisições
    httpClient.timeout = Duration(seconds: 15);

    //Em caso de falha, número de tentativas
    httpClient.maxAuthRetries = 4;
  }

  // requisição recebendo uma lista de latlng
  Future<Response> getRouteFromLatLng(List<LatLng> latlngs) async {
    Get.log('OSMR Connect - Car Route');
    String strLngLat = "";

    for (LatLng latlng in latlngs) {
      strLngLat += "${latlng.longitude},${latlng.latitude};";
    }
    if (strLngLat.length > 0) {
      strLngLat = strLngLat.substring(0, strLngLat.length - 1);
    }
    final response =
    await post('/route/v1/driving/$strLngLat?overview=full', "");

    return response;
  }

  static Map<String, dynamic>? getMap(Response response) {
    final decodedObj = json.decode(response.bodyString.toString());
    return decodedObj;
    //return json.decode(utf8.decode(response.bodyString!.runes.toList()));
  }
}