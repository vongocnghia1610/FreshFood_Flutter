import 'package:flutter/material.dart';
import 'package:flutter_postman_application/src/models/product.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
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
        onTap: () => null,
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
                          Text(widget.product.name.toUpperCase(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text('Số lượng: ${widget.product.quantity}',
                              maxLines: 1,
                              style: TextStyle(
                                  color: kPrimaryColor.withOpacity(0.5),
                                  fontSize: 12)),
                          SizedBox(height: 5.sp),
                          Text(
                            widget.product.price.toString() + " VNĐ",
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


//   ProductController _productController = new ProductController();
//   ScrollController scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: <Widget>[
          
//           StreamBuilder(
//             stream: _productController.getRecommendProduct(),
//             builder: (context, AsyncSnapshot snapshot) {
//               if (!snapshot.hasData) {
//                 return Container();
//               }

//               return ListView.builder(
//                 controller: scrollController,
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (context, index) {
//                   return RecomendProductCard(
//                     role: 0,
//                     user: User.fromMap(snapshot.data[index]),
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RecomendPlantCard extends StatelessWidget {
//   final String image, title, country;
//   final int price;
//   final Function onpress;
//   RecomendPlantCard(
//       {this.image, this.title, this.country, this.price, this.onpress});
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     // TODO: implement build
//     return Container(
//       margin: EdgeInsets.only(
//           left: kDefaultPadding,
//           top: kDefaultPadding / 2,
//           bottom: kDefaultPadding * 2.5),
//       width: size.width * 0.4,
//       child: GestureDetector(
//         onTap: () => onpress(),
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Image.asset(image),
//               Container(
//                 padding: EdgeInsets.all(kDefaultPadding / 2),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(10),
//                         bottomRight: Radius.circular(10)),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: Offset(0, 10),
//                           blurRadius: 50,
//                           color: kPrimaryColor.withOpacity(0.23))
//                     ]),
//                 child: Row(
//                   children: <Widget>[
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text('$title'.toUpperCase(),
//                             style: TextStyle(
//                               fontSize: 12,
//                             )),
//                         Text('$country'.toUpperCase(),
//                             style: TextStyle(
//                                 color: kPrimaryColor.withOpacity(0.5),
//                                 fontSize: 12))
//                       ],
//                     ),
//                     Spacer(),
//                     Text(
//                       '\$$price',
//                       style: Theme.of(context)
//                           .textTheme
//                           .button
//                           .copyWith(color: kPrimaryColor),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RecomendProductCard extends StatelessWidget {
//   final Product;
//   final Function onpress;
//   RecomendProductCard(
//       {this.id,
//       this.image,
//       this.weight,
//       this.quantity,
//       this.name,
//       this.price,
//       this.onpress});
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     // TODO: implement build
//     return Container(
//       margin: EdgeInsets.only(
//           left: kDefaultPadding,
//           top: kDefaultPadding / 2,
//           bottom: kDefaultPadding * 2.5),
//       width: size.width * 0.4,
//       child: GestureDetector(
//         onTap: () => onpress(),
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Image.asset(image),
//               Container(
//                 padding: EdgeInsets.all(kDefaultPadding / 2),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(10),
//                         bottomRight: Radius.circular(10)),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: Offset(0, 10),
//                           blurRadius: 50,
//                           color: kPrimaryColor.withOpacity(0.23))
//                     ]),
//                 child: Row(
//                   children: <Widget>[
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text('$name'.toUpperCase(),
//                             style: TextStyle(
//                               fontSize: 12,
//                             )),
//                         Text('$quantity'.toUpperCase(),
//                             style: TextStyle(
//                                 color: kPrimaryColor.withOpacity(0.5),
//                                 fontSize: 12))
//                       ],
//                     ),
//                     Spacer(),
//                     Text(
//                       '\$$price',
//                       style: Theme.of(context)
//                           .textTheme
//                           .button
//                           .copyWith(color: kPrimaryColor),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
