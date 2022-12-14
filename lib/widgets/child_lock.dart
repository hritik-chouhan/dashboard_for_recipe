// SPDX-License-Identifier: Apache-2.0
import 'package:dashboard_app/size.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChildLockStatus extends StatelessWidget {
  bool isChildLockActiveLeft;
  bool isChildLockActiveRight;
  ChildLockStatus(
      {Key? key,
      required this.isChildLockActiveLeft,
      required this.isChildLockActiveRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isChildLockActiveLeft && isChildLockActiveRight
        ? Column(
            children: [
              Text(
                "Child Lock",
                style: TextStyle(
                    fontSize: SizeConfig.fontsize / 3, color: Colors.green),
              ),
              Text(
                "Activated",
                style: TextStyle(
                    fontSize: SizeConfig.fontsize / 3, color: Colors.green),
              ),
              SizedBox(
                width: SizeConfig.safeBlockVertical / 2,
              ),
              Icon(
                Icons.lock,
                size: SizeConfig.fontsize / 3,
                color: Colors.green,
              ),
            ],
          )
        : Column(
            children: [
              Text(
                'No child  Lock',
                style: TextStyle(
                  fontSize: SizeConfig.fontsize / 2,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical / 2,
              ),
              Icon(
                Icons.lock_open_outlined,
                size: SizeConfig.fontsize / 4,
                color: Colors.red,
              ),
            ],
          );
  }
}
