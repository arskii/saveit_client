import 'package:budgetapp/components/title_screen.dart';
import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            'profile',
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [SvgPicture.asset('assets/icons/editIcon.svg')]),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [
                  mainColor,
                  secondColor,
                ]),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/cigun.jpg')),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cigun Makasyan',
                                  style: TextStyle(fontSize: 35),
                                ),
                                Text(
                                  'Username',
                                  style: TextStyle(
                                      fontFamily: 'Jost', fontSize: 18),
                                ),
                                Text(
                                  '@Cigun4ik',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                      fontFamily: 'Jost', fontSize: 18),
                                ),
                                Text(
                                  'kotleta.aaaa@assasin.com',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date of birth',
                                  style: TextStyle(
                                      fontFamily: 'Jost', fontSize: 18),
                                ),
                                Text(
                                  '12.19.2001',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 3, child: SizedBox())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
