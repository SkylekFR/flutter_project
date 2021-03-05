import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_project/core/manager/api_manager.dart';
import 'package:flutter_project/core/manager/launch_manager.dart';
import 'package:flutter_project/core/model/launch.dart';

class Accueil extends StatefulWidget {
  Accueil({Key key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final List<Launch> launchList = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Accueil"),
        ),
        body: FutureBuilder<List<Launch>>(
            future: LaunchManager().loadUpcomingLaunches(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                launchList.clear();
                launchList.addAll(snapshot.data);
                return Center(
                  child: Column(
                    children: [
                      Text("${launchList[3].dateUnix}"),
                      CountdownTimer(endTime: launchList[3].dateUnix * 1000),
                      Text("Décollages suivants: "),
                      Expanded(
                        child: ListView.builder(
                            itemCount: launchList.length,
                            itemBuilder: (context, index) {
                              Launch launch = launchList[index];
                              return ListTile(
                                title: Text('${launch.name}'),

                                leading: Image.network(launch.links.patch.small ?? "no image", errorBuilder: (context, object, stacktrace) {
                                  if(Platform.isIOS) {
                                    return Icon(CupertinoIcons.doc_plaintext);
                                  }
                                  else {
                                    return Icon(Icons.add_photo_alternate_outlined);
                                  }

                                },),
                              );
                            }),
                      )
                    ],
                  ),
                );
              }
              else {
                return Center(child: CircularProgressIndicator(),);
              }

            }));
  }
}
