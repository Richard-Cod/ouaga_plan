import 'package:flutter/material.dart';
import 'package:flutter_app/FakeData/FUser.dart';
import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/Plan/RestPlanRepository.dart';
import 'package:flutter_app/User/User.dart';
import 'package:http/http.dart';

import 'Components/EventCard.dart';
import 'Components/HeaderPart.dart';

class PlanListScreen extends StatelessWidget {
  static String pageName = "/planList";

  // Future<List<Plan>> getPlansFromMapData() {
  //   List<Plan> result = [];
  //   for (var data in KfakePlanData) {
  //     result.add(Plan.fromJson(data));
  //   }

  //   result[0].invited = [
  //     User.fromJson(KfakeUsersData[0]),
  //     User.fromJson(KfakeUsersData[1])
  //   ];
  //   result[1].invited = [
  //     User.fromJson(KfakeUsersData[2]),
  //     User.fromJson(KfakeUsersData[3])
  //   ];

  //   return Future<List<Plan>>.delayed(
  //     const Duration(seconds: 2),
  //     () => result,
  //   );
  // }

  Future<List<Plan>> getPlansFromMapData() {
    return RestPlanRepository().getAll(client: Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("Ouaga Events"),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: [
            HeaderPart(user: User.fromJson(KfakeUsersData[0])),
            SizedBox(
              height: 30,
            ),
            buildFuturePlans()
          ],
        ),
      )),
    );
  }

  FutureBuilder<List<Plan>> buildFuturePlans() {
    return FutureBuilder<List<Plan>>(
      future:
          getPlansFromMapData(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<Plan>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          print(snapshot.data);

          children = snapshot.data
              .map((plan) => Column(
                    children: [
                      EventCard(
                        plan: plan,
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))
              .toList();
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Loading...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
