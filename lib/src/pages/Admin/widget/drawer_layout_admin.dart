import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/pages/Admin/manager_product_page.dart';
import 'package:freshfood/src/pages/Admin/manager_user.dart';
import 'package:freshfood/src/providers/user_provider.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/routes/app_pages.dart';
import 'package:freshfood/src/services/socket.dart';
import 'package:freshfood/src/services/socket_emit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DrawerLayoutAdmin extends StatefulWidget {
  int status;
  DrawerLayoutAdmin({this.status});
  @override
  State<StatefulWidget> createState() => _DrawerLayoutAdminState();
}

class _DrawerLayoutAdminState extends State<DrawerLayoutAdmin> {
  List<String> listAdmin = [
    "Quản lý sản phẩm",
    "Quản lý người dùng",
    "Quản lý đơn hàng",
    "Tin nhắn",
    "Quản lý tài khoản VNPAY",
    "Quản lý tài khoản PAYPAL",
    "Thống kê",
    "Thông tin cá nhân",
    "Đăng xuất"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1617909517211-c4e4275bf5b6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHNoaXBwaW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // currentAccountPicture: Container(
                  //   width: 30.sp,
                  //   height: 30.sp,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       fit: BoxFit.fill,
                  //       image: NetworkImage(
                  //         "https://www.google.com/imgres?imgurl=https%3A%2F%2Flookaside.fbsbx.com%2Flookaside%2Fcrawler%2Fmedia%2F%3Fmedia_id%3D309300366316049&imgrefurl=https%3A%2F%2Fwww.facebook.com%2FFreshFood-%25C4%2582n-V%25E1%25BA%25B7t-Ngon-309300366316049%2Fposts&tbnid=CXYmJu6eu5J7XM&vet=12ahUKEwjkoeDbxbPzAhVG7JQKHU-hCpQQMygBegUIARCzAQ..i&docid=DcHaRLaRnl3-SM&w=1500&h=1504&q=freshfood&ved=2ahUKEwjkoeDbxbPzAhVG7JQKHU-hCpQQMygBegUIARCzAQ",
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // accountName: Container(
                  //   child: Text(
                  //     // Provider.of<UserProvider>(context).user.fullName,
                  //     "a",
                  //     style: TextStyle(
                  //       // color: mCL,
                  //       fontSize: 12.sp,
                  //       // fontFamily: FontFamily.lato,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                  // accountEmail: Container(
                  //   child: Text(
                  //     // Provider.of<UserProvider>(context).user.phone,
                  //     "b",
                  //     style: TextStyle(
                  //       // color: mCL,
                  //       fontSize: 10.sp,
                  //       // fontFamily: FontFamily.lato,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.ADMIN_MANAGER_PRODUCT,
                  );
                },
                child: _buildLineDrawer(
                  context,
                  0,
                  PhosphorIcons.fish_bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.ADMIN_MANAGER_USER,
                  );
                },
                child: _buildLineDrawer(
                  context,
                  1,
                  PhosphorIcons.users_bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // if (Get.find())
                  Get.toNamed(
                    Routes.ADMIN_MANAGER_ORDER,
                  );
                },
                child: _buildLineDrawer(
                  context,
                  2,
                  PhosphorIcons.clipboard_bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.CHAT,
                  );
                },
                child: _buildLineDrawer(
                  context,
                  3,
                  PhosphorIcons.messenger_logo,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ADMIN_WALLET, arguments: {'method': 2});
                },
                child: _buildLineDrawer(
                  context,
                  4,
                  PhosphorIcons.wallet_bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ADMIN_WALLET, arguments: {'method': 1});
                },
                child: _buildLineDrawer(
                  context,
                  5,
                  PhosphorIcons.wallet_bold,
                ),
              ),

              GestureDetector(
                onTap: () {
                  // Get.toNamed(
                  //   Routes.ADMIN_MANAGER_USER,
                  // );
                },
                child: _buildLineDrawer(
                  context,
                  6,
                  PhosphorIcons.chart_line_up_bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE,
                      arguments: {'user': userProvider.user});
                },
                child: _buildLineDrawer(
                  context,
                  7,
                  PhosphorIcons.user_bold,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await SocketEmit().deleteDeviceInfo();
                  await FirebaseMessaging.instance.deleteToken();
                  socket.disconnect();
                  userProvider.setUser(null);
                  Get.offAllNamed(Routes.ROOT);
                },
                child: _buildLineDrawer(
                  context,
                  8,
                  PhosphorIcons.sign_out_bold,
                ),
              ),
              // Provider.of<UserProvider>(context).user.role == 0
              //     ? Container()
              //     : Divider(
              //         height: .2,
              //         thickness: .2,
              //         color: Colors.black26,
              //       ),
              // Provider.of<UserProvider>(context).user.role == 1
              //     ? GestureDetector(
              //         onTap: () {
              //           Get.toNamed(Routes.HOME + Routes.LIST_CLIENT);
              //         },
              //         child: _buildLineDrawer(
              //             context, 'Khách hàng', PhosphorIcons.users_four_bold),
              //       )
              //     : Container(),
              // Provider.of<UserProvider>(context).user.role == 1
              //     ? Divider(
              //         height: .2,
              //         thickness: .2,
              //         color: Colors.black26,
              //       )
              //     : Container(),
              // Provider.of<UserProvider>(context).user.role == 1
              //     ? GestureDetector(
              //         onTap: () {
              //           Get.toNamed(Routes.HOME + Routes.LIST_STAFF);
              //         },
              //         child: _buildLineDrawer(
              //             context, 'Nhân viên', PhosphorIcons.users_three_bold),
              //       )
              //     : Container(),
              // Provider.of<UserProvider>(context).user.role == 1
              //     ? Divider(
              //         height: .2,
              //         thickness: .2,
              //         color: Colors.black26,
              //       )
              //     : Container(),
              // Provider.of<UserProvider>(context).user.role == 1
              //     ? GestureDetector(
              //         onTap: () {
              //           Get.toNamed(Routes.ADDRESS);
              //         },
              //         child: _buildLineDrawer(
              //             context, 'Địa chỉ', PhosphorIcons.map_pin_bold),
              //       )
              //     : Container(),
              // Provider.of<UserProvider>(context).user.role == 1
              //     ? Divider(
              //         height: .2,
              //         thickness: .2,
              //         color: Colors.black26,
              //       )
              //     : Container(),
              // GestureDetector(
              //   onTap: () {
              //     Get.toNamed(
              //       Routes.HOME + Routes.EDIT_PROFILE,
              //     );
              //   },
              //   child: _buildLineDrawer(
              //     context,
              //     'Sửa thông tin cá nhân',
              //     PhosphorIcons.clipboard_bold,
              //   ),
              // ),
              // Divider(
              //   height: .2,
              //   thickness: .2,
              //   color: Colors.black26,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Get.toNamed(
              //       Routes.HOME + Routes.CHANGE_PASSWORD,
              //     );
              //   },
              //   child: _buildLineDrawer(
              //     context,
              //     'Đổi mật khẩu',
              //     PhosphorIcons.key_bold,
              //   ),
              // ),
              // Divider(
              //   height: .2,
              //   thickness: .2,
              //   color: Colors.black26,
              // ),
              // GestureDetector(
              //   onTap: () async {
              //     await FirebaseMessaging.instance.deleteToken();
              //     socket.disconnect();
              //     socket = null;
              //     userProvider.setUser(null);
              //   },
              //   child: _buildLineDrawer(
              //       context, 'Đăng xuất', PhosphorIcons.sign_out_bold),
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 18.sp, right: 8.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Admin',
                  style: TextStyle(
                    color: colorDarkGrey,
                    fontSize: 8.5.sp,
                    // fontFamily: FontFamily.lato,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLineDrawer(context, title, icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.25.sp, horizontal: 10.sp),
      color: Colors.transparent,
      child: Row(
        children: [
          Icon(
            icon,
            color: title == widget.status ? kPrimaryColor : colorTitle,
            size: 17.25.sp,
          ),
          SizedBox(width: 10.sp),
          Text(
            listAdmin[title],
            style: TextStyle(
              color: title == widget.status ? kPrimaryColor : colorTitle,
              fontSize: 11.25.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
