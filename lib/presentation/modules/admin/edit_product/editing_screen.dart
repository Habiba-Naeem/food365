import 'dart:io';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/services/menu_service.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/custom_style.dart';

class EditItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<MenuItemModel>(context);
    return SafeArea(
      child: Scaffold(

        appBar:
          AppBar(
            title: Text(
              "Edit Product",
              style: CustomStyle.appbarTitleStyle,
            ),
            backgroundColor: CustomColor.primaryColor,
            leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowAltCircleLeft,
                  color: CustomColor.whiteColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
            //headingText: "Home",
            //height: 0,

          ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(child: EditProductForm(item: item)),
        ),
      ),
    );
  }
}

class EditProductForm extends StatefulWidget {
  MenuItemModel item;
  EditProductForm({
    Key key,
     this.item,
  }) : super(key: key);

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  File _image;
  String imagePath = '';
  String category = '';
  String name = '';
  String description = '';
  double price = 0;
  Duration time = Duration(minutes: 0);
  bool loading = false;

  void initState() {
    super.initState();
    setState(() {
      name = widget.item.name;
      category = widget.item.categoryID;
      description = widget.item.description;
      price = widget.item.price;
      time = widget.item.time;
    });
  }

  Future getImageCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                        getImageGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      getImageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 55,
                //backgroundColor: const Color(0xffFDCF09),
                child: _image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    _image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fitHeight,
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  width: 150,
                  height: 150,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name",style: CustomStyle.headingStyle,),
          ),
          TextFormField(
            initialValue: name,
            cursorColor: const Color.fromARGB(255, 255, 128, 128),
            onChanged: (val) => setState(() => name = val),
            decoration: InputDecoration(
              //labelText: "Name",
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Description",style: CustomStyle.headingStyle,),
          ),
          TextFormField(
            initialValue: description,
            cursorColor: Colors.orange[200],
            onChanged: (val) => setState(() => description = val),
            decoration: InputDecoration(
              //labelText: "Description",
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter description';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Category",style: CustomStyle.headingStyle,),
          ),
          TextFormField(
            initialValue: category,
            cursorColor: Colors.orange[200],
            onChanged: (val) => setState(() => category = val),
            decoration: InputDecoration(
              //labelText: "Category",
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter category';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Price",style: CustomStyle.headingStyle,),
          ),
          TextFormField(
            initialValue: price.toString(),
            cursorColor: Colors.orange[200],
            keyboardType: TextInputType.number,
            onChanged: (val) =>
                setState(() => price = double.tryParse(val) ?? 0),
            decoration: InputDecoration(
              //labelText: "Price",
              filled: true,
              prefixIcon: Icon(Icons.currency_rupee,
                  color: Colors.orange[200], size: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter price';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Timer",style: CustomStyle.headingStyle,),
          ),
          TextButton(
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              size: 18.0,
                              color:CustomColor.primaryColor,
                            ),
                            Text(
                              "${printDuration(time)}",

                              style: CustomStyle.headingStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Change",
                    style: CustomStyle.headingStyle,
                  ),
                ],
              ),
            ),
            onPressed: () {
              Picker(
                adapter: NumberPickerAdapter(
                  data: <NumberPickerColumn>[
                    const NumberPickerColumn(
                      begin: 0,
                      end: 999,
                      suffix: Text(' hrs'),
                    ),
                    const NumberPickerColumn(
                      begin: 0,
                      end: 60,
                      suffix: Text('min'),
                    ),
                  ],
                ),
                delimiter: <PickerDelimiter>[
                  PickerDelimiter(
                    child: Container(
                      width: 30.0,
                      alignment: Alignment.center,
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                ],
                hideHeader: true,
                confirmText: 'OK',
                confirmTextStyle:
                    TextStyle(inherit: false, color: Colors.red, fontSize: 22),
                title: const Text('Select duration'),
                selectedTextStyle: TextStyle(color: Colors.blue),
                onConfirm: (Picker picker, List<int> value) {
                  // You get your duration here
                  setState(() {
                    time = Duration(
                        hours: picker.getSelectedValues()[0],
                        minutes: picker.getSelectedValues()[1]);
                  });
                },
              ).showDialog(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () async {
      if (!_formKey.currentState.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.

      }
      else if(_image==null){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please upload image')),);
      }
      else if(time==Duration(seconds: 0)){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter time')),);

      }
      else {
        setState(() => loading = true);
        widget.item.name = name;
        widget.item.description = description;
        widget.item.price = price;
        widget.item.time = time;
        widget.item.categoryID=category;
        //widget.item.name = name;
        MenuService().updateMenuItem(
          item: widget.item,
          image: _image,
        );

        Navigator.pop(context);

      }
            },
            child: Container(
              alignment: Alignment.center,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: CustomColor.primaryColor
              ),
              padding: const EdgeInsets.all(12.0),
              child: loading
                  ? Loading()
                  : Text(
                      'Edit',
                      style: CustomStyle.appbarTitleStyle,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
