import 'package:flutter/material.dart';

import 'info_card.dart';

class DashboardCardsMediumScreen extends StatelessWidget {
  const DashboardCardsMediumScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;  
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Total devices enrolled",
              value: "10",
              onTap: (){},
              topColor: Colors.orange,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Total contents posted",
              value: "17",
              onTap: (){},
              topColor: Colors.lightGreen,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            InfoCard(
              title: "Total registered users",
              value: "5",
              onTap: (){},
              topColor: Colors.redAccent,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Scheduled contents",
              value: "3",
              onTap: (){},
            ),
          ],
        ),
      ],
    );
  }
}