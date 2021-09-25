import "package:flutter/material.dart";
import 'package:flutter_app/User/User.dart';

import 'package:intl/intl.dart';

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
