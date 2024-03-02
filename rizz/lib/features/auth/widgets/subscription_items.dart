// import 'package:flutter/material.dart';
// import 'package:rizz/common/global_variables.dart';
// import 'package:rizz/features/auth/widgets/custom_text.dart';

// class SubItem extends StatelessWidget {
//   const SubItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
//           height: GlobalVariables.deviceHeight * 0.66,
//           width: GlobalVariables.deviceWidth * 0.85,
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(20.0),
//             border: Border.all(
//               color: GlobalVariables.themeColor,
//               width: 2.0,
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 _buildTitleRow(),
//                 SizedBox(height: GlobalVariables.deviceHeight * 0.01),
//                 _buildPowerRow(
//                   'assets/images/boost_item.png',
//                   '5 weekly Boosts',
//                 ),
//                 SizedBox(height: GlobalVariables.deviceHeight * 0.02),
//                 _buildPowerRow(
//                   'assets/images/superchat_item.png',
//                   'Unlimited Super Chats',
//                 ),
//                 SizedBox(height: GlobalVariables.deviceHeight * 0.02),
//                 _buildPowerRow(
//                   'assets/images/reveal_item.png',
//                   'Unlimited reveals',
//                 ),
//                 SizedBox(height: GlobalVariables.deviceHeight * 0.02),
//                 _buildPowerRow(
//                   'assets/images/chat_item.png',
//                   "Unlimited DM's on reveals",
//                 ),
//                 SizedBox(height: GlobalVariables.deviceHeight * 0.02),
//                 _buildPowerRow(
//                   'assets/images/snapchat_item.png',
//                   'Unlimited snapchat username reveals',
//                 ),
//                 SizedBox(height: GlobalVariables.deviceHeight * 0.02),
//                 _buildPowerRow(
//                   'assets/images/swipes_item.png',
//                   'Unlimited swipes',
//                 ),
//                 SizedBox(height: GlobalVariables.deviceHeight * 0.02),
//                 _buildPowerRow(
//                   'assets/images/ads_item.png',
//                   "Premium users don't see ads",
//                 ),
//                 SizedBox(height: GlobalVariables.deviceHeight * 0.02),
//                 _buildPowerRow(
//                   'assets/images/access_item.png',
//                   'Get early access to upcoming features',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTitleRow() {
//     return CustomText(
//       text: 'Super Powers',
//       textColor: GlobalVariables.themeColor,
//       fontSize: 26,
//     );
//   }

//   Widget _buildPowerRow(String imagePath, String powerText) {
//     return Row(
//       children: [
//         Image.asset(
//           imagePath,
//           width: 30.0,
//           height: 30.0,
//         ),
//         const SizedBox(width: 15.0),
//         Container(
//           width: GlobalVariables.deviceWidth * 0.65,
//           alignment: Alignment.centerLeft,
//           child: CustomText(
//             text: powerText,
//             fontSize: 16.0,
//             fontWeight: FontWeight.w600,
//             alignment: TextAlign.start,
//           ),
//         ),
//       ],
//     );
//   }
// }
