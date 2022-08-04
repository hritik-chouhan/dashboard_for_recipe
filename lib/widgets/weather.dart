import 'package:dashboard_app/font.dart';
import 'package:dashboard_app/size.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class weather extends StatelessWidget {
  int insideTemperatue;
  int outsideTempearure;
  weather(
      {Key? key,
      required this.insideTemperatue,
      required this.outsideTempearure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockVertical * 2),
        color: Colors.black38,
      ),
      height: SizeConfig.safeBlockVertical * 30,
      width: SizeConfig.blockSizeHorizontal * 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Weather',
                  style: SizeConfig.normalfont,
                  textAlign: TextAlign.left,
                ),
              )),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                        width: SizeConfig.blockSizeHorizontal * 5,
                        child: Image.asset(
                          'images/thermostate.png',
                          color: Colors.orangeAccent,
                        )),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical,
                    ),
                    Text(insideTemperatue.toString() + ' \u00B0',
                        style: SizeConfig.smallnormalfont),
                    Text('Inside Car', style: SizeConfig.smallnormalfont),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical,
                    ),
                    Text(
                      outsideTempearure.toString() + ' \u00B0',
                      style: SizeConfig.smallnormalfont,
                    ),
                    Text(
                      'Outside car',
                      style: SizeConfig.smallnormalfont,
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     SizedBox(
                //         height: SizeConfig.safeBlockVertical * 5,
                //         width: SizeConfig.blockSizeHorizontal * 5,
                //         child: Image.asset(
                //           'images/cloud.png',
                //           color: Colors.orangeAccent,
                //         )),
                //     SizedBox(
                //       height: SizeConfig.safeBlockVertical,
                //     ),
                //     Text(
                //       'SUNNY',
                //       style: SizeConfig.smallnormalfont,
                //     ),
                //     Text(
                //       'wheather',
                //       style: SizeConfig.smallnormalfont,
                //     ),
                //     SizedBox(
                //       height: SizeConfig.safeBlockVertical,
                //     ),
                //     Text(
                //       '6 KM/H',
                //       style: SizeConfig.smallnormalfont,
                //     ),
                //     Text(
                //       'Wind speed',
                //       style: SizeConfig.smallnormalfont,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
