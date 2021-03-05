import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/core/model/launch.dart';

import 'api_manager.dart';

class LaunchManager {


  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  Future<List<Launch>> loadUpcomingLaunches() async {
    List<Launch> launches = List();
    // Calling API
    try {
      var response = await ApiManager().getUpcomingLaunches();
      if (response != null && response.data != null) {
        // Mapping data
        var data = response.data;
        for(Map<String, dynamic> launch in data) {

            launches.add(Launch.fromJson(launch));
        }

      }
    } catch (e) {
      print(e);
    }
    return launches;
  }

  Future<List<Launch>> loadPastLaunches() async {
    List<Launch> launches = List();
    // Calling API
    try {
      var response = await ApiManager().getPastLaunches();
      if (response != null && response.data != null) {
        // Mapping data
        var data = response.data;
        for(Map<String, dynamic> launch in data) {

          launches.add(Launch.fromJson(launch));
        }

      }
    } catch (e) {
      print(e);
    }
    return launches;
  }
}
