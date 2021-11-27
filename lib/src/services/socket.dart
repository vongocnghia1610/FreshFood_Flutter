import 'package:flutter/material.dart';
import 'package:freshfood/src/providers/chat_provider.dart';
import 'package:freshfood/src/repository/base_repository.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert' as convert;

// final orderController = Get.put(OrderController());
// final adminController = Get.put(AdminController());
IO.Socket socket;

void connectAndListen() async {
  HandleApis().getBaseURLSocket().then((value) {
    print("zo socket nek");
    print(value);
    socket = IO.io(
      value,
      IO.OptionBuilder().enableForceNew().setTransports(['websocket']).build(),
    );
    socket.connect();
    socket.onConnect((_) {
      debugPrint('connect');

      // socket.on(
      //   'ORDER_CHANGE_STATUS_SSC',
      //   (data) {
      //     Get.back();
      //     orderController.refreshOrder(convert.jsonDecode(data));
      //   },
      // );

      socket.on(
        'SEND_MESSAGE_SSC',
        (data) {
          print("nhan thong tin tu serve");
          print(data);
          chatProvider.insertMessage(data);
          // infoUserProvider.addInfoUser(data['createUser'] ?? null);
        },
      );

      // socket.on('UPDATE_SHIPPING_SSC', (data) {
      //   if (!data['error']) {
      //     if (userProvider.user.role == 0) {
      //       userProvider.updateShippingFee(data);
      //     } else {
      //       Get.back();
      //       Get.back();
      //       adminController.setShippingFee(
      //         data['_id'],
      //         data,
      //       );
      //     }
      //   } else {
      //     if (userProvider.user.role == 1) {
      //       Get.back();
      //       GetSnackBar getSnackBar = GetSnackBar(
      //         title: 'Xét giá ship thất bại',
      //         subTitle: 'Lỗi máy chủ, thử lại sau!',
      //       );
      //       getSnackBar.show();
      //     }
      //   }
      // }
    });

    socket.onDisconnect((_) => debugPrint('disconnect'));
  });
}
