import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/address.dart';
import 'package:flutter_postman_application/src/models/history.dart';
import 'package:flutter_postman_application/src/pages/payment/widget/default_button.dart';
import 'package:flutter_postman_application/src/pages/products/widget/drawer_layout.dart';
import 'package:flutter_postman_application/src/public/constant.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:sizer/sizer.dart';

class AddressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();

  List<AddressModel> listAddressModel = [
    AddressModel(
        name: "Nguyễn Phan Nhật Tú",
        phone: "0968356159",
        address: "Chung cư Opal Garden đường 20",
        province: "Thủ Đức",
        district: "Hiệp Bình Chánh",
        isMain: true),
    AddressModel(
        name: "Nguyễn Phan Nhật Phong",
        phone: "0968356159",
        address: "215-115 Nguyễn Xí",
        province: "Bình Thạnh",
        district: "Phường 26",
        isMain: true),
    AddressModel(
        name: "Nguyễn Phan Nhật Phong",
        phone: "0968356159",
        address: "215-115 Nguyễn Xí",
        province: "Bình Thạnh",
        district: "Phường 26",
        isMain: true),
    AddressModel(
        name: "Nguyễn Phan Nhật Phong",
        phone: "0968356159",
        address: "215-115 Nguyễn Xí",
        province: "Bình Thạnh",
        district: "Phường 26",
        isMain: true),
    AddressModel(
        name: "Nguyễn Phan Nhật Phong",
        phone: "0968356159",
        address: "215-115 Nguyễn Xí",
        province: "Bình Thạnh",
        district: "Phường 26",
        isMain: true),
    AddressModel(
        name: "Nguyễn Phan Nhật Phong",
        phone: "0968356159",
        address: "215-115 Nguyễn Xí",
        province: "Bình Thạnh",
        district: "Phường 26",
        isMain: true),
    AddressModel(
        name: "Nguyễn Phan Nhật Phong",
        phone: "0968356159",
        address: "215-115 Nguyễn Xí",
        province: "Bình Thạnh",
        district: "Phường 26",
        isMain: true),
    AddressModel(
        name: "Nguyễn Phan Nhật Phong",
        phone: "0968356159",
        address: "215-115 Nguyễn Xí",
        province: "Bình Thạnh",
        district: "Phường 26",
        isMain: true),
    AddressModel(
        name: "Nguyễn Phan Nhật Phong",
        phone: "0968356159",
        address: "215-115 Nguyễn Xí",
        province: "Bình Thạnh",
        district: "Phường 26",
        isMain: true),
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
            "Chọn địa chỉ nhận hàng",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(
                PhosphorIcons.pen,
                size: 7.w,
              ),
            ),
          ],
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
                  height: 145.w,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: listAddressModel.length,
                    itemBuilder: (context, index) {
                      return WidgetAddress(
                        addressModel: listAddressModel[index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Material(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.grey,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 20.sp, left: 15.sp, bottom: 20.sp),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Text(
                            'Thêm Địa chỉ mới',
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            width: 155.sp,
                          ),
                          Icon(
                            PhosphorIcons.plus,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
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
                '${addressModel.name}',
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
                    '(+84) ${addressModel.phone}',
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
                      '${addressModel.address}',
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
                      '${addressModel.province} - ${addressModel.district}',
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