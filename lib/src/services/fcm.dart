import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:freshfood/src/common/dialog/dialogAnimationWrapper.dart';
import 'package:freshfood/src/helpers/limit_string.dart';
import 'package:freshfood/src/pages/Admin/controller/admin_controller.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/repository/admin_repository.dart';
import 'package:freshfood/src/routes/app_pages.dart';
import 'package:freshfood/src/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

final adminController = Get.put(AdminController());

Future<void> requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    debugPrint('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    debugPrint('User granted provisional permission');
  } else {
    debugPrint('User declined or has not accepted permission');
  }
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

handleReceiveNotification(context) async {
  print('chayne');
  await requestPermission();
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage message) {
    print('chayne1');

    if (message != null) {
      if (message.data != null) {
        showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          },
          barrierColor: Color(0x80000000),
          barrierDismissible: false,
        );
        Future.delayed(Duration(milliseconds: 1200), () async {
          Get.back();
          await handleNotificationInApp(message.data);
        });
      }
    }
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('zodumcai');
    if (message.data != null) {
      if (message.data['action'] != 'MESSAGE') {
        // if (message.data['action'] == 'NEW_LOAN') {
        //   if (Get.currentRoute == Routes.LIST_REQUEST) {
        //     AdminRepository().getLoanById(message.data['_id']).then((value) {
        //       adminController.insertLoan(value);
        //     });
        //   } else {
        //     showDialogFCM(context, message);
        //   }
        // } else {
        //   showDialogFCM(context, message);
        // }
      } else {
        print('fcmneong');
        GetSnackBar getSnackBar = GetSnackBar(
          title: message.notification.title,
          subTitle: limitString(message.notification.body, 35),
          handlePressed: () {
            Get.toNamed(Routes.CHAT_DETAIL, arguments: {
              'id': message.data['idRoom'],
              'name': null,
            });
          },
        );
        if (Get.currentRoute != Routes.CHAT_DETAIL) {
          getSnackBar.show();
        }
      }
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('zodumcai1');

    debugPrint(
        'A new onMessageOpenedApp event was published!' + ' lambiengcode');
    showDialogFCM(context, message);
  }).onError((error) => print('Error: $error [\'lambiengcode\']'));
}

showDialogFCM(context, RemoteMessage message) async {
  await dialogAnimationWrapper(
      context: context,
      child: Container(
        width: 300.sp,
        height: 200.sp,
        padding: EdgeInsets.symmetric(vertical: 20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Text(
                message.notification.title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 15.sp, vertical: 7.5.sp),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: message.notification.body,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 4.sp),
            Divider(
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                handleNotificationInApp(message.data);
              },
              child: Container(
                color: Colors.transparent,
                width: 300.sp,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 5.sp),
                child: Text(
                  'Kiểm tra ngay',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: colorPrimary,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                color: Colors.transparent,
                width: 300.sp,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 5.sp),
                child: Text(
                  'Đã hiểu',
                  style: TextStyle(fontSize: 11.sp),
                ),
              ),
            ),
          ],
        ),
      ));
}

handleNotificationInApp(Map<String, dynamic> data) {
  if (data != null) {
    switch (data['action']) {
      // case 'NEW_LOAN':
      //   if (Get.currentRoute == Routes.LIST_REQUEST) {
      //   } else if (Get.currentRoute == Routes.LIST_LOANING) {
      //     Get.offAndToNamed(Routes.LIST_REQUEST);
      //   } else {
      //     Get.toNamed(Routes.LIST_REQUEST);
      //   }
      //   break;
      // case 'ACCEPT':
      //   if (Get.currentRoute == Routes.HISTORY) {
      //     Get.offAndToNamed(Routes.HISTORY);
      //   } else {
      //     Get.toNamed(Routes.HISTORY);
      //   }
      //   break;
      // case 'REJECT':
      //   if (Get.currentRoute == Routes.HISTORY) {
      //     Get.offAndToNamed(Routes.HISTORY);
      //   } else {
      //     Get.toNamed(Routes.HISTORY);
      //   }
      //   break;
      case 'MESSAGE':
        print('messageneong');
        if (Get.currentRoute == Routes.CHAT_DETAIL) {
          Get.offAndToNamed(Routes.CHAT_DETAIL, arguments: {
            'id': data['idRoom'],
            'name': null,
          });
        } else {
          Get.toNamed(Routes.CHAT_DETAIL, arguments: {
            'id': data['idRoom'],
            'name': null,
          });
        }
        break;
    }
  }
}

openDetails(dynamic data) {}
