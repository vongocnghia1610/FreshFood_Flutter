import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_postman_application/src/pages/option/widgets/profile_list_item.dart';
import 'package:flutter_postman_application/src/providers/user_provider.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:flutter_postman_application/src/routes/app_pages.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OptionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: 100.h, width: 100.w, allowFontScaling: true);

    var profileInfo = Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 30.w,
            width: 30.w,
            // margin: EdgeInsets.only(top: 10.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 10.w * 3,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Container(
                //     height: 10.w ,
                //     width: 10.w * 2.5,
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).accentColor,
                //       shape: BoxShape.circle,
                //     ),
                //     child: Center(
                //       heightFactor: 10.w * 1.5,
                //       widthFactor: 10.w * 1.5,
                //       child: Icon(
                //         LineAwesomeIcons.pen,
                //         color: kDarkPrimaryColor,
                //         size: ScreenUtil().setSp(10.w * 1.5),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 5.w),
          Text(
            'Nicolas Adams',
            style: kTitleTextStyle,
          ),
          SizedBox(height: 3.w),
          Text(
            'nicolasadams@gmail.com',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: 10.w),
          // Container(
          //   height: 10.w * 4,
          //   width: 10.w * 20,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.w * 3),
          //     color: Theme.of(context).accentColor,
          //   ),
          //   child: Center(
          //     child: Text(
          //       'Upgrade to PRO',
          //       style: kButtonTextStyle,
          //     ),
          //   ),
          // ),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 10.w * 3),
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(10.w * 3),
        ),
        // profileInfo,
        SizedBox(width: 10.w * 3),
      ],
    );

    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(height: 20.w),
            profileInfo,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ProfileListItem(
                      icon: LineAwesomeIcons.user_shield,
                      text: 'Thông tin cá nhân',
                      tap: () {
                        Get.toNamed(Routes.PROFILE);
                      },
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.history,
                      text: 'Đã mua',
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.question_circle,
                      text: 'Help & Support',
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.cog,
                      text: 'Settings',
                    ),
                    // ProfileListItem(
                    //   icon: LineAwesomeIcons.user_plus,
                    //   text: 'Invite a Friend',
                    // ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.alternate_sign_out,
                      text: 'Đăng xuất',
                      hasNavigation: false,
                      tap: () {
                        userProvider.setUser(null);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
