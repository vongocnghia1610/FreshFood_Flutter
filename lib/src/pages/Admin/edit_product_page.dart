import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/models/product.dart';
import 'package:freshfood/src/pages/home/controllers/product_controller.dart';
import 'package:freshfood/src/pages/products/controllers/group_product_controller.dart';
import 'package:freshfood/src/pages/products/widget/drawer_layout.dart';
import 'package:freshfood/src/public/constant.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/repository/product_repository.dart';
import 'package:freshfood/src/services/upload_storage.dart';
import 'package:freshfood/src/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class EditProductPage extends StatefulWidget {
  ProductModel productCurrent;
  EditProductPage({this.productCurrent});
  @override
  State<StatefulWidget> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final productController = Get.put(ProductController());
  ScrollController scrollController = ScrollController();
  TextEditingController _nameProductController = new TextEditingController();
  TextEditingController _detailProductController = new TextEditingController();
  TextEditingController _priceProductController = new TextEditingController();
  TextEditingController _weightProductController = new TextEditingController();
  TextEditingController _quantityProductController =
      new TextEditingController();

  var priceTest = MoneyMaskedTextController(
      decimalSeparator: '',
      thousandSeparator: '.',
      leftSymbol: '??',
      precision: 0); //after

  List<File> _image = [];
  ImagePicker _imagePicker = ImagePicker();
  List<dynamic> test = [];
  StreamController<List<dynamic>> _listImage =
      StreamController<List<dynamic>>.broadcast();
  //
  double weight;
  double price;
  int quantity;
  String name;
  String detail;
  String id;
  //
  String grProduct;
  final _groupProduct = Get.put(GroupProductController());
  @override
  initState() {
    super.initState();

    _groupProduct.initialController();
    _groupProduct.getGroupProduct();
    _nameProductController.text = widget.productCurrent.name;
    _detailProductController.text = widget.productCurrent.detail;
    _priceProductController.text = widget.productCurrent.price.toString();
    _weightProductController.text = widget.productCurrent.weight.toString();
    _quantityProductController.text = widget.productCurrent.quantity.toString();
    priceTest.text = (widget.productCurrent.price).toStringAsFixed(0);
    id = widget.productCurrent.id;
    grProduct = widget.productCurrent.groupProduct.key;
  }

  void showImageBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return _chooseImage(context);
      },
    );
  }

  Future<void> updateProduct() async {
    List<String> listImage = [];
    for (var element in _image) {
      String url =
          await StorageService().uploadImageToStorage(element, folderProduct);
      listImage.add(url);
    }

    if (listImage.length == 0) listImage = widget.productCurrent.image;

    ProductRepository()
        .updateProduct(
            images: listImage,
            weight: double.parse(_weightProductController.text),
            price: priceTest.numberValue,
            quantity: int.parse(_quantityProductController.text),
            name: _nameProductController.text,
            detail: _detailProductController.text,
            groupProduct: grProduct,
            id: id)
        .then((value) {
      if (value == null) {
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'C???p nh???t th???t b???i',
          subTitle: 'Vui l??ng ki???m tra ????? c??c tr?????ng',
        );
        getSnackBar.show();
      } else {
        Get.back();
        productController.initialController();
        productController.getAllProduct(search: '', groupProduct: '');
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'C???p nh???t th??nh c??ng',
          subTitle: '',
        );
        getSnackBar.show();
      }
    });
  }

  Widget _chooseImage(context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: mC,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            30.0,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12.0),
            Container(
              height: 4.0,
              margin: EdgeInsets.symmetric(horizontal: _size.width * .35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: mCD,
                boxShadow: [
                  BoxShadow(
                    color: mCD,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 2.0,
                  ),
                  BoxShadow(
                    color: mCL,
                    offset: Offset(-1.0, -1.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            _buildAction(
              context,
              'Ch???p ???nh',
              PhosphorIcons.instagram_logo_bold,
            ),
            Divider(
              color: Colors.grey,
              thickness: .25,
              height: .25,
              indent: 8.0,
              endIndent: 8.0,
            ),
            _buildAction(
              context,
              'Ch???n ???nh t??? Album',
              PhosphorIcons.image_square_bold,
            ),
            SizedBox(height: 18.0),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(context, title, icon) {
    final _size = MediaQuery.of(context).size;
    Future<void> _pickImage(ImageSource source) async {
      List<XFile> listSelectedSource = await _imagePicker.pickMultiImage(
        imageQuality: 80,
        maxHeight: 600,
        maxWidth: 800,
      );
      if (listSelectedSource.isNotEmpty) {
        setState(() {
          _image = listSelectedSource.map((item) => File(item.path)).toList();
          _listImage.add(_image);
        });
        Get.back();
      }
    }

    return GestureDetector(
      onTap: () {
        switch (title) {
          // English
          case 'Take a Photo':
            _pickImage(ImageSource.camera);
            break;
          case 'Choose from Album':
            _pickImage(ImageSource.gallery);
            break;

          // Vietnamese
          case 'Ch???p ???nh':
            _pickImage(ImageSource.camera);
            break;
          case 'Ch???n ???nh t??? Album':
            _pickImage(ImageSource.gallery);
            break;

          default:
            break;
        }
      },
      child: Container(
        width: _size.width,
        color: mC,
        padding: EdgeInsets.fromLTRB(24.0, 15.0, 20.0, 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: _size.width / 16.0,
                  color: Colors.grey.shade800,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: _size.width / 22.5,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
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
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              PhosphorIcons.arrow_left,
              color: Colors.white,
              size: 7.w,
            ),
          ),
          title: Text(
            "Ch???nh s???a s???n ph???m",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            height: 100.h,
            width: 100.w,
            child: ListView(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui l??ng ??i???n t??n s???n ph???m!',
                        "name",
                        '??i???n t??n c???a s???n ph???m',
                        'T??n s???n ph???m',
                        PhosphorIcons.package,
                        _nameProductController,
                        false,
                        false),
                    SizedBox(
                      height: 30.0,
                    ),
                    StreamBuilder(
                        stream: _groupProduct.listGroupProduct,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Material(
                                elevation: 20.0,
                                shadowColor: kPrimaryColor.withOpacity(0.38),
                                child: DropdownSearch(
                                  mode: Mode.MENU,
                                  label: "Lo???i s???n ph???m",
                                  onChanged: print,
                                )
                                // selectedItem: "Brazil"),
                                );
                          }

                          List<String> listOption =
                              (snapshot.data as List<dynamic>)
                                  .map((e) => e['name'].toString())
                                  .toList();

                          return Container(
                            width: 100.w,
                            child: Material(
                                elevation: 20.0,
                                shadowColor: kPrimaryColor.withOpacity(0.38),
                                child: DropdownSearch(
                                  items: listOption,
                                  onChanged: (val) {
                                    List<dynamic> data = snapshot.data;
                                    int index = data.indexWhere(
                                        (element) => element['name'] == val);
                                    if (index != -1) {
                                      grProduct = data[index]['key'];
                                    }
                                  },
                                  label: "Lo???i s???n ph???m",
                                  selectedItem:
                                      widget.productCurrent.groupProduct.name,
                                )
                                // selectedItem: "Brazil"),
                                ),
                          );
                        }),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui l??ng ??i???n chi ti???t s???n ph???m!',
                        "detail",
                        '??i???n chi ti???t s???n ph???m',
                        'Chi ti???t s???n ph???m',
                        PhosphorIcons.clipboard_text,
                        _detailProductController,
                        false,
                        false),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui l??ng ??i???n gi?? s???n ph???m!',
                        "price",
                        '??i???n gi?? s???n ph???m',
                        'Gi?? s???n ph???m',
                        PhosphorIcons.money,
                        priceTest,
                        true,
                        true),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui l??ng ??i???n kh???i l?????ng s???n ph???m (kg)!',
                        "weight",
                        '??i???n kh???i l?????ng s???n ph???m (kg)',
                        'Kh???i l?????ng s???n ph???m (kg)',
                        PhosphorIcons.scales,
                        _weightProductController,
                        true,
                        false),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui l??ng ??i???n s??? l?????ng s???n ph???m!',
                        "quantity",
                        '??i???n s??? l?????ng s???n ph???m',
                        'S??? l?????ng s???n ph???m',
                        PhosphorIcons.stack,
                        _quantityProductController,
                        true,
                        false),
                    SizedBox(
                      height: 30.0,
                    ),
                    FlatButton(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: showImageBottomSheet,
                        child: Text(
                          'Th??m ???nh',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    Material(
                      elevation: 20.0,
                      shadowColor: kPrimaryColor.withOpacity(0.38),
                      child: Container(
                        height: 150.sp,
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: StreamBuilder(
                          stream: _listImage.stream,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return Container(
                                width: 150.w,
                                height: 150.sp,
                                child: ListView.builder(
                                  controller: scrollController,
                                  // gridDelegate:
                                  //     SliverGridDelegateWithFixedCrossAxisCount(
                                  //   crossAxisCount: 2,
                                  //   crossAxisSpacing: 4.0,
                                  //   mainAxisExtent: 4.0,
                                  // ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.productCurrent.image.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Container(
                                          margin: EdgeInsets.only(
                                            left: kDefaultPadding,
                                            top: kDefaultPadding / 2,
                                            bottom: kDefaultPadding / 2,
                                          ),
                                          width: 150.sp,
                                          height: 150.sp,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  widget.productCurrent
                                                      .image[index],
                                                ),
                                              ))),
                                    );
                                  },
                                ),
                              );
                            }

                            return Container(
                              width: 150.w,
                              height: 150.sp,
                              child: ListView.builder(
                                controller: scrollController,
                                // gridDelegate:
                                //     SliverGridDelegateWithFixedCrossAxisCount(
                                //   crossAxisCount: 2,
                                //   crossAxisSpacing: 4.0,
                                //   mainAxisExtent: 4.0,
                                // ),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                          left: kDefaultPadding,
                                          top: kDefaultPadding / 2,
                                          bottom: kDefaultPadding / 2,
                                        ),
                                        width: 150.sp,
                                        height: 150.sp,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  snapshot.data[index],
                                                )))),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    FlatButton(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            updateProduct();
                          }
                        },
                        child: Text(
                          'L??u ch???nh s???a',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  Material BuildTextField(
      String vali,
      dynamic type,
      String placeholder,
      String lable_text,
      IconData iconData,
      name_controller,
      bool number,
      bool money) {
    return Material(
      elevation: 20.0,
      shadowColor: kPrimaryColor.withOpacity(0.38),
      child: TextFormField(
        controller: name_controller == false ? null : name_controller,
        validator: (val) => val.trim().length == 0 ? vali : null,
        onChanged: (val) {
          setState(() {
            if (type == "name")
              name = val.trim();
            else if (type == "detail")
              detail = val.trim();
            else if (type == "price") {
              // // name_controller.updateValue(val);
              // if(name_controller.toString())
              if (name_controller.text.toString() == "??") {
                name_controller.value = "??0";
              }
              if (name_controller.numberValue != null)
                price = name_controller.numberValue;
              // price = double.tryParse(val.trim());
            } else if (type == "weight")
              weight = double.tryParse(val.trim());
            else if (type == "quantity") quantity = int.tryParse(val.trim());
          });
        },
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        keyboardType: number ? TextInputType.number : null,
        inputFormatters: (number == true && money != true)
            ? [FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))]
            : (number == true && money == true)
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
        decoration: InputDecoration(
          fillColor: Colors.black,
          hintText: placeholder,
          hintStyle: TextStyle(
            color: Colors.grey,
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
      ),
    );
  }
}
