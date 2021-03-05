import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/core/model/launch.dart';
import 'package:flutter_project/core/model/launchpad.dart';

import 'api_manager.dart';

class LaunchpadManager {


  static final LaunchpadManager _instance = LaunchpadManager._internal();

  factory LaunchpadManager() => _instance;

  LaunchpadManager._internal();

  Future<List<Launchpad>> fetchAllLaunchpads() async {
    List<Launchpad> launchpadList = List();
    // Calling API
    try {
      var response = await ApiManager().getAllLaunchpads();
      if (response != null && response.data != null) {
        for(Map<String, dynamic> launchpad in response.data) {
          launchpadList.add(Launchpad.fromJson(launchpad));
        }
      }
    } catch (e) {
      print(e);
    }
    return launchpadList;
  }
}