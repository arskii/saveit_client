import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: const Text(
          'Reward',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        child: Center(
            child: Text(
          'Reward',
          style: TextStyle(fontSize: 30, fontFamily: 'Jost'),
        )),
      ),
    );
  }
}
