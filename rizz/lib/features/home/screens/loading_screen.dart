import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/db/loaders/user_loader.dart';
import 'package:rizz/features/home/screens/play.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  static const routeName = 'LoadingScreen';


  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> loadData() async {
await   UserLoaderService().load();
context.goNamed(PlayScreen.routeName);
  }
  // bool isLoading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("loading..."),
    );
  }
}