import 'dart:convert';
import 'dart:io';

import 'package:dashboard_app/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlng/latlng.dart';
import 'package:http/http.dart' as http;



final sockConnectprovider = FutureProvider.family<WebSocket, HttpClient>(
    (ref, client) => connect(client,ref));



Future<HttpClient> initializeClient() async {


  SecurityContext ctx = SecurityContext.defaultContext;

  HttpClient client = HttpClient(context: ctx)
    ..findProxy = null
    ..badCertificateCallback = (cert, host, port) {
      return true;
    };
  return client;
}



Future<WebSocket> connect(HttpClient client, ref) async {
  final config = ref.read(ConfigStateprovider);
  WebSocket socket = await WebSocket.connect(
      "wss://${config.hostname}:${config.port}",
      customClient: client);
  return socket;
}

Future<Map> getAdress(LatLng pos,ref) async {
  final config = ref.read(ConfigStateprovider);


  var url =
      'https://api.mapbox.com/geocoding/v5/mapbox.places/${pos.longitude},${pos.latitude}.json?&access_token=${config.mapboxAccessToken}';
  http.Response response = await http.get(Uri.parse(url));
  Map data = json.decode(response.body);
  return data;
}
