import 'package:flutter/material.dart';
import 'package:sliver_tutorial/constants.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Icon(
          Icons.circle_outlined,color: Constants.appBarTextColor
        ),
        Text(
          'My Spending',
          style: TextStyle(color: Constants.appBarTextColor, fontSize: 20.0),
        ),
        Icon(
          Icons.calendar_today,color: Constants.appBarTextColor
        ),
      ],
    );
  }
}
