import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/pages/home/home_page.dart';
import 'package:flutter_postman_application/src/public/constant.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:flutter_postman_application/src/repository/authentication_repository.dart';
import 'package:flutter_postman_application/src/routes/app_pages.dart';
import 'package:flutter_postman_application/src/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class ProfilePages extends StatefulWidget {
  ProfilePages();

  @override
  _ProfilePagesState createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  String email;
  String password;
  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _birthdaycontroller = new TextEditingController();
  TextEditingController _sexcontroller = new TextEditingController();
  TextEditingController _addresscontroller = new TextEditingController();
  TextEditingController _phone_numbercontroller = new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent, elevation: 0, actions: []),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 35.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.deepOrange, Colors.pinkAccent])),
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 115,
                          width: 115,
                          child: Stack(
                            fit: StackFit.expand,
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
                                ),
                              ),
                              Positioned(
                                right: -16,
                                bottom: 0,
                                child: SizedBox(
                                  height: 46,
                                  width: 46,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        side: BorderSide(color: Colors.white),
                                      ),
                                      primary: Colors.white,
                                      backgroundColor: Color(0xFFF5F6F9),
                                    ),
                                    onPressed: () {},
                                    child: Icon(
                                      PhosphorIcons.camera_bold,
                                      color: Colors.black, // Pencil Icon
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                        BuildTextField(
                            'Vui lòng điền tên của bạn!',
                            _namecontroller,
                            "name",
                            'Điền họ và tên của bạn',
                            'Họ và tên',
                            PhosphorIcons.user),
                        SizedBox(
                          height: 30.0,
                        ),
                        BuildTextField(
                            'Vui lòng điền email!',
                            _namecontroller,
                            "name",
                            'Điền Email',
                            'Email',
                            PhosphorIcons.envelope),
                        SizedBox(
                          height: 30.0,
                        ),
                        BuildTextField(
                            'Vui lòng điền số điện thoại',
                            _namecontroller,
                            "name",
                            'Điền số điện thoại',
                            'Số điện thoại',
                            PhosphorIcons.phone),
                        SizedBox(
                          height: 30.0,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () async {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  border: Border.all(
                                      width: 2, color: Colors.pinkAccent),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                'Lưu thông tin',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField BuildTextField(
      String vali,
      TextEditingController name_controller,
      String name,
      String placeholder,
      String lable_text,
      IconData iconData) {
    return TextFormField(
      controller: name_controller,
      validator: (val) => val.trim().length == 0 ? vali : null,
      onChanged: (val) {
        name = val.trim();
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        fillColor: Colors.black,
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        labelText: lable_text,
        prefixIcon: Container(
            child: new Icon(
          iconData,
          color: Colors.black,
        )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.black, width: 1)),
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
