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
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Kuksa-server/vehicle_config.dart';
import 'Kuksa-server/vehicle_provider.dart';
import 'font.dart';

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

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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

                  // Positioned(
                  //     top: 390,
                  //     right: 350,
                  //     child: RotatedBox(
                  //       quarterTurns: 2,
                  //       child: Container(
                  //         height: 50,
                  //         width: 100,
                  //         child: CustomPaint(
                  //           painter: simplearrow(),
                  //         ),
                  //       ),
                  //     )),

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
                      // crossAxisAlignment: CrossAxisAlignment.end,
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
                      // crossAxisAlignment: CrossAxisAlignment.end,
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
                      // padding:
                      //     EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
                      child: Column(
                        children: [
                          date_time(now: _now),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CurrentLocation(pos: pos),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Avg. Fuel Consumtion',
                                    style: SizeConfig.normalfont,
                                  ),
                                  Text(
                                    vehicle.fuelRate.toString() + ' KM/Litre',
                                    style: SizeConfig.normalfont,
                                  ),
                                ],
                              ),
                              Rpm(rpm: vehicle.rpm),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              weather(
                                insideTemperatue: vehicle.insideTemperature,
                                outsideTempearure: vehicle.outsideTemperature,
                              ),
                              SpeedAndFuel(
                                  fuel: vehicle.fuelLevel,
                                  speed: vehicle.speed),
                            ],
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TierPressure(
                                            tname: 'L Front Tier',
                                            tpress: vehicle.frontLeftTP,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                          ),
                                          Container(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    10,
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    12,
                                            child: CustomPaint(
                                              painter: Arrowpaint2(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ChildLockStatus(
                                              isChildLockActiveLeft:
                                                  vehicle.isChildLockActiveLeft,
                                              isChildLockActiveRight: vehicle
                                                  .isChildLockActiveRight),
                                          RotatedBox(
                                            quarterTurns: 2,
                                            child: Container(
                                              height:
                                                  SizeConfig.safeBlockVertical *
                                                      2,
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  7,
                                              child: CustomPaint(
                                                painter: simplearrow(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          RotatedBox(
                                            quarterTurns: 2,
                                            child: Container(
                                              height:
                                                  SizeConfig.safeBlockVertical *
                                                      10,
                                              width: SizeConfig
                                                      .safeBlockHorizontal *
                                                  12,
                                              child: CustomPaint(
                                                painter: Arrowpaint(),
                                              ),
                                            ),
                                          ),
                                          TierPressure(
                                            tname: 'L Rear Tier',
                                            tpress: vehicle.rearLeftTP,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height:
                                              SizeConfig.safeBlockVertical * 7,
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.screenHeight * 0.40,
                                          width: SizeConfig.screenWidth * 0.50,
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 10),
                                            child: Image.asset(
                                              'images/car_img.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.safeBlockVertical * 7,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          TierPressure(
                                            tname: 'R Front Tier',
                                            tpress: vehicle.frontRightTP,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                          Container(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    10,
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    12,
                                            child: CustomPaint(
                                              painter: Arrowpaint(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    2,
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    7,
                                            child: CustomPaint(
                                              painter: simplearrow(),
                                            ),
                                          ),
                                          ChildLockStatus(
                                              isChildLockActiveLeft:
                                                  vehicle.isChildLockActiveLeft,
                                              isChildLockActiveRight: vehicle
                                                  .isChildLockActiveRight),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          RotatedBox(
                                            quarterTurns: 2,
                                            child: Container(
                                              height:
                                                  SizeConfig.safeBlockVertical *
                                                      10,
                                              width: SizeConfig
                                                      .safeBlockHorizontal *
                                                  12,
                                              child: CustomPaint(
                                                painter: Arrowpaint2(),
                                              ),
                                            ),
                                          ),
                                          TierPressure(
                                            tname: 'R Rear Tier',
                                            tpress: vehicle.rearRightTP,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
              // return Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Flexible(flex: 1, child: date_time(now: _now)),
              //     Flexible(flex: 1, child: CurrentLocation(pos: pos)),
              //     Flexible(
              //       flex: 2,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Avg. Fuel Consumtion',
              //                 style: SizeConfig.smallnormalfont,
              //               ),
              //               Text(
              //                 vehicle.fuelRate.toString() + ' KM/Litre',
              //                 style: SizeConfig.smallnormalfont,
              //               ),
              //             ],
              //           ),
              //           Rpm(rpm: vehicle.rpm),
              //         ],
              //       ),
              //     ),
              //     Flexible(
              //       flex: 2,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           weather(
              //             insideTemperatue: vehicle.insideTemperature,
              //             outsideTempearure: vehicle.outsideTemperature,
              //           ),
              //           SpeedAndFuel(
              //               fuel: vehicle.fuelLevel, speed: vehicle.speed),
              //         ],
              //       ),
              //     ),
              //     Flexible(
              //       flex: 5,
              //       child: Container(
              //         color: Colors.red,
              //         child: Row(
              //           children: [
              //             Flexible(
              //               flex: 1,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 crossAxisAlignment: CrossAxisAlignment.end,
              //                 children: [
              //                   Column(
              //                     children: [
              //                       TierPressure(
              //                           tname: 'L Front Tier',
              //                           tpress: vehicle.frontLeftTP),
              //                       Container(
              //                         height: SizeConfig.safeBlockVertical * 10,
              //                         width:
              //                             SizeConfig.safeBlockHorizontal * 12,
              //                         child: CustomPaint(
              //                           painter: Arrowpaint2(),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   Column(
              //                     children: [
              //                       RotatedBox(
              //                         quarterTurns: 2,
              //                         child: Container(
              //                           height:
              //                               SizeConfig.safeBlockVertical * 10,
              //                           width:
              //                               SizeConfig.safeBlockHorizontal * 12,
              //                           child: CustomPaint(
              //                             painter: Arrowpaint(),
              //                           ),
              //                         ),
              //                       ),
              //                       TierPressure(
              //                           tname: 'L Rear Tier',
              //                           tpress: vehicle.rearLeftTP),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Flexible(
              //               flex: 1,
              //               child: SizedBox(
              //                 height: SizeConfig.screenHeight * 0.20,
              //                 child: AnimatedContainer(
              //                   duration: Duration(milliseconds: 10),
              //                   child: Image.asset('images/car_img.png'),
              //                 ),
              //               ),
              //             ),
              //             Flexible(
              //               flex: 1,
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Column(
              //                     children: [
              //                       TierPressure(
              //                           tname: 'R Front Tier',
              //                           tpress: vehicle.frontRightTP),
              //                       Container(
              //                         height: SizeConfig.safeBlockVertical * 10,
              //                         width:
              //                             SizeConfig.safeBlockHorizontal * 12,
              //                         child: CustomPaint(
              //                           painter: Arrowpaint(),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   Column(
              //                     children: [
              //                       RotatedBox(
              //                         quarterTurns: 2,
              //                         child: Container(
              //                           height:
              //                               SizeConfig.safeBlockVertical * 6,
              //                           width:
              //                               SizeConfig.safeBlockHorizontal * 14,
              //                           child: CustomPaint(
              //                             painter: Arrowpaint2(),
              //                           ),
              //                         ),
              //                       ),
              //                       TierPressure(
              //                           tname: 'R Rear Tier',
              //                           tpress: vehicle.rearRightTP),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // );
            }
          },
        ));
  }
}
