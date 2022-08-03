import 'package:dashboard_app/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 // Positioned(
          //     top: 60,
          //     right: 50,
          //     bottom: 30,
          //     child: Container(
          //       width: SizeConfig.screenWidth / 2,
          //       height: SizeConfig.screenHeight * 0.75,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         crossAxisAlignment: CrossAxisAlignment.stretch,
          //         children: [
          //           Flexible(
          //             flex: 1,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               children: [

          //               ],
          //             ),
          //           ),
          //           Flexible(
          //             flex: 2,
          //             child: SizedBox(
          //               height: SizeConfig.screenHeight * 0.5,
          //               width: SizeConfig.screenWidth * 0.30,
          //               child: AnimatedContainer(
          //                 duration: Duration(milliseconds: 10),
          //                 child: Image.asset('images/car_img.png'),
          //               ),
          //             ),
          //           ),
          //           Flexible(
          //             flex: 1,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Column(
          //                   children: [
          //                     TierPressure(
          //                         tname: 'R Front Tier',
          //                         tpress: vehicle.frontRightTP),
          //                     Container(
          //                       height: SizeConfig.safeBlockVertical * 10,
          //                       width: SizeConfig.safeBlockHorizontal * 12,
          //                       child: CustomPaint(
          //                         painter: Arrowpaint(),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 Column(
          //                   children: [
          //                     RotatedBox(
          //                       quarterTurns: 2,
          //                       child: Container(
          //                         height: SizeConfig.safeBlockVertical * 10,
          //                         width: SizeConfig.safeBlockHorizontal * 12,
          //                         child: CustomPaint(
          //                           painter: Arrowpaint2(),
          //                         ),
          //                       ),
          //                     ),
          //                     TierPressure(
          //                         tname: 'R Rear Tier',
          //                         tpress: vehicle.rearRightTP),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     )),