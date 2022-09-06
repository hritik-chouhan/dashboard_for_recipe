import 'package:dashboard_app/size.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';



class SpeedAndFuel extends StatelessWidget {
  double fuel;
  double speed;
  SpeedAndFuel({Key? key, required this.fuel, required this.speed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
            radius: SizeConfig.fontsize * 1.6,
            percent: fuel / 100,
            lineWidth: SizeConfig.fontsize / 2,

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
              style: SizeConfig.smallnormalfont,
            ),
            footer: Text(
              'fuel',
              style: SizeConfig.smallnormalfont2,
            ),
          ),
          CircularPercentIndicator(
            radius: SizeConfig.fontsize * 1.6,
            percent: speed / 300,
            lineWidth: SizeConfig.fontsize / 2,
            backgroundColor: Color.fromARGB(255, 176, 213, 195),
            progressColor: Colors.lightBlueAccent,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            animateFromLastPercent: true,
            center: Text(
              speed.toString(),
              style: SizeConfig.smallnormalfont,
            ),
            footer: Text(
              'Speed in KM/H',
              style: SizeConfig.smallnormalfont2,
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
      width: SizeConfig.safeBlockHorizontal * 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Engine Status",
            style: SizeConfig.smallnormalfont2,
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
              style: SizeConfig.smallnormalfont,
            ),
            trailing: Text(
              rpm.toString(),
              style: SizeConfig.smallnormalfont2,
            ),
          ),
        ],
      ),
    );
  }
}
