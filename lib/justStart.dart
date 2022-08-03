import 'package:dashboard_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JustStart extends ConsumerStatefulWidget {
  const JustStart({Key? key}) : super(key: key);

  @override
  _JustStartState createState() => _JustStartState();
}

class _JustStartState extends ConsumerState<JustStart> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
