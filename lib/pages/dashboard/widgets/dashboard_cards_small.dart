import 'package:cms/pages/dashboard/widgets/info_card_small.dart';
import 'package:flutter/material.dart';

class DashboardCardsSmallScreen extends StatelessWidget {
  const DashboardCardsSmallScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    // ignore: sized_box_for_whitespace
    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: "Total devices enrolled",
            value: "10",
            onTap: (){},
            isActive: true,
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Total contents posted",
            value: "17",
            onTap: (){},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Total registered users",
            value: "5",
            onTap: (){},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Scheduled contents",
            value: "3",
            onTap: (){},
          ),
        ],
      ),
    );
  }
}