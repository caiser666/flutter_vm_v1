import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/constants.dart';
import 'package:flutter_vm_v1/app/models/my_cart_model.dart';
import 'package:flutter_vm_v1/app/utils/my_helper.dart';
import 'package:flutter_vm_v1/app/widgets/icon_button_widget.dart';

class CartCardWidget extends StatelessWidget {
  final MyCartModel cart;
  final Function? onClickIncrement;
  final Function? onClickDecrement;
  final Function? onClickRemove;

  const CartCardWidget({
    Key? key,
    required this.cart,
    this.onClickIncrement,
    this.onClickDecrement,
    this.onClickRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _totalPrice = cart.quantity * cart.product.price;
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      elevation: 4.0,
      color: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        side: BorderSide(
          color: kAppColor_1,
          width: 1.0,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: cart.product.imageUrl,
              height: 72,
              placeholder: (context, url) {
                return Image.asset(kLoadingGif);
              },
              errorWidget: (context, url, error) {
                return Image.asset(kSnackImage);
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.product.title,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Harga Satuan: Rp. ${MyHelper().currencyformat(cart.product.price)}",
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 0.0),
                                child: Row(
                                  children: [
                                    IconButtonWidget(
                                      icon: Icons
                                          .indeterminate_check_box_outlined,
                                      backgroundColor: Colors.transparent,
                                      iconSize: 24.0,
                                      splashColor: kAppColor_1,
                                      iconColor: kAppColor_1,
                                      splashRadius: 10.0,
                                      padding: 2.0,
                                      isEnable: cart.quantity > 1,
                                      onClick: () => onClickDecrement!(),
                                    ),
                                    Container(
                                      width: 18.0,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.0),
                                      alignment: Alignment.center,
                                      child: Center(
                                        child: Text(
                                          "${cart.quantity}",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButtonWidget(
                                      icon: Icons.add_box_outlined,
                                      backgroundColor: Colors.transparent,
                                      iconSize: 24.0,
                                      splashColor: kAppColor_1,
                                      iconColor: kAppColor_1,
                                      splashRadius: 10.0,
                                      padding: 2.0,
                                      isEnable:
                                          cart.quantity != cart.product.stock,
                                      onClick: () => onClickIncrement!(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButtonWidget(
                          icon: Icons.delete_forever,
                          backgroundColor: Colors.transparent,
                          iconSize: 24.0,
                          splashColor: Colors.red.shade300,
                          iconColor: Colors.red.shade800,
                          splashRadius: 16.0,
                          padding: 4.0,
                          isEnable: true,
                          onClick: () => onClickRemove!(),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Total: ${cart.quantity} x Rp. ${MyHelper().currencyformat(cart.product.price)} =",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Rp. ${MyHelper().currencyformat(_totalPrice)}",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
