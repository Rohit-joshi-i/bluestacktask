import 'dart:io';

import 'package:flutter/material.dart';

import 'flavor_config.dart';

class DeviceInfoDialog extends StatelessWidget {
  DeviceInfoDialog();

  @override
  Widget build(BuildContext context) => AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 10.0),
      title: Container(
        padding: EdgeInsets.all(15.0),
        color: FlavorConfig.instance.color,
        child: Text(
          'Device Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      titlePadding: EdgeInsets.all(0),
      content: _getContent(),
    );

  Widget _getContent() {
    if (Platform.isAndroid) {
      return Container();
    }

    if (Platform.isIOS) {
      return Container();
    }

    return Text("You're not on Android neither iOS");
  }


}
