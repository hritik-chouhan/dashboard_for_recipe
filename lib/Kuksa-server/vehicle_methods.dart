import 'dart:convert';
import 'dart:io';

import 'package:dashboard_app/Kuksa-server/vehicle_provider.dart';
import 'package:dashboard_app/Kuksa-server/vehicle_server_path.dart';
import 'package:dashboard_app/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VISS {
  static const requestId = "test-id";
  static void init(WebSocket socket, WidgetRef ref) {
    authorize(socket,ref);
    subscribe(socket,ref, VSPath.vehicleSpeed);
    subscribe(socket,ref, VSPath.vehicleEngineRPM);
    subscribe(socket,ref, VSPath.vehicleFuelLevel);
    subscribe(socket,ref, VSPath.vehicleFrontLeftTier);
    subscribe(socket, ref,VSPath.vehicleFrontRightTier);
    subscribe(socket, ref,VSPath.vehicleRearLeftTier);
    subscribe(socket,ref, VSPath.vehicleRearRightTier);
    subscribe(socket, ref,VSPath.vehicleIsChildLockActiveLeft);
    subscribe(socket,ref, VSPath.vehicleIsChildLockActiveRight);
    subscribe(socket,ref, VSPath.vehicleCurrentLatitude);
    subscribe(socket,ref, VSPath.vehicleCurrentLongitude);
    subscribe(socket,ref, VSPath.vehicleFuelRate);
    subscribe(socket,ref, VSPath.vehicleInsideTemperature);
    subscribe(socket, ref,VSPath.vehicleAmbientAirTemperature);
  }

  static void update(WebSocket socket, WidgetRef ref) {
    get(socket,ref, VSPath.vehicleSpeed);
    get(socket,ref, VSPath.vehicleEngineRPM);
    get(socket,ref, VSPath.vehicleFuelLevel);
    get(socket,ref,VSPath.vehicleAmbientAirTemperature);
    get(socket,ref,VSPath.vehicleFrontLeftTier);
    get(socket,ref, VSPath.vehicleFrontRightTier);
    get(socket,ref, VSPath.vehicleRearLeftTier);
    get(socket,ref, VSPath.vehicleRearRightTier);
    get(socket,ref,VSPath.vehicleIsChildLockActiveLeft);
    get(socket,ref, VSPath.vehicleIsChildLockActiveRight);
    get(socket,ref,VSPath.vehicleCurrentLatitude);
    get(socket,ref,VSPath.vehicleCurrentLongitude);
    get(socket,ref,VSPath.vehicleFuelRate);
    get(socket,ref, VSPath.vehicleInsideTemperature);
  }

  static void authorize(WebSocket socket,WidgetRef ref) {
    final config = ref.read(ConfigStateprovider);

    Map<String, dynamic> map = {
      "action": "authorize",
      "tokens": config.kuksaAuthToken,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void get(WebSocket socket,WidgetRef ref, String path) {
    final config = ref.read(ConfigStateprovider);

    Map<String, dynamic> map = {
      "action": "get",
      "tokens": config.kuksaAuthToken,
      "path": path,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void set(WebSocket socket,  WidgetRef ref,String path, String value) {
    final config = ref.read(ConfigStateprovider);
    Map<String, dynamic> map = {
      "action": "set",
      "tokens": config.kuksaAuthToken,
      "path": path,
      "requestId": requestId,
      "value": value
    };
    socket.add(jsonEncode(map));
  }

  static void subscribe(WebSocket socket,WidgetRef ref, String path) {
    final config = ref.read(ConfigStateprovider);

    Map<String, dynamic> map = {
      "action": "subscribe",
      "tokens": config.kuksaAuthToken,
      "path": path,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static String? numToGear(int? number) {
    switch (number) {
      case -1:
        return 'R';
      case 0:
        return 'N';
      case 126:
        return 'P';
      case 127:
        return 'D';
      default:
        return null;
    }
  }

  static void parseData(WidgetRef ref, String data) {
    final vehicleSignal = ref.read(vehicleSignalProvider.notifier);
    Map<String, dynamic> dataMap = jsonDecode(data);
    if (dataMap["action"] == "subscription" || dataMap["action"] == "get") {
      if (dataMap.containsKey("data")) {
        if ((dataMap["data"] as Map<String, dynamic>).containsKey("dp") &&
            (dataMap["data"] as Map<String, dynamic>).containsKey("path")) {
          String path = dataMap["data"]["path"];
          Map<String, dynamic> dp = dataMap["data"]["dp"];
          if (dp.containsKey("value")) {
            if (dp["value"] != "---") {
              switch (path) {
                case VSPath.vehicleSpeed:
                  vehicleSignal.update(speed: double.parse(dp["value"]));
                  break;
                case VSPath.vehicleEngineRPM:
                  vehicleSignal.update(rpm: double.parse(dp["value"]));
                  break;
                case VSPath.vehicleFuelLevel:
                  vehicleSignal.update(fuelLevel: double.parse(dp["value"]));
                  break;
                case VSPath.vehicleFrontLeftTier:
                  vehicleSignal.update(frontLeftTP: double.parse(dp["value"]));
                  break;
                case VSPath.vehicleFrontRightTier:
                  vehicleSignal.update(frontRightTP: double.parse(dp["value"]));
                  break;
                case VSPath.vehicleRearLeftTier:
                  vehicleSignal.update(rearLeftTP: double.parse(dp["value"]));
                  break;
                case VSPath.vehicleRearRightTier:
                  vehicleSignal.update(rearRightTP: double.parse(dp["value"]));
                  break;


                case VSPath.vehicleIsChildLockActiveLeft:
                  vehicleSignal.update(isChildLockActiveLeft: dp['value']);
                  break;
                case VSPath.vehicleIsChildLockActiveRight:
                  vehicleSignal.update(isChildLockActiveRight: dp['value']);
                  break;
                case VSPath.vehicleCurrentLatitude:
                  vehicleSignal.update(
                      currentLatitude: double.parse(dp["value"]));
                  break;
                case VSPath.vehicleCurrentLongitude:
                  vehicleSignal.update(
                      currentLongitude: double.parse(dp["value"]));
                  break;
                case VSPath.vehicleFuelRate:
                  vehicleSignal.update(fuelRate: double.parse(dp["value"]));
                  break;
                case VSPath.vehicleInsideTemperature:
                  vehicleSignal.update(
                      insideTemperature: int.parse(dp["value"]));
                  break;
                case VSPath.vehicleAmbientAirTemperature:
                  vehicleSignal.update(
                      outsideTemperature: int.parse(dp["value"]));
                  break;
                default:
                  print("$path Not Available yet!");
              }
            } else {
              print("ERROR:Value not available yet! Set Value of $path");
            }
          } else {
            print("ERROR:'value': Key not found!");
          }
        } else if ((!dataMap["data"] as Map<String, dynamic>)
            .containsKey("path")) {
          print("ERROR:'path':key not found !");
        } else if ((dataMap["data"] as Map<String, dynamic>)
            .containsKey("dp")) {
          print("ERROR:'dp':key not found !");
        }
      } else {
        print("ERROR:'data':key not found!");
      }
    }
  }
}
