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

class DetailProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> listImage = [
    "https://photo-cms-baonghean.zadn.vn/w607/Uploaded/2021/tuqzxgazsnzm/2018_11_08/143638-1.jpg",
    "https://img.lovepik.com/element/40031/4942.png_860.png",
    "http://img.vinanet.vn/zoom/500/Uploaded/ThuHai/NongSan/pork_JSGL.jpg"
  ];
  int selectedImage = 0;
  @override
  void initState() {
    super.initState();
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
              icon: const Icon(
                PhosphorIcons.arrow_circle_left_bold,
                color: Colors.white,
              ),
              onPressed: () => {},
              iconSize: 40,
            ),
            title: Text(
              "Detail Sản phảm",
            ),
            actions: [
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Row(children: [
                  Text(
                    "4.5",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Icon(
                    PhosphorIcons.star_fill,
                    color: Colors.yellow,
                    size: 20,
                  ),
                ]),
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.network(listImage[selectedImage]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      listImage.length, (index) => buildSmallPreview(index))
                ],
              ),
              detail(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Thịt Heo Siêu Nạc",
                            style: Theme.of(context).textTheme.headline5)),
                    Padding(
                        padding: EdgeInsets.only(left: 20, right: 64, top: 20),
                        child: Text(
                          "Thịt đùi heo là phần thịt đặc trưng được lấy từ đùi sau của heo bao gồm nạc, mỡ và da.",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              border: Border.all(
                                  width: 2, color: Colors.pinkAccent),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Thêm vào giỏ hàng',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.all(3),
        height: 10.h,
        width: 18.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selectedImage == index
                    ? kPrimaryColor
                    : Colors.transparent)),
        child: Image.network(listImage[index]),
      ),
    );
  }
}

class detail extends StatelessWidget {
  const detail({Key key, @required this.color, @required this.child})
      : super(key: key);
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 300,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
