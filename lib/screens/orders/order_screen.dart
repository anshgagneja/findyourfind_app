import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../api/api.dart';
import '../../helper/pref.dart';
import '../../models/Cart.dart';
import 'components/order_card.dart';


class OrderScreen extends StatefulWidget {
  static String routeName = "/orders";

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  final List orderData = [];
  var totalAmount = "0.00";
  bool _isloading = true;

  Future getorderData() async {
    _isloading = true;

    var user_id = Pref.getInt(Pref.user_id);
    final response = await Api(context).getOrderList(user_id.toString());
    print("rest${response}");
    if (response == Api.defaultError) {
      _isloading = false;
    } else if (response == Api.internetError) {
      _isloading = false;
    } else if (response == Api.authError) {
      _isloading = false;
    } else {
      _isloading = false;
      orderData.clear();
      orderData.addAll(response);
      setState(() {});
    }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getorderData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Orders",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: orderData.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: OrderCard(cart: orderData[index]),
          ),
        ),
      ),
    );
  }
}
