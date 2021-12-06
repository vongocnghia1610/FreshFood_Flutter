import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/models/room_model.dart';
import 'package:freshfood/src/pages/Admin/controller/chat_admin_controller.dart';
import 'package:freshfood/src/pages/chat/chat_detail_page.dart';
import 'package:freshfood/src/pages/chat/models/user_model.dart';
import 'package:freshfood/src/pages/chat/widgets/room_card.dart';
import 'package:freshfood/src/pages/option/controllers/profile_controller.dart';
import 'package:freshfood/src/pages/products/widget/drawer_layout.dart';
import 'package:freshfood/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'models/message_model.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final profileController = Get.put(ProfileController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // List<Message> chats = [
  //   Message(
  //     sender: ironMan,
  //     time: '5:30 PM',
  //     text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
  //     unread: true,
  //   ),
  //   Message(
  //     sender: captainAmerica,
  //     time: '4:30 PM',
  //     text: 'Hey, how\'s it going? What did you do today?',
  //     unread: true,
  //   ),
  //   Message(
  //     sender: blackWindow,
  //     time: '3:30 PM',
  //     text: 'WOW! this soul world is amazing, but miss you guys.',
  //     unread: false,
  //   ),
  //   Message(
  //     sender: spiderMan,
  //     time: '2:30 PM',
  //     text: 'I\'m exposed now. Please help me to hide my identity.',
  //     unread: true,
  //   ),
  //   Message(
  //     sender: hulk,
  //     time: '1:30 PM',
  //     text: 'HULK SMASH!!',
  //     unread: false,
  //   ),
  //   Message(
  //     sender: thor,
  //     time: '12:30 PM',
  //     text:
  //         'I\'m hitting gym bro. I\'m immune to mortal deseases. Are you coming?',
  //     unread: false,
  //   ),
  //   Message(
  //     sender: scarletWitch,
  //     time: '11:30 AM',
  //     text: 'My twins are giving me headache. Give me some time please.',
  //     unread: false,
  //   ),
  //   Message(
  //     sender: captainMarvel,
  //     time: '12:45 AM',
  //     text: 'You\'re always special to me nick! But you know my struggle.',
  //     unread: false,
  //   ),
  // ];
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    messageAdminController.initialRoom();
    messageAdminController.getListRoom();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          // You're at the top.
        } else {
          messageAdminController.getListRoom();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: 70.w,
        child: Drawer(
          child: DrawerLayout(),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            PhosphorIcons.arrow_left,
            color: Colors.white,
            size: 7.w,
          ),
        ),
        title: Text(
          "Chat",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Tìm kiếm...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<Object>(
                  stream: messageAdminController.listRooms,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: RoomCard(
                          room: RoomModel.fromMap(snapshot.data[index]),
                        ));
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
