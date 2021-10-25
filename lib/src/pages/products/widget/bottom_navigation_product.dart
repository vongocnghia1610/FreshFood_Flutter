import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:sizer/sizer.dart';

class BottomNavigationProduct extends StatelessWidget {
  const BottomNavigationProduct() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.w,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, -10),
          blurRadius: 35,
          color: kPrimaryColor.withOpacity(0.38),
        )
      ]),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    // padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {},
                    icon: Icon(
                      PhosphorIcons.discord_logo,
                      color: Color(0xFF2C3D50),
                      size: 8.w,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 0.5.w, color: Colors.grey),
                    )
                        // borderRadius: BorderRadius.circular(20)),
                        ),
                    child: IconButton(
                      // padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.cart_badge_plus,
                        color: Color(0xFF2C3D50),
                        size: 8.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 14.w,
              margin: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                border: Border.all(width: 3.w, color: kPrimaryColor),
                // borderRadius: BorderRadius.circular(20)),
              ),
              child: InkWell(
                splashColor: kPrimaryColor,
                onTap: () {
                  bottomSheet(context, "Mua ngay");
                },
                child: Container(
                  child: Text(
                    'Mua ngay',
                    style: TextStyle(
                      fontSize: 6.w,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> bottomSheet(BuildContext context, text) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 70.w,
          child: Container(
            // decoration: new BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: new BorderRadius.only(
            //         topLeft: const Radius.circular(10.0),
            //         topRight: const Radius.circular(10.0))),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(10),
                        //   topRight: Radius.circular(10),
                        // ),
                        child: Image.network(
                          "https://photo-cms-baonghean.zadn.vn/w607/Uploaded/2021/tuqzxgazsnzm/2018_11_08/143638-1.jpg",
                          fit: BoxFit.cover,
                          height: 100.sp,
                          width: 50.w,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(children: [
                        Text(
                          '1000000 VNĐ',
                          style: TextStyle(
                            fontSize: 6.w,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    )
                  ],
                ),
                Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
