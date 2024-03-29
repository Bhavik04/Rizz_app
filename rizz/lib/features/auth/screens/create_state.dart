// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:rizz/common/global_variables.dart';
// import 'package:rizz/features/auth/screens/create_gender.dart';
// import 'package:rizz/features/auth/screens/create_photo.dart';
// import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
// import 'package:rizz/features/auth/widgets/custom_button.dart';
// import 'package:rizz/features/auth/widgets/custom_text.dart';
// import 'package:rizz/features/auth/widgets/custom_text2.dart';
// import 'package:rizz/features/auth/widgets/custom_textfield.dart';

// class StateScreen extends StatefulWidget {
//   static const routeName = 'StateScreen';

//   const StateScreen({super.key});

//   @override
//   State<StateScreen> createState() => _StateScreenState();
// }

// class _StateScreenState extends State<StateScreen> {
//   final _stateController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: GlobalVariables.themeColor,
//         appBar: ArrowBar(
//           title: '',
//           backgroundColor: GlobalVariables.themeColor,
//           onBack: () {
//             context.goNamed(GenderScreen.routeName);
//           },
//           showReportButton: false,
//         ),
//         body: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(
//               horizontal: GlobalVariables.deviceWidth * 0.1),
//           child: Column(
//             children: [
//               Container(
//                 margin:
//                     EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
//                 width: GlobalVariables.deviceWidth * 0.60,
//                 child: const CustomText(text: "Which state are you from?"),
//               ),
//               Container(
//                   margin:
//                       EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
//                   width: GlobalVariables.deviceWidth * 0.75,
//                   height: 60,
//                   child: CustomTextField(
//                       controller: _stateController, saveKey: 'state')),
//               Container(
//                 margin:
//                     EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
//                 width: GlobalVariables.deviceWidth * 0.55,
//                 child: const CustomSmallText(
//                     text: 'This info cannot be changed later'),
//               ),
//               Container(
//                 margin:
//                     EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.04),
//                 child: CustomButton(
//                   text: 'Next',
//                   onTap: () {
//                     debugPrint('print button');
//                     context.goNamed(PhotoScreen.routeName);
//                   },
//                   buttonColor: Colors.white,
//                   textColor: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
