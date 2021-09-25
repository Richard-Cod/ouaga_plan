import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/Plan/Plan.dart';
import 'package:intl/intl.dart';

import 'ParticipantImages.dart';

class EventCard extends StatelessWidget {
  final Plan plan;

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
