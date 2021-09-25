import 'package:flutter/material.dart';
import 'package:flutter_app/User/User.dart';

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
