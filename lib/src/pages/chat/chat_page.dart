import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/pages/chat/chat_detail_pager.dart';
import 'package:flutter_postman_application/src/pages/chat/models/user_model.dart';
import 'package:flutter_postman_application/src/pages/products/widget/drawer_layout.dart';
import 'package:sizer/sizer.dart';

import 'models/message_model.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Message> chats = [
    Message(
      sender: ironMan,
      time: '5:30 PM',
      text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
      unread: true,
    ),
    Message(
      sender: captainAmerica,
      time: '4:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      unread: true,
    ),
    Message(
      sender: blackWindow,
      time: '3:30 PM',
      text: 'WOW! this soul world is amazing, but miss you guys.',
      unread: false,
    ),
    Message(
      sender: spiderMan,
      time: '2:30 PM',
      text: 'I\'m exposed now. Please help me to hide my identity.',
      unread: true,
    ),
    Message(
      sender: hulk,
      time: '1:30 PM',
      text: 'HULK SMASH!!',
      unread: false,
    ),
    Message(
      sender: thor,
      time: '12:30 PM',
      text:
          'I\'m hitting gym bro. I\'m immune to mortal deseases. Are you coming?',
      unread: false,
    ),
    Message(
      sender: scarletWitch,
      time: '11:30 AM',
      text: 'My twins are giving me headache. Give me some time please.',
      unread: false,
    ),
    Message(
      sender: captainMarvel,
      time: '12:45 AM',
      text: 'You\'re always special to me nick! But you know my struggle.',
      unread: false,
    ),
  ];
  @override
  void initState() {
    super.initState();
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
          icon: const Icon(
            PhosphorIcons.arrow_circle_left_bold,
            color: Colors.white,
          ),
          onPressed: () => {},
          iconSize: 40,
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
                  hintText: "Search...",
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
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message chat = chats[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailScreen(
                          user: chat.sender,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: chat.unread
                                ? BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    border: Border.all(
                                      width: 2,
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
                              backgroundImage:
                                  NetworkImage(chat.sender.imageUrl),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          chat.sender.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        chat.sender.isOnline
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5),
                                                width: 7,
                                                height: 7,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              )
                                            : Container(
                                                child: null,
                                              ),
                                      ],
                                    ),
                                    Text(
                                      chat.time,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    chat.text,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
