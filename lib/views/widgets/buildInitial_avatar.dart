import 'package:flutter/material.dart';

import '../../core/colors.dart';

Widget buildInitialsAvatar(String? initials,String from) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: from=="doctor"?yellow:green,
      borderRadius: BorderRadius.circular(20),
    ),
    alignment: Alignment.center,
    child: Text(
      initials ?? '',
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
    ),
  );
}
