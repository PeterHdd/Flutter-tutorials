// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sliver_tutorial/constants.dart';

class FlexibleBar extends StatelessWidget {
  const FlexibleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Total Balance',
              style: TextStyle(color: Constants.appBarTextColor, fontSize: 15.0),
            ),
            Text(
              "\$3,048",
              style: TextStyle(
                  color: Constants.appBarTextColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.more_horiz),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0,bottom: 5.0),
              child: Row(
                children: [
                  Text(
                    "\$3,048",
                    style: TextStyle(
                        color: Constants.appBarTextColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "USD",
                    style: TextStyle(
                      color: Constants.appBarTextColor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "AUS \$3,800",
                    style: TextStyle(
                      color: Constants.appBarTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0,bottom: 10.0),
              child: LinearProgressIndicator(
                minHeight: 5,
                backgroundColor: Constants.linearProgressIndicatorColor,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Constants.appBarTextColor,
                ),
                value: 0.8,
              ),
            ),
          ],
      ),
    );
  }
}
