import 'package:flutter/material.dart';
import 'package:flutter_postman_application/src/helpers/money_formatter.dart';
import 'package:flutter_postman_application/src/models/product.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:flutter_postman_application/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RecomendProductCard extends StatefulWidget {
  final ProductModel product;
  RecomendProductCard({this.product});
  @override
  State<StatefulWidget> createState() => _RecomendProductCardState();
}

class _RecomendProductCardState extends State<RecomendProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 60.w,
      margin: EdgeInsets.only(left: 5.sp),
      child: GestureDetector(
        onTap: () => {
          Get.toNamed(Routes.DETAIL_PRODUCT,
              arguments: {"id": widget.product.id})
        },
        child: Container(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  widget.product.image[0],
                  fit: BoxFit.cover,
                  height: 100.sp,
                  width: 40.w,
                ),
              ),
              Container(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23))
                    ]),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 10.w,
                            child: Text(widget.product.name.toUpperCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ),
                          Text('Số lượng: ${widget.product.quantity}',
                              maxLines: 1,
                              style: TextStyle(
                                  color: kPrimaryColor.withOpacity(0.5),
                                  fontSize: 12)),
                          SizedBox(height: 5.sp),
                          Text(
                            formatMoney(widget.product.price),
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: kPrimaryColor),
                          ),
                          SizedBox(height: 5.sp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
