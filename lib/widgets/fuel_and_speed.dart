import 'package:dashboard_app/size.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../font.dart';

class SpeedAndFuel extends StatelessWidget {
  double fuel;
  double speed;
  SpeedAndFuel({Key? key, required this.fuel, required this.speed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
            radius: SizeConfig.fontsize * 2,
            percent: fuel / 100,
            lineWidth: SizeConfig.fontsize / 2,
            // linearGradient: LinearGradient(colors: [Colors.redAccent,Colors.orangeAccent,Colors.lightGreenAccent,Colors.lightGreenAccent],
            // stops: [0.1,0.3,0.6,1],
            //   begin: Alignment(1,0),
            //   end: Alignment(0,1),
            // ),
            backgroundColor: Colors.lightBlue.shade100,
            progressColor: fuel < 25
                ? Colors.redAccent
                : fuel < 50
                    ? Colors.orange
                    : Colors.green,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            animateFromLastPercent: true,
            center: Text(
              fuel.toString() + ' %',
              style: SizeConfig.normalfont,
            ),
            footer: Text(
              'fuel',
              style: SizeConfig.normalfont,
            ),
          ),
          CircularPercentIndicator(
            radius: SizeConfig.fontsize * 2,
            percent: speed / 300,
            lineWidth: SizeConfig.fontsize / 2,
            backgroundColor: Color.fromARGB(255, 176, 213, 195),
            progressColor: Colors.lightBlueAccent,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            animateFromLastPercent: true,
            center: Text(
              speed.toString(),
              style: SizeConfig.normalfont,
            ),
            footer: Text(
              'Speed in KM/H',
              style: SizeConfig.normalfont,
            ),
          ),
        ],
      ),
    );
  }
}

class Rpm extends StatelessWidget {
  double rpm;
  Rpm({Key? key, required this.rpm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.safeBlockVertical * 9,
      width: SizeConfig.blockSizeHorizontal * 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Engine Status",
            style: SizeConfig.normalfont,
          ),
          LinearPercentIndicator(
            backgroundColor: Colors.white70,
            addAutomaticKeepAlive: true,
            progressColor: Colors.lightBlueAccent,
            animateFromLastPercent: true,
            animation: true,
            animationDuration: 500,
            percent: rpm / 8000,
            barRadius: Radius.circular(15),
            leading: Text(
              'RPM',
              style: SizeConfig.normalfont,
            ),
            trailing: Text(
              rpm.toString(),
              style: SizeConfig.normalfont,
            ),
          ),
        ],
      ),
    );
  }
}
