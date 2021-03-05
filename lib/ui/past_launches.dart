import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/manager/launch_manager.dart';
import 'package:flutter_project/core/model/launch.dart';

import 'launch_detail.dart';

class PastLaunches extends StatefulWidget {
  PastLaunches({Key key}) : super(key: key);

  @override
  _PastLaunchesState createState() => _PastLaunchesState();
}

class _PastLaunchesState extends State<PastLaunches> {
  List<Launch> launchList = List();

  void onListElementPressed(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LaunchDetail(
                  launch: launchList[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historique des lancements"),
      ),
      body: FutureBuilder<List<Launch>>(
        future: LaunchManager().loadPastLaunches(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            launchList.addAll(snapshot.data);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: launchList.length,
                      itemBuilder: (context, index) {
                        Launch launch = launchList[index];
                        return ListTile(
                          title: Text('${launch.name}'),
                          contentPadding: EdgeInsets.all(8),
                          onTap: () {
                            onListElementPressed(index);
                          },
                          leading: Image.network(
                            launch.links.patch.small ?? "no image",
                            errorBuilder: (context, object, stacktrace) {
                              if (Platform.isIOS) {
                                return Icon(CupertinoIcons.doc_plaintext);
                              } else {
                                return Icon(Icons.add_photo_alternate_outlined);
                              }
                            },
                          ),
                        );
                      })
                  ,)

              ],
            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }
}
