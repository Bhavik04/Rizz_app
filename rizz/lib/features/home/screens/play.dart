import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/main_appbar.dart';
import 'package:rizz/features/auth/widgets/block_sheet.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = 'PlayScreen';

  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  String? referralCode;
  List<String> userImageURLs = [];

  @override
  void initState() {
    super.initState();
    _loadReferralCode();
    _loadUserImages();
  }

  Future<void> _loadReferralCode() async {
    final userData = await FirestoreService().getUserData(
      AuthService().currentUser?.uid ?? '',
    );

    setState(() {
      referralCode = userData?['referralCode'];
    });
  }

  Future<void> _loadUserImages() async {
    final List<String> images = await FirestoreService()
        .getAllUserImages(AuthService().currentUser?.uid ?? '');

    setState(() {
      userImageURLs = images;
    });
  }

  double _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("0F0F0F"),
        appBar: MainAppBar(),
        body: Column(
          children: [
            Container(
              height: GlobalVariables.deviceHeight * 0.78,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: userImageURLs.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<Map<String, dynamic>?>(
                    future: FirestoreService()
                        .getUserDataForImage(userImageURLs[index]),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final username = snapshot.data?['username'] ?? '';
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 1.0,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(userImageURLs[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Positioned(
                                    bottom: 80.0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                GlobalVariables.deviceWidth *
                                                    0.04,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: const TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Sobu',
                                                      style: TextStyle(
                                                        fontSize: 22.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '\n99, Nagaliya',
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                      GlobalVariables.deviceWidth * 0.05,
                                      GlobalVariables.deviceHeight * 0.02,
                                      GlobalVariables.deviceWidth * 0.05,
                                      GlobalVariables.deviceHeight * 0.02,
                                    ),
                                    height: GlobalVariables.deviceHeight * 0.12,
                                    decoration: BoxDecoration(
                                      color: Colors.white24,
                                      border: Border.all(
                                          color: Colors.white24, width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: HexColor('FF6B03'),
                                        inactiveTrackColor: Colors.white,
                                        thumbColor: Colors.redAccent,
                                        trackHeight: 7,
                                        valueIndicatorColor: Colors.black,
                                        valueIndicatorTextStyle:
                                            const TextStyle(fontSize: 16),
                                      ),
                                      child: Slider(
                                        value: _currentValue,
                                        min: 0,
                                        max: 10,
                                        onChanged: (value) {
                                          setState(() {
                                            _currentValue = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10.0,
                              right: 10.0,
                              child: GestureDetector(
                                onTap: () {
                                  showSkipSheet(context);
                                },
                                child: Image.asset(
                                  'assets/images/report.png',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('No user data available');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
