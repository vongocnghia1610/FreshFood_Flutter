import 'package:freshfood/src/services/socket.dart';

class SocketEmit {
  // void updateOrder({status, idOrder}) {
  //   socket.emit(
  //       'ORDER_CHANGE_STATUS_CSS',
  //       status == 2
  //           ? {
  //               'status': status,
  //               'idPackage': idOrder,
  //             }
  //           : {
  //               'status': status,
  //               'idOrder': idOrder,
  //             });
  // }

  void joinRoom({idRoom}) {
    socket.emit('JOIN_ROOM_CSS', {
      'idUser': idRoom,
      // 'idPackage': idPackage,
    });
  }

  void leaveRoom({idRoom}) {
    socket.emit('LEAVE_ROOM_CSS', {
      'idUser': idRoom,
    });
  }

  void sendMessage(dynamic message) {
    print("tin nhan gui nek");
    print({
      "message": message,
    });
    socket.emit('SEND_MESSAGE_CSS', {
      "message": message,
    });
  }

  // void setFeeUser(body) {
  //   socket.emit(
  //     'UPDATE_SHIPPING_CSS',
  //     body,
  //   );
  // }
}
