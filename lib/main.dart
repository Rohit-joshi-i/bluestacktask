import 'package:bluestacktask/services/api/service_manager.dart';
import 'package:bluestacktask/services/config/app_environment_config.dart';
import 'package:bluestacktask/services/config/flavor_config.dart';
import 'package:flutter/material.dart';

import 'base_app.dart';

void main() {

  FlavorConfig(
      flavor: Flavor.production,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(
        baseUrl: kStagingBaseUrl,
      ));
  ServiceManager.init(
      baseUrl: FlavorConfig.instance.flavorValues.baseUrl,
      isDebug: FlavorConfig.instance.isDebug);
  baseAppSetup();
}
