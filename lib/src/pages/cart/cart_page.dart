import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/cart.dart';
import 'package:flutter_postman_application/src/pages/cart/controller/cart_controller.dart';
import 'package:flutter_postman_application/src/pages/cart/widgets/cart_item.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Stream<List<dynamic>> listItem;
  final cartController = Get.put(CartController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartController.getListProduct();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
        // backgroundColor: AppColors.LIGHT,
        appBar: AppBar(
          centerTitle: true,
          elevation: .0,
          backgroundColor: Colors.green.shade50,
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
              color: Color(0xFF2C3D50),
              fontSize: _size.width / 20.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
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

                return Container(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return CartItem(
                        cart: CartModel.fromMap(snapshot.data[index]),
                      );
                    },
                  ),
                );
              }),
          // bottomNavigationBar: CartTotal(),
        ));
  }
}
