import 'package:cms/constants/style.dart';
import 'package:flutter/material.dart';

class RevenueInfo extends StatelessWidget {
  final String title;
  final String amount;
  const RevenueInfo(
    { 
      Key key, 
      this.title, 
      this.amount 
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title \n\n",
              style: const TextStyle(
                color: lightGrey,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: "\n $amount ",
              style: const TextStyle(
                color: dark,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}