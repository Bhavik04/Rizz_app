import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/db/services/database_service.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/new_card_widget.dart';
import 'package:rizz/features/auth/widgets/custom_appbar.dart';
import 'package:rizz/objectbox.g.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

class InboxScreen extends StatefulWidget {
  static const routeName = 'InboxScreen';

  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  var ratings;

  void getLikedProfiles() async {
    // DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    // Store store = databaseService.getStore()!;

    // setState(() {
    //   allUserData = store
    //       .box<AppUser>()
    //       .query(AppUser_.uId.notEquals(AuthService().currentUser!.uid))
    //       .build()
    //       .find();
    //   // userImageURLs = images;
    // });

    var response = await FirestoreService()
        .firestore
        .collection('rating')
        .doc(AuthService().currentUser!.uid)
        .get();
    setState(() {
      ratings = response.data();
    });
  }

  @override
  void initState() {
    super.initState();
    getLikedProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: GlobalVariables.deviceHeight * 0.02,
              left: GlobalVariables.deviceWidth * 0.05,
            ),
            child: const CustomText(
              text: 'Your ratings',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: ratings.length,
                  itemBuilder: (context, index) {
                    return NewCardWidget(
                      uId: ratings.keys.toList()[index],
                      rating: ratings[ratings.keys.toList()[index]],
                    );
                  },
                ),
                Positioned(
                  bottom: 30.0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      CustomButton(
                        onTap: () {
                          context.goNamed('SubscriptionScreen');
                        },
                        text: 'See who likes you',
                        image: Image.asset('assets/images/likesyou.png'),
                        buttonColor: HexColor('F24139'),
                        textColor: Colors.white,
                        width: GlobalVariables.deviceWidth * 0.8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
