import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
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
  void handleNavigation(int index) {
    widget.child.goBranch(
      index,
      initialLocation: index == widget.child.currentIndex,
    );
    setState(() {});
  }

  BottomNavigationBarItem buildNavItem(int index, String title) {
    return BottomNavigationBarItem(
      icon: InkWell(
        onTap: () => handleNavigation(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        enableFeedback: false,
        child: Text(
          title,
          style: TextStyle(
            color: widget.child.currentIndex == index
                ? GlobalVariables.themeColor
                : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HexColor('0F0F0F'),
        items: <BottomNavigationBarItem>[
          buildNavItem(0, 'Play'),
          buildNavItem(1, 'Inbox'),
          buildNavItem(2, 'Chat'),
        ],
      ),
    );
  }
}
