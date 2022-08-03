// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import 'HomePage.dart';
// import 'justStart.dart';
//
// void main() {
//   runApp(ProviderScope(child: MaterialApp(home: JustStart(),
//     debugShowCheckedModeBanner: false,
//   )));
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Kuksa-server/intial_connection.dart';
import 'Kuksa-server/vehicle_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpClient client = await initializeClient();
  print('hello');

  runApp(
    ProviderScope(
      child: MaterialApp(
        home: InitialScreen(client: client),
      ),
    ),
  );
}


