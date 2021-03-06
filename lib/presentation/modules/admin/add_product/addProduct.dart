import 'dart:io';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
          backgroundColor: Colors.teal,
        ),
        body: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: const SingleChildScrollView(child: const AddProductForm()),
        ),
      ),
    );
  }
}

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final ImagePicker picker = ImagePicker();
  String imagePath = '';
  String category = '';
  String name = '';
  String description = '';
  double price = 0;
  Duration time = Duration(minutes: 0);
  bool loading = false;

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
          )
          // TextFormField(
          //   cursorColor: Colors.orange[200],
          //   keyboardType: TextInputType.number,
          //   onChanged: (val) =>
          //       setState(() => time = double.tryParse(val) ?? 0),
          //   decoration: InputDecoration(
          //     labelText: "Cooking Time",
          //     fillColor: const Color.fromARGB(255, 127, 228, 218),
          //     filled: true,
          //     //prefixText: "In minutes",
          //     prefixIcon:
          //         Icon(Icons.timer, color: Colors.orange[200], size: 20),
          //     border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(30.0),
          //         borderSide: BorderSide.none),
          //   ),
          // )
          ,
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() => loading = true);
              MenuService().postMenuItem(
                  categoryID: category,
                  description: description,
                  imagePath: imagePath,
                  name: name,
                  price: price,
                  time: time);
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
                      'Add',
                      style: TextStyle(fontSize: 14),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

// class AddProduct extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Center(
//           child: const Text('Add Product'),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Container(
//             height: 250,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.teal.shade100,
//                   Colors.teal.shade50
//                 ],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 stops: [
//                   0.5,
//                   0.9
//                 ],
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       minRadius: 75.0,
//                       child: CircleAvatar(
//                         radius: 0.0,
//                         backgroundImage: NetworkImage(''),
//                       ),
//                     ),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(5.0), //or 15.0
//                       child: Container(
//                         height: 30.0,
//                         width: 30.0,
//                         color: Colors.cyan[800],
//                         child: Icon(Icons.edit, color: Colors.white, size: 25.0),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Product Name',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   'Category',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     color: Colors.teal,
//                     child: ListTile(
//                       title: Text(
//                         '0PKR',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                       subtitle: Text(
//                         'Price',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white70,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: <Widget>[
//                 ListTile(
//                   title: Text(
//                     'Description',
//                     style: TextStyle(
//                       color: Colors.teal,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Lorem Ipsum hdhshdjahdau haeguaheiuarh bdhdsahs',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: Text(
//                     'Category',
//                     style: TextStyle(
//                       color: Colors.teal,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Foods',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(25),
//                   child: FlatButton(
//                     child: Text(
//                       'Add Product',
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     color: Colors.blueAccent,
//                     textColor: Colors.white,
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
