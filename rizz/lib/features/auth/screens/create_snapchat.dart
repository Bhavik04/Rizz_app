import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/create_referral.dart';
import 'package:rizz/features/auth/screens/create_username.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/features/auth/widgets/custom_text2.dart';
import 'package:rizz/features/auth/widgets/custom_textfield.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

class SnapchatScreen extends StatefulWidget {
  static const routeName = 'SnapchatScreen';

  const SnapchatScreen({Key? key}) : super(key: key);

  @override
  State<SnapchatScreen> createState() => _SnapchatScreenState();
}

class _SnapchatScreenState extends State<SnapchatScreen> {
  final _snapchatController = TextEditingController();
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  bool _isSnapchatValid = false; // New variable to track validity

  @override
  void initState() {
    super.initState();

    // Add listener to update _isSnapchatValid when the text changes
    _snapchatController.addListener(() {
      setState(() {
        _isSnapchatValid = _snapchatController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _snapchatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('FF5C67'),
        appBar: ArrowBar(
          title: '',
          backgroundColor: HexColor('F33C5E'),
          onBack: () {
            context.goNamed(UserNameScreen.routeName);
          },
          showReportButton: false,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: const [0.3, 0.5, 0.9],
              colors: [
                HexColor('F33C5E'),
                HexColor('F85D3E'),
                HexColor('FF8A41'),
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: GlobalVariables.deviceWidth * 0.1),
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                  width: GlobalVariables.deviceWidth * 0.72,
                  child:
                      const CustomText(text: "What's your Snapchat username?"),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.03),
                    width: GlobalVariables.deviceWidth * 0.75,
                    height: 60,
                    child: CustomTextField(
                        controller: _snapchatController, saveKey: 'snapchat')),
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                  width: GlobalVariables.deviceWidth * 0.55,
                  child: const CustomSmallText(
                      text: 'This info cannot be changed later'),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                  child: CustomButton(
                    text: 'Next',
                    onTap: () async {
                      if (_isSnapchatValid) {
                        await _firestoreService.createUserData(
                          _authService.currentUser?.uid ?? '',
                          null,
                          _snapchatController.text.isNotEmpty
                              ? _snapchatController.text
                              : null,
                          0,
                        );

                        debugPrint('print button');
                        context.goNamed(ReferralScreen.routeName);
                      }
                    },
                    buttonColor:
                        _isSnapchatValid ? Colors.white : Colors.white70,
                    textColor: _isSnapchatValid ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
