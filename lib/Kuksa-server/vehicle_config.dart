import 'dart:convert';
import 'dart:io';

import 'package:dashboard_app/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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


