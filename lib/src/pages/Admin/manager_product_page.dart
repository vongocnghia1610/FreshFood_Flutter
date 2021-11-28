import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freshfood/src/models/cart_model.dart';
import 'package:freshfood/src/models/product.dart';
import 'package:freshfood/src/pages/Admin/widget/drawer_layout_admin.dart';
import 'package:freshfood/src/pages/Admin/widget/product_item.dart';
import 'package:freshfood/src/pages/cart/controller/cart_controller.dart';
import 'package:freshfood/src/pages/cart/widgets/cart_item.dart';
import 'package:freshfood/src/pages/cart/widgets/cart_item_button.dart';
import 'package:freshfood/src/pages/home/controllers/product_controller.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/routes/app_pages.dart';
import 'package:freshfood/src/services/socket.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.getAllProduct();
    connectAndListen();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
        // backgroundColor: AppColors.LIGHT,
        key: _scaffoldKey,
        drawer: Container(
          width: 70.w,
          child: Drawer(
            child: DrawerLayoutAdmin(status: 0),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
            icon: SvgPicture.asset("assets/icons/menu.svg"),
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
              onPressed: () {
                Get.toNamed(Routes.CREATE_PRODUCT);
              },
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
                height: 175.w,
                child: GetBuilder<ProductController>(
                  init: productController,
                  builder: (_) => ListView.builder(
                    controller: scrollController,
                    itemCount: productController.listAllProduct.length,
                    itemBuilder: (context, index) {
                      return ProductItem(
                        product: ProductModel.fromMap(_.listAllProduct[index]),
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
