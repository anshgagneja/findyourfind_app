import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../api/api.dart';
import '../constants.dart';
import '../helper/pref.dart';
import '../models/Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final dynamic product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: aspectRetio,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(product["main_image"].toString()),
              ),
            ),
            const SizedBox(height: 8),
            Flexible( // Using Flexible to prevent overflow
              child: Text(
                product["pro_name"].toString(),
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product["pro_sp"].toString()}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () async {
                    var user_id = Pref.getInt(Pref.user_id);
                    var id = product["id"];
                    final response = await Api(context).updateFavorites(user_id.toString(),id.toString());
                    print("response ----> ${response}");
                    if(response){
                      Api(context).apiSnackBar("Added to Fav", 1);
                    }else{
                      Api(context).apiSnackBar("Removed from Fav", 0);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: product["is_wish_list"]
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      colorFilter: ColorFilter.mode(
                          product["is_wish_list"]
                              ? const Color(0xFFFF4848)
                              : const Color(0xFFDBDEE4),
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
