import 'package:dashboard_app/size.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'font.dart';

class TierPressure extends StatefulWidget {
  String tname;
  double tpress;
  TierPressure({Key? key, required this.tname, required this.tpress})
      : super(key: key);

  @override
  State<TierPressure> createState() => _TierPressureState();
}

class _TierPressureState extends State<TierPressure> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.safeBlockVertical * 12,
      width: SizeConfig.safeBlockHorizontal * 12,
      child: Column(
        children: [
          Text(
            '${widget.tname}',
            style: SizeConfig.smallnormalfont,
          ),
          Text(
            widget.tpress.toString() + ' PSI',
            style: SizeConfig.smallnormalfont,
          ),
          LinearPercentIndicator(
            width: SizeConfig.safeBlockHorizontal * 10,
            // fillColor: Colors.green,
            // linearGradient: LinearGradient(
            //   colors: [Colors.red,Colors.orangeAccent, Colors.green],
            //   stops: [0.3,0.7,1],
            //   transform:
            //
            // ),
            progressColor: widget.tpress / 50 > 0.6 ? Colors.green : Colors.red,
            lineHeight: SizeConfig.safeBlockVertical * 1.5,
            alignment: MainAxisAlignment.center,
            animateFromLastPercent: true,
            animation: true,
            percent: widget.tpress / 50,
            // center: Text(
            //   widget.tpress.toString() + ' PSI',
            //   style: SizeConfig.smallnormalfont,
            // ),
            barRadius: Radius.circular(SizeConfig.fontsize / 4),
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
