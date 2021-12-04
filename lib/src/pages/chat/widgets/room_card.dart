import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshfood/src/models/room_model.dart';
import 'package:freshfood/src/providers/user_provider.dart';
import 'package:freshfood/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RoomCard extends StatefulWidget {
  RoomModel room;
  RoomCard({this.room});
  @override
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  void initState() {
    super.initState();
    print(widget.room.seenByUser
        .contains(Provider.of<UserProvider>(context, listen: false).user.id));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.CHAT_DETAIL, arguments: {
          "id": widget.room.idRoom,
          "name": widget.room.name,
        });
      },
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(
          horizontal: 15.sp,
          vertical: 15.sp,
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(2),
              decoration: !widget.room.seenByUser
                      .contains(Provider.of<UserProvider>(context).user.id)
                  ? BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        width: 2.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                      // shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    "https://marvelvietnam.com/wp-content/uploads/2021/06/Iron-Man-4-905x613.jpg"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            widget.room.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // chat.sender.isOnline
                          true
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Container(
                                  child: null,
                                ),
                        ],
                      ),
                      // Text(
                      //   chat.time,
                      //   style: TextStyle(
                      //     fontSize: 11,
                      //     fontWeight: FontWeight.w300,
                      //     color: Colors.black54,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.room.message,
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        color: Colors.black54,
                        fontWeight: widget.room.seenByUser.contains(
                                Provider.of<UserProvider>(context).user.id)
                            ? FontWeight.w400
                            : FontWeight.w800,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
