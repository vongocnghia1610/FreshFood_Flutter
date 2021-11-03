import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/common/bottom_sheet_location.dart';
import 'package:flutter_postman_application/src/models/address.dart';
import 'package:flutter_postman_application/src/models/history.dart';
import 'package:flutter_postman_application/src/pages/address/widget/option.dart';
import 'package:flutter_postman_application/src/pages/payment/widget/default_button.dart';
import 'package:flutter_postman_application/src/pages/products/widget/drawer_layout.dart';
import 'package:flutter_postman_application/src/public/constant.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:sizer/sizer.dart';

class EditAddressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  bool isMain = false;
  String province = '', distric = '';
  List<AddressModel> listAddressModel = [
    AddressModel(
        name: "Nguyễn Phan Nhật Phong",
        phone: "0968356159",
        address: "215-115 Nguyễn Xí",
        province: "Bình Thạnh",
        district: "Phường 26",
        isMain: true),
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
            iconSize: 30,
          ),
          title: Text(
            "Sửa địa chỉ",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.grey[200],
          padding: EdgeInsets.all(5.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15.sp),
                  width: 270.sp,
                  child: Text(
                    'Liên hệ:',
                    style: TextStyle(
                      // color: colorTitle,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 5.sp),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                        labelText: "Họ và tên",
                        // floatingLabelBehavior: FloatingLabelBehavior.always,
                        alignLabelWithHint: true,
                        // border: Border.all(color: Colors.blueAccent),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                        fillColor: Colors.grey),
                    maxLines: 1,
                    validator: (String value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                ),
                SizedBox(height: 10.sp),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                        labelText: "Số điện thoại",
                        // floatingLabelBehavior: FloatingLabelBehavior.always,
                        alignLabelWithHint: true,
                        // border: Border.all(color: Colors.blueAccent),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                        fillColor: Colors.grey),
                    maxLines: 1,
                    validator: (String value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.sp),
                  width: 270.sp,
                  child: Text(
                    'Địa Chỉ:',
                    style: TextStyle(
                      // color: colorTitle,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Option(
                  handlePress: () {
                    {
                      showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return BottomSheet_Location(
                                typeLocation: 0,
                                textProvinceSelected: province,
                                handleAccept: (value) {
                                  this.setState(() {
                                    province = value;
                                    distric = '';
                                  });
                                });
                          });
                    }
                  },
                  name: 'Tỉnh/thành phố',
                  description: province == '' ? 'Xin chọn' : province,
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Option(
                  handlePress: province == ''
                      ? () {}
                      : () {
                          showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return BottomSheet_Location(
                                    typeLocation: 1,
                                    textProvinceSelected: province,
                                    textDistrictSelected: distric,
                                    handleAccept: (value) {
                                      this.setState(() {
                                        distric = value;
                                      });
                                    });
                              });
                        },
                  name: 'Quận/huyện',
                  description: distric == '' ? 'Xin chọn' : distric,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.sp),
                  width: 270.sp,
                  child: Text(
                    'Cài đặt:',
                    style: TextStyle(
                      // color: colorTitle,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  height: 50.sp,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.sp))),
                  child: SwitchListTile(
                    title: const Text('Đặt làm địa chỉ mặc định'),
                    value: isMain,
                    onChanged: (bool value) {
                      setState(() {
                        isMain = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.red,
                    textColor: Colors.white,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    child: Text("Xóa địa chỉ".toUpperCase()),
                  ),
                ),
                DefaultButton(
                  btnText: 'Hoàn Thành',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ));
  }
}

class WidgetAddress extends StatelessWidget {
  AddressModel addressModel;
  WidgetAddress({Key key, this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey.shade300,
            width: 2.sp,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Nguyễn Phan Nhật Tú',
                style: TextStyle(
                  // color: colorTitle,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Text(
                '[Mặc định]',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            child: Row(children: [
              Column(children: [
                Container(
                  width: 265.sp,
                  child: Text(
                    '(+84) 0968356159',
                    style: TextStyle(
                      // color: colorTitle,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(children: [
                  Container(
                    width: 210.sp,
                    child: Text(
                      'Chung cư opal garden đường 20',
                      style: TextStyle(
                        // color: colorTitle,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Icon(
                    PhosphorIcons.check,
                    color: Colors.red,
                  )
                ]),
                Row(children: [
                  Container(
                    width: 210.sp,
                    child: Text(
                      'Thành phố Thủ Đức - Phường Hiệp Bình Chánh',
                      style: TextStyle(
                        // color: colorTitle,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Icon(
                    PhosphorIcons.map_pin,
                    color: Colors.red,
                  )
                ]),
              ]),
            ]),
          )
        ],
      ),
    );
  }
}
