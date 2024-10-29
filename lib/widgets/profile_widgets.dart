import 'package:flutter/material.dart';
import 'package:gestion_freelance/utils/constants.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;

  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.iconColor = Colors.black, // Default color if none is provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor, // Apply the color here
      ),
      title: Text(title),
    );
  }
}
