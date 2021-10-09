import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/product.dart';
import 'package:flutter_postman_application/src/pages/home/components/recoment_product.dart';
import 'package:flutter_postman_application/src/pages/home/components/title_with_button_more.dart';
import 'package:flutter_postman_application/src/pages/home/controllers/product_controller.dart';
import 'package:flutter_postman_application/src/pages/products/widget/drawer_layout.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CreateProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final productController = Get.put(ProductController());
  ScrollController scrollController = ScrollController();
  TextEditingController _namecontroller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    productController.initialController();
    productController.getProduct();

    // bookController.getBooks();
    // scrollController.addListener(() {
    //   if (scrollController.position.atEdge) {
    //     if (scrollController.offset != 0.0) {
    //       bookController.getBooks();
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Container(
          width: 70.w,
          child: Drawer(
            child: DrawerLayout(),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
            icon: SvgPicture.asset("assets/icons/menu.svg"),
            iconSize: 20.sp,
          ),
          centerTitle: false,
          title: Text(
            "Tạo Sản Phẩm",
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ),
        ),
        body: Container(
            height: 100.h,
            width: 100.w,
            child: SingleChildScrollView(
              child: Column(children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui lòng điền tên sản phẩm!',
                        _namecontroller,
                        "name",
                        'Điền tên của sản phẩm',
                        'Tên sản phẩm',
                        PhosphorIcons.package),
                    SizedBox(
                      height: 30.0,
                    ),
                    DropdownSearch<String>(
                        mode: Mode.MENU,
                        items: ["Brazil", "Italia ", "Tunisia", 'Canada'],
                        label: "Loại sản phẩm",
                        popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                        selectedItem: "Brazil"),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui lòng điền chi tiết sản phẩm!',
                        _namecontroller,
                        "name",
                        'Điền chi tiết sản phẩm',
                        'Chi tiết sản phẩm',
                        PhosphorIcons.clipboard_text),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui lòng điền giá sản phẩm!',
                        _namecontroller,
                        "name",
                        'Điền giá sản phẩm',
                        'Giá sản phẩm',
                        PhosphorIcons.money),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui lòng điền khối lượng sản phẩm!',
                        _namecontroller,
                        "name",
                        'Điền khối lượng sản phẩm',
                        'Khối lượng sản phẩm',
                        PhosphorIcons.scales),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui lòng điền số lượng sản phẩm!',
                        _namecontroller,
                        "name",
                        'Điền số lượng sản phẩm',
                        'Số lượng sản phẩm',
                        PhosphorIcons.stack),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                )
              ]),
            )));
  }

  TextFormField BuildTextField(
      String vali,
      TextEditingController name_controller,
      String name,
      String placeholder,
      String lable_text,
      IconData iconData) {
    return TextFormField(
      controller: name_controller,
      validator: (val) => val.trim().length == 0 ? vali : null,
      onChanged: (val) {
        name = val.trim();
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        fillColor: Colors.black,
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        labelText: lable_text,
        prefixIcon: Container(
            child: new Icon(
          iconData,
          color: Colors.black,
        )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.black, width: 1)),
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
