import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Cart.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final dynamic cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1, // Set the border width here
          color: kPrimaryColor, // Set the border color here
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart["order_date"],
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: cart["title"].replaceAll("<br>", "\n"),
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                ],
              )
            ),
            const SizedBox(height: 8),


            Text(
              cart["status_text"],
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
