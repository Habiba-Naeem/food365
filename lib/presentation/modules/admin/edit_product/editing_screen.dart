import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/shared/loading.dart';

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
  double time = 0;
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
            initialValue:widget.item.description,
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
          TextFormField(
            initialValue: widget.item.time.toString(),
            cursorColor: Colors.orange[200],
            keyboardType: TextInputType.number,
            onChanged: (val) =>
                setState(() => time = double.tryParse(val) ?? 0),
            decoration: InputDecoration(
              labelText: "Cooking Time",
              fillColor: const Color.fromARGB(255, 127, 228, 218),
              filled: true,
              //prefixText: "In minutes",
              prefixIcon:
                  Icon(Icons.timer, color: Colors.orange[200], size: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() => loading = true);
              //widget.item.name = name;
              MenuService().updateMenuItem(item: widget.item);
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
