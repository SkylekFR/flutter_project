import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_project/core/manager/api_manager.dart';
import 'package:flutter_project/core/manager/launch_manager.dart';
import 'package:flutter_project/core/manager/launchpad_manager.dart';
import 'package:flutter_project/core/model/launch.dart';
import 'package:flutter_project/core/model/launchpad.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Carte extends StatefulWidget {
  Carte({Key key}) : super(key: key);

  @override
  _CarteState createState() => _CarteState();
}

class _CarteState extends State<Carte> {
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.090240, -95.712891),
    zoom: 1,
  );

  int _markerIdCounter = 0;
  final List<Launchpad> launchpadList = List();
  Set<Marker> markerSet = Set();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Carte")),
        body: FutureBuilder<List<Launchpad>>(
          future: LaunchpadManager().fetchAllLaunchpads(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              launchpadList.addAll(snapshot.data);
              for(Launchpad launchpad in launchpadList){
                markerSet.add(
                    Marker(
                        position:
                          LatLng(
                            launchpad.latitude, launchpad.longitude
                          ),
                        markerId:
                            MarkerId("${++_markerIdCounter}"
                          ),
                        infoWindow:
                          InfoWindow(
                              title: "${launchpad.fullName}",
                          snippet: "${launchpad.locality}")));
              }


            }
            return GoogleMap(initialCameraPosition: _kGooglePlex, markers: markerSet,);
          },
        ));
  }
}
