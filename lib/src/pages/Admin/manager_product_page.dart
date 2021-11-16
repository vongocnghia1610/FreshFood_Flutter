import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/models/cart_model.dart';
import 'package:freshfood/src/pages/Admin/widget/product_item.dart';
import 'package:freshfood/src/pages/cart/controller/cart_controller.dart';
import 'package:freshfood/src/pages/cart/widgets/cart_item.dart';
import 'package:freshfood/src/pages/cart/widgets/cart_item_button.dart';
import 'package:freshfood/src/pages/home/controllers/product_controller.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/routes/app_pages.dart';
import 'package:freshfood/src/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ManagerProductPage extends StatefulWidget {
  @override
  _ManagerProductPageState createState() => _ManagerProductPageState();
}

class _ManagerProductPageState extends State<ManagerProductPage> {
  // Stream<List<dynamic>> listItem;
  final productController = Get.put(ProductController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.getAllProduct();
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
              color: Colors.white,
              size: 7.w,
            ),
          ),
          title: Text(
            'Tất cả sản phẩm',
            style: TextStyle(
              color: Colors.white,
              fontSize: _size.width / 20.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                PhosphorIcons.plus,
                size: 7.w,
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 145.w,
                child: GetBuilder<ProductController>(
                  init: productController,
                  builder: (_) => ListView.builder(
                    controller: scrollController,
                    itemCount: productController.listAllProduct.length,
                    itemBuilder: (context, index) {
                      return ProductItem(
                        product: productController.listAllProduct[index],
                      );
                    },
                  ),
                ),
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
