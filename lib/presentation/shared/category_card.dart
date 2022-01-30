import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/presentation/utils/constants.dart';

class CategoryChoiceChip extends StatelessWidget {
  final Category category;
  const CategoryChoiceChip({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
BoxDecoration(
  color: const Color(0xff7c94b6),
  // image: new DecorationImage(
  //   fit: BoxFit.cover,
  //   colorFilter: 
  //     ColorFilter.mode(Colors.black.withOpacity(0.2), 
  //     BlendMode.dstATop),
  //   image: new NetworkImage(
  //     'http://www.server.com/image.jpg',
  //   ),
  ),

      child: InputChip(
        side: BorderSide(style: BorderStyle.solid ),
        //shape: OutlinedBorder(side: BorderSide(style: BorderStyle.solid  )),
        //backgroundColor: 
        labelPadding: EdgeInsets.all(16),
       // padding: EdgeInsets.all(16),
        label: Text(category.name),
        onPressed: () {
          //print('David got clicked');
        },
      ),
    );
  }
}

// class CategoryCard extends StatelessWidget {
//   final double width;
//   final double height;
//   final double borderRadius;
//   final double opacity;
//   final Gradient? gradient;
//   final TextStyle categoryTextStyle;
//   final Color handleColor;
//   final GestureTapCallback? onTap;
//   final Category category;
//   CategoryCard({
//     this.width = Sizes.WIDTH_100,
//     this.height = Sizes.HEIGHT_100,
//     this.borderRadius = Sizes.RADIUS_8,
//     this.opacity = 0.65,
//     required this.gradient,
//     this.handleColor = AppColors.whiteShade_50,
//     this.categoryTextStyle = Styles.normalTextStyle,
//     this.onTap,
//     required this.category,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         width: width,
//         height: height,
//         decoration:
//             BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
//         child: Stack(
//           children: <Widget>[
//             // Positioned(
//             //   child: ClipRRect(
//             //     borderRadius: BorderRadius.circular(borderRadius),
//             //     child: Image.asset(
//             //       imagePath,
//             //       width: width,
//             //       height: height,
//             //       fit: BoxFit.cover,
//             //     ),
//             //   ),
//             // ),
//             // Positioned(
//             //   child: Opacity(
//             //     opacity: opacity,
//             //     child: Container(
//             //      // width: width,
//             //       height: height,
//             //       decoration: BoxDecoration(
//             //         gradient: gradient,
//             //         borderRadius: BorderRadius.circular(borderRadius),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             Positioned(
//              // top: (height / 2) - 4,

//               child: Text(
//                 category.name,
//                 textAlign: TextAlign.center,
//                 style: categoryTextStyle,
//               ),
//               // right: width / 4,
//               // left: width / 4,
//               // child:Row(
//               //         children: <Widget>[
//               //           Spacer(flex: 1),
//               //           ext(
//               //             category.name,
//               //             textAlign: TextAlign.center,
//               //            T style: categoryTextStyle,
//               //           ),
//               //           Spacer(flex: 1),
//               //           Container(
//               //             width: Sizes.WIDTH_6,
//               //             height: Sizes.HEIGHT_36,
//               //             decoration: BoxDecoration(
//               //               color: handleColor,
//               //               borderRadius:
//               //                   BorderRadius.circular(Sizes.RADIUS_30),
//               //             ),
//               //           ),
//               //         ],
//               //       )
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
