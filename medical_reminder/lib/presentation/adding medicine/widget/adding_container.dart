// import 'package:flutter/material.dart';
// import 'package:medical_reminder/core/theme/app_colors.dart';

// class AddingContainer extends StatefulWidget {
//   final String image;
//   final String text;
//   const AddingContainer({super.key, required this.image, required this.text});

//   @override
//   State<AddingContainer> createState() => _AddingContainerState();
// }

// class _AddingContainerState extends State<AddingContainer> {
//   bool tapped = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               tapped = !tapped;
//             });
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(color: tapped ? AppColors.icon1: AppColors.bgBtnColor1),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadiusGeometry.circular(15),
//               child: Image.asset(
//                 widget.image,
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Text(widget.text),
//       ],
//     );
//   }
// }
