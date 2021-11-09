import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/constants.dart';
import 'package:flutter_vm_v1/app/models/product_model.dart';
import 'package:flutter_vm_v1/app/utils/my_helper.dart';
import 'package:flutter_vm_v1/app/widgets/icon_button_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  final double height;
  final double width;
  final double elevation;
  final Function? onClick;
  final List<dynamic> cartList;

  const ProductCardWidget({
    Key? key,
    required this.product,
    required this.width,
    this.height = 72.0,
    this.elevation = 2.0,
    this.onClick,
    this.cartList = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
      elevation: elevation,
      color: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        side: BorderSide(
          color: kAppColor_1,
          width: 1.0,
        ),
      ),
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 2.0,
          vertical: 2.0,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: product.imageUrl,
              height: height * 0.65,
              placeholder: (context, url) {
                return Image.asset(kLoadingGif);
              },
              errorWidget: (context, url, error) {
                return Image.asset(kSnackImage);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 2.0,
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rp. ${MyHelper().currencyformat(product.price)}",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "sisa: ${product.stock}",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButtonWidget(
                        icon: Icons.add_shopping_cart_rounded,
                        backgroundColor: Colors.transparent,
                        iconSize: 24.0,
                        splashColor: kAppColor_1,
                        iconColor: kAppColor_1,
                        splashRadius: 16.0,
                        padding: 4.0,
                        isEnable: !cartList.any((cart) => cart.product == product) && product.stock != 0,
                        onClick: () => onClick!(),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
