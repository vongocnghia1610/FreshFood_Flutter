import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_postman_application/src/helpers/get_session.dart';
import 'package:flutter_postman_application/src/models/product.dart';
import 'package:flutter_postman_application/src/pages/home/controllers/book_controller.dart';
import 'package:flutter_postman_application/src/pages/home/controllers/product_controller.dart';
import 'package:flutter_postman_application/src/public/constant.dart';
import 'package:flutter_postman_application/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'components/header.dart';
import 'components/recoment_product.dart';
import 'components/title_with_button_more.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bookController = Get.put(BookController());
  ScrollController scrollController = ScrollController();
  final CarouselController _controller = CarouselController();
  final productController = Get.put(ProductController());
  int _current = 0;
  @override
  void initState() {
    super.initState();
    productController.initialController();
    productController.getRecommendProduct();

    // bookController.getBooks();
    // scrollController.addListener(() {
    //   if (scrollController.position.atEdge) {
    //     if (scrollController.offset != 0.0) {
    //       bookController.getBooks();
    //     }
    //   }
    // });
  }

  final List<Widget> imageSliders = listDefaultImage
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${listDefaultImage.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(
        //     Icons.refresh,
        //     size: width / 16.0,
        //   ),
        //   onPressed: () {
        //     var responseFromServer = {
        //       '_id': 'nghia',
        //       'username': 'vo ngoc ngu',
        //       'token': 'haha',
        //       'phone': '099999999',
        //       'image': 'https://sextop1.com'
        //     };
        //     User user = User.fromMap(responseFromServer);
        //     print(user.toString());
        //     print(user.toMap());
        //     // if (Get.locale == Locale('vi', 'VN')) {
        //     //   Get.updateLocale(Locale('en', 'US'));
        //     // } else {
        //     //   Get.updateLocale(Locale('vi', 'VN'));
        //     // }
        //     Get.toNamed(Routes.AUTHENTICATION, arguments: {
        //       'title': 'HAHAHA',
        //       'tuNghiaaaa': 1213,
        //     });
        //     // Get.back();
        //     // Get.offNamedUntil(Routes.ROOT, (route) => false);
        //     // Get.offAllNamed(Routes.ROOT);
        //     // if (Get.currentRoute == Routes.AUTHENTICATION) {
        //     //   // dung co chuyen
        //     // } else {}
        //   },
        // ),
        appBar: buildAppBar(),
        body: Container(
            height: 100.h,
            width: 100.w,
            child: Column(children: [
              Header(size),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: false,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ),
                    TitleWithButton(
                        title: "Recomended",
                        onpress: () {
                          Get.toNamed(Routes.PRODUCT);
                        }),
                    SizedBox(height: 10.sp),
                    Expanded(
                      child: StreamBuilder(
                        stream: productController.listProductRecommend,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          return Container(
                            width: 100.w,
                            child: ListView.builder(
                              controller: scrollController,
                              // gridDelegate:
                              //     SliverGridDelegateWithFixedCrossAxisCount(
                              //   crossAxisCount: 2,
                              //   crossAxisSpacing: 4.0,
                              //   mainAxisExtent: 4.0,
                              // ),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return RecomendProductCard(
                                  product:
                                      Product.fromMap(snapshot.data[index]),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ])));

    // GetBuilder<BookController>(
    //   builder: (controller) => GridView.builder(
    //     controller: scrollController,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       crossAxisSpacing: 4.0,
    //       mainAxisExtent: 4.0,
    //     ),
    //     itemCount: controller.listBook.length,
    //     itemBuilder: (context, index) {
    //       return Container(
    //         child: Text(controller.listBook[index]['name']),
    //       );
    //     },
    //   ),
    // ),
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: Image.asset("assets/images/logo.png"),
      title: Center(
        child: Text(
          "Hi, " + getSession(),
        ),
      ),
      actions: [
        Image.asset("assets/images/logo.png"),
      ],
    );
  }
}
