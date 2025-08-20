import 'package:flutter/cupertino.dart';

import '../../core/colors.dart';

Widget timeViewWidget(BuildContext context, String time) {
  return Container(
    decoration: BoxDecoration(
      color: grey,
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(time, style: TextStyle(fontSize: 13)),
    ),
  );
}
