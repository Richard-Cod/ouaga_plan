import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

import 'package:intl/intl.dart';

class HeaderPart extends StatelessWidget {
  HeaderPart();

  String getProfilePic(User user) {
    if (user.photoURL != null) return user.photoURL;

    if (user.displayName != null)
      return "https://eu.ui-avatars.com/api/?name=" + user.displayName;

    return "https://via.placeholder.com/150";
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    print(user);

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
          backgroundImage: NetworkImage(getProfilePic(user)),
        )
      ],
    );
  }
}
