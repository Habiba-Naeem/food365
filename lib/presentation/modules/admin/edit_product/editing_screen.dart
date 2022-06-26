import 'dart:io';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/services/menu_service.dart';

class EditItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<MenuItemModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          backgroundColor: Colors.teal,
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
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  File? _image;
  String imagePath = '';
  String category = '';
  String name = '';
  String description = '';
  double price = 0;
  Duration time = Duration(minutes: 0);
  bool loading = false;

  // void initState() {
  //   //super.initState();
  //   // setState(() {
  //   //   name = widget.item.name;
  //   //   category = widget.item.categoryID;
  //   //   description = widget.item.description;
  //   //   price = widget.item.price;
  //   //   time = widget.item.time;
  //   // });
  // }

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
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
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
                      backgroundColor: const Color(0xffFDCF09),
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                _image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(50)),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            initialValue: widget.item.name,
            cursorColor: const Color.fromARGB(255, 255, 128, 128),
            onChanged: (val) => setState(() => name = val),
            decoration: InputDecoration(
              labelText: "Name",
              fillColor: const Color.fromARGB(255, 127, 228, 218),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            initialValue: widget.item.description,
            cursorColor: Colors.orange[200],
            onChanged: (val) => setState(() => description = val),
            decoration: InputDecoration(
              labelText: "Description",
              fillColor: const Color.fromARGB(255, 127, 228, 218),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            initialValue: widget.item.categoryID,
            cursorColor: Colors.orange[200],
            onChanged: (val) => setState(() => category = val),
            decoration: InputDecoration(
              labelText: "Category",
              fillColor: const Color.fromARGB(255, 127, 228, 218),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            initialValue: widget.item.price.toString(),
            cursorColor: Colors.orange[200],
            keyboardType: TextInputType.number,
            onChanged: (val) =>
                setState(() => price = double.tryParse(val) ?? 0),
            decoration: InputDecoration(
              labelText: "Price",
              fillColor: const Color.fromARGB(255, 127, 228, 218),
              filled: true,
              prefixIcon: Icon(Icons.currency_rupee,
                  color: Colors.orange[200], size: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(
            height: 16,
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
                              color: Colors.teal,
                            ),
                            Text(
                              "${printDuration(time)}",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    "  Change",
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
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
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() => loading = true);
              widget.item.name = name;
              widget.item.description = description;
              widget.item.price = price;
              widget.item.time = time;
              //widget.item.name = name;
              MenuService().updateMenuItem(
                item: widget.item,
                image: _image!,
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromARGB(255, 40, 109, 97),
                    Color.fromARGB(255, 64, 255, 245)
                  ],
                ),
              ),
              padding: const EdgeInsets.all(12.0),
              child: loading
                  ? Loading()
                  : Text(
                      'Edit',
                      style: TextStyle(fontSize: 14),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
