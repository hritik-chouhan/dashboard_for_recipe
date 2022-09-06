import 'package:dashboard_app/Tier_pressure.dart';
import 'package:dashboard_app/drawArrow.dart';
import 'package:dashboard_app/provider.dart';
import 'package:dashboard_app/size.dart';
import 'package:dashboard_app/widgets/child_lock.dart';
import 'package:dashboard_app/widgets/date_time_location.dart';
import 'package:dashboard_app/widgets/fuel_and_speed.dart';
import 'package:dashboard_app/widgets/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlng/latlng.dart';



import 'Kuksa-server/vehicle_provider.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final vehicle = ref.watch(vehicleSignalProvider);
    LatLng pos = LatLng(vehicle.currentLatitude, vehicle.currentLongitude);

    DateTime _now = ref.watch(DateTimeProvider);



    return Scaffold(
        backgroundColor: Colors.black87,
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                      color: Colors.black87,
                    ),
                  ),
                  Positioned(
                      top: SizeConfig.safeBlockVertical * 8,
                      right: SizeConfig.safeBlockHorizontal * 3,
                      child: CurrentLocation(pos: pos)),
                  Positioned(
                      top: SizeConfig.safeBlockVertical * 2,
                      left: SizeConfig.safeBlockHorizontal * 2,
                      right: SizeConfig.safeBlockHorizontal * 2,
                      child: date_time(now: _now)),



                  Positioned(
                    right: SizeConfig.safeBlockHorizontal * 41,
                    top: SizeConfig.safeBlockVertical * 58,
                    child: ChildLockStatus(
                        isChildLockActiveLeft: vehicle.isChildLockActiveLeft,
                        isChildLockActiveRight: vehicle.isChildLockActiveRight),
                  ),

                  Positioned(
                    top: SizeConfig.safeBlockVertical * 18,
                    right: SizeConfig.safeBlockHorizontal * 38,
                    child: Column(

                      children: [
                        TierPressure(
                          tname: 'L Front Tier',
                          tpress: vehicle.frontLeftTP,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockHorizontal * 12,
                          child: CustomPaint(
                            painter: Arrowpaint2(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.safeBlockVertical * 65,
                    right: SizeConfig.safeBlockHorizontal * 38,
                    child: Column(

                      children: [
                        RotatedBox(
                          quarterTurns: 2,
                          child: Container(
                            height: SizeConfig.safeBlockVertical * 10,
                            width: SizeConfig.safeBlockHorizontal * 12,
                            child: CustomPaint(
                              painter: Arrowpaint(),
                            ),
                          ),
                        ),
                        TierPressure(
                          tname: 'L Rear Tier',
                          tpress: vehicle.rearLeftTP,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.safeBlockVertical * 18,
                    right: SizeConfig.safeBlockHorizontal * 7,
                    child: Column(
                      children: [
                        TierPressure(
                          tname: 'R Front Tier',
                          tpress: vehicle.frontRightTP,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockHorizontal * 12,
                          child: CustomPaint(
                            painter: Arrowpaint(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.safeBlockVertical * 65,
                    right: SizeConfig.safeBlockHorizontal * 7,
                    child: Column(
                      children: [
                        RotatedBox(
                          quarterTurns: 2,
                          child: Container(
                            height: SizeConfig.safeBlockVertical * 10,
                            width: SizeConfig.safeBlockHorizontal * 12,
                            child: CustomPaint(
                              painter: Arrowpaint2(),
                            ),
                          ),
                        ),
                        TierPressure(
                          tname: 'R Rear Tier',
                          tpress: vehicle.rearRightTP,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.safeBlockVertical * 20,
                    right: SizeConfig.blockSizeHorizontal * 13,
                    bottom: SizeConfig.blockSizeVertical * 20,
                    child: SizedBox(
                      height: SizeConfig.screenHeight * 0.6,
                      width: SizeConfig.screenWidth * 0.30,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 10),
                        child: Image.asset('images/car_img.png'),
                      ),
                    ),
                  ),

                  Positioned(
                      top: SizeConfig.safeBlockVertical * 7,
                      left: SizeConfig.safeBlockHorizontal * 2,
                      bottom: SizeConfig.safeBlockVertical * 4,
                      child: Container(
                        width: SizeConfig.screenWidth / 2,
                        height: SizeConfig.screenHeight * 0.75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Rpm(rpm: vehicle.rpm),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Avg. Fuel Consumtion',
                                  style: SizeConfig.smallnormalfont,
                                ),
                                Text(
                                  vehicle.fuelRate.toString() + ' KM/Litre',
                                  style: SizeConfig.smallnormalfont,
                                ),
                              ],
                            ),
                            // ignore: prefer_const_constructors
                            weather(
                              insideTemperatue: vehicle.insideTemperature,
                              outsideTempearure: vehicle.outsideTemperature,
                            ),
                            SpeedAndFuel(
                                fuel: vehicle.fuelLevel, speed: vehicle.speed),
                          ],
                        ),
                      ))
                ],
              );
            }
            //--------------------------Portrait mode ------------------------------------------------
            else {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          SizeConfig.safeBlockHorizontal * 2,
                          SizeConfig.safeBlockVertical * 2,
                          SizeConfig.safeBlockHorizontal * 2,
                          0),

                      child: Column(
                        children: [
                          Flexible(flex: 1, child: date_time(now: _now)),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical,
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CurrentLocation(pos: pos),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: SizeConfig.safeBlockVertical,
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: weather(
                                    insideTemperatue: vehicle.insideTemperature,
                                    outsideTempearure:
                                        vehicle.outsideTemperature,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: SpeedAndFuel(
                                      fuel: vehicle.fuelLevel,
                                      speed: vehicle.speed),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 6,
                          ),
                          Flexible(
                            flex: 5,
                            child: Container(


                              // color: Colors.red,
                              height: SizeConfig.screenHeight * 0.6,
                              width: SizeConfig.screenWidth * 0.53,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        TierPressure(
                                          tname: 'L Front Tire',
                                          tpress: vehicle.frontLeftTP,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.safeBlockVertical * 6,
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  12,
                                          child: CustomPaint(
                                            painter: Arrowpaint2(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Column(
                                      children: [
                                        ChildLockStatus(
                                            isChildLockActiveLeft:
                                                vehicle.isChildLockActiveLeft,
                                            isChildLockActiveRight:
                                                vehicle.isChildLockActiveRight),
                                        RotatedBox(
                                          quarterTurns: 2,
                                          child: Container(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    6,
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    12,
                                            child: CustomPaint(
                                              painter: Arrowpaint(),
                                            ),
                                          ),
                                        ),
                                        TierPressure(
                                          tname: 'L Rear Tire',
                                          tpress: vehicle.rearLeftTP,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: SizeConfig.safeBlockHorizontal * 12,
                                    right: SizeConfig.safeBlockHorizontal * 12,
                                    child: SizedBox(

                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 10),
                                        child: Image.asset(
                                          'images/car_img.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Column(
                                      children: [
                                        TierPressure(
                                          tname: 'R Front Tire',
                                          tpress: vehicle.frontRightTP,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.safeBlockVertical * 6,
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  12,
                                          child: CustomPaint(
                                            painter: Arrowpaint(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Column(
                                      children: [
                                        ChildLockStatus(
                                            isChildLockActiveLeft:
                                                vehicle.isChildLockActiveLeft,
                                            isChildLockActiveRight:
                                                vehicle.isChildLockActiveRight),
                                        RotatedBox(
                                          quarterTurns: 2,
                                          child: Container(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    6,
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    12,
                                            child: CustomPaint(
                                              painter: Arrowpaint2(),
                                            ),
                                          ),
                                        ),
                                        TierPressure(
                                          tname: 'R Rear Tire',
                                          tpress: vehicle.rearRightTP,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical,
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Avg. Fuel Consumtion',
                                        style: SizeConfig.smallnormalfont2,
                                      ),
                                      Text(
                                        vehicle.fuelRate.toString() +
                                            ' KM/Litre',
                                        style: SizeConfig.smallnormalfont,
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(flex: 1, child: Rpm(rpm: vehicle.rpm)),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              );

            }
          },
        ));
  }
}
