import 'package:dashboard_app/font.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';

import '../Kuksa-server/vehicle_config.dart';
import '../size.dart';

class date_time extends StatelessWidget {
  DateTime now;
  date_time({Key? key, required this.now}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map calendar = {
      1: 'jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'jun',
      7: 'July',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec'
    };
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    int hour = now.hour > 12 ? now.hour - 12 : now.hour;
    String _hour =
        hour.toString().length == 1 ? '0' + hour.toString() : hour.toString();
    int minute = now.minute;
    String _minute = minute.toString().length == 1
        ? '0' + minute.toString()
        : minute.toString();

    return Positioned(
        top: SizeConfig.safeBlockVertical * 2,
        left: SizeConfig.safeBlockHorizontal * 2,
        right: SizeConfig.safeBlockHorizontal * 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(calendar[now.month] + "  " + now.day.toString(),
                style: SizeConfig.normalfont),
            Text(
              now.hour > 12
                  ? _hour + ':' + _minute + ' PM'
                  : _hour + ':' + _minute + ' AM',
              style: SizeConfig.normalfont,
            ),
          ],
        ));
  }
}

class CurrentLocation extends StatelessWidget {
  LatLng pos;
  CurrentLocation({Key? key, required this.pos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: SizeConfig.safeBlockVertical * 8,
      right: SizeConfig.safeBlockHorizontal * 3,
      child: FutureBuilder(
        future: getAdress(pos),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: TextStyle(fontSize: 18),
                ),
              );

              // if we got our data
            } else if (snapshot.hasData) {
              // Extracting data from snapshot object
              final data = snapshot.data as dynamic;
              return Center(
                child: Text(
                  data['features'].length == 0
                      ? 'No location defined'
                      : data['features'][0]['place_name'],
                  style: SizeConfig.smallnormalfont,
                ),
              );
            }
          }
          return Text(
            'Loading to fetch location',
            style: SizeConfig.smallnormalfont,
          );
        },
      ),
    );
  }
}
