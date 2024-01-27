import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/utils.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HexColor('141414'),
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Text(
              'Play',
              style: TextStyle(
                color: widget.child.currentIndex == 0
                    ? HexColor('FD630F')
                    : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Text(
              'Inbox',
              style: TextStyle(
                color: widget.child.currentIndex == 1
                    ? HexColor('FD630F')
                    : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            label: '',
          ),
          //  BottomNavigationBarItem(
          //  icon: Text(
          //  'Chat',
          //style: TextStyle(
          //color: widget.child.currentIndex == 2
          //  ? HexColor('FD630F')
          //: Colors.white,
          //fontWeight: FontWeight.bold,
          //fontSize: 20.0,
          //),
          // ),
          //label: '',
          //),
        ],
      ),
    );
  }
}
