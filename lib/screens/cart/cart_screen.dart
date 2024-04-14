import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../api/api.dart';
import '../../helper/pref.dart';
import '../../models/Cart.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final List cartData = [];
  var totalAmount = "0.00";
  bool _isloading = true;

  Future getCartData() async {
    _isloading = true;

    var user_id = Pref.getInt(Pref.user_id);
    final response = await Api(context).getCartList(user_id.toString());
    print("rest${response}");
    if (response == Api.defaultError) {
      _isloading = false;
    } else if (response == Api.internetError) {
      _isloading = false;
    } else if (response == Api.authError) {
      _isloading = false;
    } else {
      _isloading = false;
      cartData.clear();
      cartData.addAll(response["data"]);
      totalAmount = response["total"].toString();
      setState(() {});
    }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${cartData.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: cartData.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(cartData[index]["id"].toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {

                // setState(() {
                //   demoCarts.removeAt(index);
                // });
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: CartCard(cart: cartData[index]),
            ),
          ),
        ),
      ),
      bottomNavigationBar:  CheckoutCard(totalAmount: totalAmount.toString()),
    );
  }
}
