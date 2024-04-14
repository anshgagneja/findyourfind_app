import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import '../details/details_screen.dart';



import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../api/api.dart';
import '../../helper/pref.dart';
import '../details/details_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static String routeName = "/products";
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();

}


class _FavoriteScreenState extends State<FavoriteScreen> {
  final List products = [];
  bool _isloading = true;

  Future getProducts() async {
    _isloading = true;

    var user_id = Pref.getInt(Pref.user_id);
    final response = await Api(context).getFavorites(user_id.toString());

    if (response == Api.defaultError) {
      _isloading = false;
    } else if (response == Api.internetError) {
      _isloading = false;
    } else if (response == Api.authError) {
      _isloading = false;
    } else {
      _isloading = false;
      products.clear();
      products.addAll(response);
      setState(() {});
    }


  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _isloading ? Center(child: CircularProgressIndicator(),) : (products.length > 0 ) ? GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => ProductCard(
              product: products[index],
              onPress: () => Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments:
                ProductDetailsArguments(product: products[index]),
              ),
            ),
          ) : Center(child: Text("No Data Found"),),
        ),
      ),
    );
  }
}

