import 'package:dashboard_app/size.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';



class TierPressure extends StatefulWidget {
  String tname;
  double tpress;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;
  TierPressure(
      {Key? key,
      required this.tname,
      required this.tpress,
      required this.crossAxisAlignment,
      required this.mainAxisAlignment})
      : super(key: key);

  @override
  State<TierPressure> createState() => _TierPressureState();
}

class _TierPressureState extends State<TierPressure> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.safeBlockVertical * 12,
      width: SizeConfig.safeBlockHorizontal * 14,
      child: Column(
        mainAxisAlignment: widget.mainAxisAlignment,

        children: [
          Text(
            '${widget.tname}',
            style: SizeConfig.smallnormalfont2,
          ),
          Text(
            widget.tpress.toString() + ' PSI',
            style: SizeConfig.smallnormalfont,
          ),
          LinearPercentIndicator(
            width: SizeConfig.safeBlockHorizontal * 11,

            progressColor: widget.tpress / 50 > 0.6 ? Colors.green : Colors.red,
            lineHeight: SizeConfig.safeBlockVertical * 1.5,
            alignment: MainAxisAlignment.center,
            animateFromLastPercent: true,
            animation: true,
            percent: widget.tpress / 50,

            barRadius: Radius.circular(SizeConfig.fontsize / 4),
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
