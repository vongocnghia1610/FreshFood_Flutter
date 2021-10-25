import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/cart.dart';
import 'package:flutter_postman_application/src/pages/cart/controller/cart_controller.dart';
import 'package:flutter_postman_application/src/pages/cart/widgets/cart_item.dart';
import 'package:flutter_postman_application/src/pages/cart/widgets/cart_item_button.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Stream<List<dynamic>> listItem;
  final cartController = Get.put(CartController());
  bool selectAll;
  double total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartController.initialController();
    cartController.getListProduct();
    // cartController.getTotalMoney(listCart)();

    selectAll = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
        // backgroundColor: AppColors.LIGHT,
        appBar: AppBar(
          centerTitle: true,
          elevation: .0,
          backgroundColor: kPrimaryColor,
          brightness: Brightness.light,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              PhosphorIcons.arrow_left,
              color: Color(0xFF2C3D50),
              size: _size.width / 15.0,
            ),
          ),
          title: Text(
            'Giỏ hàng',
            style: TextStyle(
              color: Colors.white,
              fontSize: _size.width / 20.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => cartController.deleteItem(),
              icon: Icon(
                PhosphorIcons.trash,
                size: 7.w,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: selectAll == false
                        ? Icon(
                            Icons.check_box_outline_blank_outlined,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.check_box_rounded,
                            color: Colors.green,
                          ),
                    onPressed: () {
                      setState(() {
                        if (selectAll == false) {
                          selectAll = true;
                          cartController.selectAddCart();
                        } else {
                          selectAll = false;
                          cartController.deleteAddCart();
                        }
                      });
                    },
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "Tất cả",
                    style: TextStyle(
                      fontSize: 4.w,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Tổng tiền:",
                          style: TextStyle(
                            fontSize: 4.w,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2.w),
                        Container(
                          width: 32.w,
                          child: Center(
                              child: StreamBuilder(
                                  stream: cartController.total,
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return Text(
                                        "0 VNĐ",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 5.w,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      );
                                    }
                                    return Text(
                                      snapshot.data + "VNĐ",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 5.w,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                    // child: Text(
                                    //   cartController.total,
                                    //   maxLines: 1,
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: TextStyle(
                                    //     fontSize: 5.w,
                                    //     color: Colors.green,
                                    //     fontWeight: FontWeight.w500,
                                    //   ),
                                    // ),
                                  })),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),
                  FlatButton(
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: Text(
                        'Thanh toán',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 145.w,
                child: StreamBuilder(
                    stream: cartController.listProduct,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      // listCart = (snapshot.data as List<dynamic>)
                      //     .map((data) => CartModel.fromMap(data))
                      //     .toList();
                      print("reset ne");
                      return Container(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return CartItem(
                              cart: CartModel.fromMap(snapshot.data[index]),
                              selectedAll: selectAll,
                              cartController: cartController,
                              listCart: (snapshot.data as List<dynamic>)
                                  .map((data) => CartModel.fromMap(data))
                                  .toList(),
                              index: index,
                            );
                          },
                        ),
                      );
                    }),
              ),

              // Container(
              //   decoration:
              //       BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              // ),
            ],
          ),
          // bottomNavigationBar: CartTotal(),
        ));
  }
}
