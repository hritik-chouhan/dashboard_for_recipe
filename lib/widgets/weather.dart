
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
      ),
      height: SizeConfig.safeBlockVertical * 20,
      width: SizeConfig.blockSizeHorizontal * 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,
              child: Text(
                'Weather',
                style: SizeConfig.smallnormalfont,
                textAlign: TextAlign.left,
              )),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Row(
                  children: [
                    Column(
                      children: [
                        Text(insideTemperatue.toString() + ' \u00B0',
                            style: SizeConfig.normalfont),
                        Text('Inside', style: SizeConfig.smallnormalfont2),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal,
                    ),
                    Column(
                      children: [
                        Text(
                          outsideTempearure.toString() + ' \u00B0',
                          style: SizeConfig.normalfont,
                        ),
                        Text(
                          'Outside',
                          style: SizeConfig.smallnormalfont2,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
