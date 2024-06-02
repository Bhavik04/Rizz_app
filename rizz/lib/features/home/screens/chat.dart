import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/features/auth/widgets/custom_appbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/home/screens/chat_page.dart';
import 'package:rizz/features/home/screens/play.dart';
import 'package:rizz/services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = 'ChatScreen';
  final String id;
  const ChatScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<AppUser> chatRooms=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatService chatService = GetIt.instance.get<ChatService>();
    chatRooms=chatService.getChatRooms();
    setState(() {
      
    });
  }
  // void showCustomBottomSheet(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body:chatRooms.isEmpty? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: GlobalVariables.deviceHeight * 0.02,
                left: GlobalVariables.deviceWidth * 0.05),
            child: const CustomText(
              text: 'Messages',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.2),
            child: const CustomText(
              text: 'Oops! looks like you got no messages yet',
              alignment: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.05),
            alignment: Alignment.center,
            child: CustomButton(
              onTap: () {
                context.goNamed(PlayScreen.routeName);
              },
              text: 'Start rating',
              buttonColor: GlobalVariables.themeColor,
              textColor: Colors.white,
            ),
          )
        ],
      ):
      Text("data"),
      // ListView.builder(
      //   shrinkWrap: true,
      //                   itemCount: chatRooms.length,
      //                   itemBuilder: (context, index) {
      //                     return ChatTile(chatRooms[index]);
      //                   },
      //                 ),
    );
  }

   Widget ChatTile(AppUser user){
    return GestureDetector(
      child: Text(user.name),
    onTap: (){context.goNamed(ChatPage.routeName);},
    );
  }
}
