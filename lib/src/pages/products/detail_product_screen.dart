import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/product.dart';
import 'package:flutter_postman_application/src/pages/products/controllers/product_controller.dart';
import 'package:flutter_postman_application/src/pages/products/widget/bottom_navigation_product.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailProductPage extends StatefulWidget {
  String id;
  DetailProductPage({this.id});
  @override
  State<StatefulWidget> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // List<String> listImage = [
  //   "https://photo-cms-baonghean.zadn.vn/w607/Uploaded/2021/tuqzxgazsnzm/2018_11_08/143638-1.jpg",
  //   "https://img.lovepik.com/element/40031/4942.png_860.png",
  //   "http://img.vinanet.vn/zoom/500/Uploaded/ThuHai/NongSan/pork_JSGL.jpg",
  // ];
  int selectedImage = 0;
  final productController = Get.put(ProductDetailController());
  @override
  void initState() {
    super.initState();
    productController.getDetailProduct(widget.id);
    // listImage = productController.product.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                PhosphorIcons.arrow_left,
                color: Colors.white,
                size: 8.w,
              ),
            ),
            title: Center(
              child: Text(
                "Chi tiết Sản phẩm",
              ),
            ),
            actions: [
              IconButton(
                // padding: EdgeInsets.zero,
                // constraints: BoxConstraints(),
                onPressed: () {},
                icon: Icon(
                  PhosphorIcons.shopping_cart,
                  color: Colors.white,
                  size: 8.w,
                ),
              ),
            ]),
        bottomNavigationBar: BottomNavigationProduct(
          productController: productController,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<ProductDetailController>(
                init: productController,
                builder: (_) => _.product.image == null
                    ? Container()
                    : Column(
                        children: [
                          SizedBox(
                            child: GestureDetector(
                              onHorizontalDragEnd: (details) {
                                setState(() {
                                  if (details.primaryVelocity < 0) {
                                    if (selectedImage ==
                                        _.product.image.length - 1)
                                      selectedImage = 0;
                                    else
                                      selectedImage++;
                                    // print(selectedImage);
                                  }
                                  if (details.primaryVelocity > 0) {
                                    if (selectedImage == 0)
                                      selectedImage =
                                          _.product.image.length - 1;
                                    else
                                      selectedImage--;
                                  }
                                });
                              },
                              child: AspectRatio(
                                aspectRatio: 1.2,
                                child: Image.network(
                                  _.product.image[selectedImage],
                                  width: 80.w,
                                  height: 70.w,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: new EdgeInsets.only(left: 5.w, right: 5.w),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...List.generate(
                                      _.product.image.length,
                                      (index) => buildSmallPreview(
                                          index, _.product.image))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              detail(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: GetBuilder<ProductDetailController>(
                        init: productController,
                        builder: (_) => Text(_.product.name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline5),
                      ),
                    ),
                    SizedBox(height: 3.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: GetBuilder<ProductDetailController>(
                        init: productController,
                        builder: (_) => Text(
                          _.product.price.toString() + " VNĐ",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 6.w),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.w),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: GetBuilder<ProductDetailController>(
                        init: productController,
                        builder: (_) => _.product.rate == null ||
                                _.product.rate == 0
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Text(
                                  "chưa có đánh giá",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 4.w),
                                ),
                              )
                            : Row(children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                IgnorePointer(
                                  child: RatingBar.builder(
                                    initialRating: _.product.rate,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 6.w,
                                    // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),

                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  _.product.rate.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 6.w),
                                ),
                              ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 64, top: 20),
                      child: GetBuilder<ProductDetailController>(
                        init: productController,
                        builder: (_) => _.product.detail == null
                            ? Container()
                            : Text(
                                _.product.detail,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  GestureDetector buildSmallPreview(int index, List<String> listImage) {
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
