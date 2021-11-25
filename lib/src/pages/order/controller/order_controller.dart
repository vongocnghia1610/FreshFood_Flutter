import 'package:freshfood/src/models/order.dart';
import 'package:freshfood/src/repository/order_repository.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<OrderModel> list0 = [];
  List<OrderModel> list1 = [];
  List<OrderModel> list2 = [];
  List<OrderModel> list3 = [];
  List<OrderModel> list4 = [];

  //Chờ xác nhận
  getOrder({
    String search,
    int skip,
    int limit,
  }) {
    OrderRepository()
        .getOrders(search: search, skip: skip, limit: limit, status: 0)
        .then((value) {
      print("value:");
      print(value);
      if (value != null)
        list0 = value.map((e) => OrderModel.fromMap(e)).toList();

      update();
    });
    OrderRepository()
        .getOrders(search: search, skip: skip, limit: limit, status: 1)
        .then((value) {
      print("value:");
      print(value);
      if (value != null)
        list1 = value.map((e) => OrderModel.fromMap(e)).toList();
    });
    OrderRepository()
        .getOrders(search: search, skip: skip, limit: limit, status: 2)
        .then((value) {
      print("value:");
      print(value);
      if (value != null)
        list2 = value.map((e) => OrderModel.fromMap(e)).toList();
    });
    OrderRepository()
        .getOrders(search: search, skip: skip, limit: limit, status: 3)
        .then((value) {
      print("value:");
      print(value);
      if (value != null)
        list3 = value.map((e) => OrderModel.fromMap(e)).toList();
    });
    OrderRepository()
        .getOrders(search: search, skip: skip, limit: limit, status: 4)
        .then((value) {
      print("value:");
      print(value);
      if (value != null)
        list4 = value.map((e) => OrderModel.fromMap(e)).toList();
    });
    update();
  }
}
