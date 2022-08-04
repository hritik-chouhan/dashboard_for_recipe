import 'dart:convert';
import 'dart:io';

import 'package:dashboard_app/Kuksa-server/vehicle_config.dart';
import 'package:dashboard_app/Kuksa-server/vehicle_provider.dart';
import 'package:dashboard_app/Kuksa-server/vehicle_server_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VISS {
  static const requestId = "test-id";
  static void init(WebSocket socket) {
    authorize(socket);
    subscribe(socket, VSPath.vehicleSpeed);
    subscribe(socket, VSPath.vehicleEngineRPM);
    subscribe(socket, VSPath.vehicleFuelLevel);
    subscribe(socket, VSPath.vehicleFrontLeftTier);
    subscribe(socket, VSPath.vehicleFrontRightTier);
    subscribe(socket, VSPath.vehicleRearLeftTier);
    subscribe(socket, VSPath.vehicleRearRightTier);
    subscribe(socket, VSPath.vehicleIsChildLockActiveLeft);
    subscribe(socket, VSPath.vehicleIsChildLockActiveRight);
    subscribe(socket, VSPath.vehicleCurrentLatitude);
    subscribe(socket, VSPath.vehicleCurrentLongitude);
    subscribe(socket, VSPath.vehicleFuelRate);
    subscribe(socket, VSPath.vehicleInsideTemperature);
    subscribe(socket, VSPath.vehicleAmbientAirTemperature);
  }

  static void update(WebSocket socket) {
    get(socket, VSPath.vehicleSpeed);
    get(socket, VSPath.vehicleEngineRPM);
    get(socket, VSPath.vehicleLeftIndicator);
    get(socket, VSPath.vehicleRightIndicator);
    get(socket, VSPath.vehicleFuelLevel);
    get(socket, VSPath.vehicleCoolantTemp);
    get(socket, VSPath.vehicleHazardLightOn);
    get(socket, VSPath.vehicleHighBeamOn);
    get(socket, VSPath.vehicleLowBeamOn);
    get(socket, VSPath.vehicleSelectedGear);
    get(socket, VSPath.vehiclePerformanceMode);
    get(socket, VSPath.vehicleAmbientAirTemperature);
    get(socket, VSPath.vehicleParkingLightOn);
    get(socket, VSPath.vehicleTrunkLocked);
    get(socket, VSPath.vehicleTrunkOpen);
    get(socket, VSPath.vehicleAmbientAirTemperature);
    get(socket, VSPath.vehicleMIL);
    get(socket, VSPath.vehicleCruiseControlError);
    get(socket, VSPath.vehicleCruiseControlSpeedSet);
    get(socket, VSPath.vehicleCruiseControlSpeedisActive);
    get(socket, VSPath.vehicleBatteryChargingStatus);
    get(socket, VSPath.vehicleFrontLeftTier);
    get(socket, VSPath.vehicleFrontRightTier);
    get(socket, VSPath.vehicleRearLeftTier);
    get(socket, VSPath.vehicleRearRightTier);
    get(socket, VSPath.vehicleIsChildLockActiveLeft);
    get(socket, VSPath.vehicleIsChildLockActiveRight);
    get(socket, VSPath.vehicleCurrentLatitude);
    get(socket, VSPath.vehicleCurrentLongitude);
    get(socket, VSPath.vehicleFuelRate);
    get(socket, VSPath.vehicleInsideTemperature);
  }

  static void authorize(WebSocket socket) {
    Map<String, dynamic> map = {
      "action": "authorize",
      "tokens": VehicleSignalConfig.authToken,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void get(WebSocket socket, String path) {
    Map<String, dynamic> map = {
      "action": "get",
      "tokens": VehicleSignalConfig.authToken,
      "path": path,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void set(WebSocket socket, String path, String value) {
    Map<String, dynamic> map = {
      "action": "set",
      "tokens": VehicleSignalConfig.authToken,
      "path": path,
      "requestId": requestId,
      "value": value
    };
    socket.add(jsonEncode(map));
  }

  static void subscribe(WebSocket socket, String path) {
    Map<String, dynamic> map = {
      "action": "subscribe",
      "tokens": VehicleSignalConfig.authToken,
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

                case VSPath.vehicleBatteryChargingStatus:
                  vehicleSignal.update(isBatteryCharging: dp['value']);
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
