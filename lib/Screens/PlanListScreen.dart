import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/Plan/Plan.dart';
import 'package:flutter_app/User/User.dart';
import 'package:intl/intl.dart';

import '../FakeData/FUser.dart';
import '../FakeData/FPlan.dart';

class PlanListScreen extends StatelessWidget {
  static String pageName = "/planList";

  Future<List<Plan>> getPlansFromMapData() {
    List<Plan> result = [];
    for (var data in KfakePlanData) {
      result.add(Plan.fromJson(data));
    }

    result[0].invited = [
      User.fromJson(KfakeUsersData[0]),
      User.fromJson(KfakeUsersData[1])
    ];
    result[1].invited = [
      User.fromJson(KfakeUsersData[2]),
      User.fromJson(KfakeUsersData[3])
    ];

    return Future<List<Plan>>.delayed(
      const Duration(seconds: 2),
      () => result,
    );
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

class EventCard extends StatelessWidget {
  Plan plan;

  EventCard({@required this.plan});

  String getDate(String date) {
    DateTime date = DateTime.parse(plan.date);
// MMMMd
    return DateFormat(DateFormat.DAY).format(date) +
        " " +
        DateFormat(DateFormat.MONTH).format(date);
  }

  @override
  Widget build(BuildContext context) {
    var topPart = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ParticipantsImages(
          participants: plan.invited,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(2),
            color: Colors.white,
            child: Text(
              getDate(plan.date),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );

    var bottomPart = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${plan.id}",
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          "${plan.title}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            // color: Colors.red,
            child: Text(
              "${plan.description}",
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ))
      ],
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(plan.covImage),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  topPart,
                  bottomPart,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ParticipantsImages extends StatelessWidget {
  final List<User> participants;
  ParticipantsImages({this.participants});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: Colors.red,
          height: 50,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        ...participants.asMap().entries.map((entry) {
          return Positioned(
            left: entry.key.toDouble() * 28,
            child: CircleAvatar(
              backgroundImage: NetworkImage(entry.value.profilePic),
            ),
          );
        }).toList()
      ],
    );
  }
}

class HeaderPart extends StatelessWidget {
  final User user;
  HeaderPart({this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat(DateFormat.MONTH_WEEKDAY_DAY)
                .format(DateTime.now())),
            Text(
              "Mes sorties 😏 ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(user.profilePic),
        )
      ],
    );
  }
}
