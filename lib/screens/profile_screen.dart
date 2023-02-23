import 'package:budgetapp/screens/edit_profile_screen.dart';
import 'package:budgetapp/screens/reward_screen.dart';
import 'package:budgetapp/screens/settings_screen.dart';
import 'package:budgetapp/screens/statics_screen.dart';
import 'package:flutter/material.dart';

import 'package:budgetapp/constants.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'profile',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () => Get.to(EditProfile()),
              child: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
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
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 170,
                          width: 110,
                          decoration: const BoxDecoration(
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
                            Text(
                              'Cigun Makasyan',
                              style: TextStyle(fontSize: 35),
                            ),
                            ProfileData(
                              typeField: 'Username',
                              info: '@Cigun4ik',
                            ),
                            ProfileData(
                              typeField: 'Email',
                              info: 'kotleta.aaaa@assasin.com',
                            ),
                            // ProfileData(
                            //   type_field: 'Date of birth',
                            //   info: '12.19.2001',
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MenuProfile(
                          data: 'dashboard',
                          icon: Icons.apps,
                          onTap: () {},
                        ),
                        MenuProfile(
                          data: 'Statics',
                          icon: Icons.leaderboard,
                          onTap: () => Get.to(StaticsScreen()),
                        ),
                        MenuProfile(
                          data: 'Reward',
                          icon: Icons.stars,
                          onTap: () => Get.to(RewardScreen()),
                        ),
                        MenuProfile(
                          data: 'Settings',
                          icon: Icons.settings,
                          onTap: () => Get.to(SettingsScreen()),
                        ),
                        MenuProfile(
                          data: 'Log out',
                          icon: Icons.logout,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileData extends StatelessWidget {
  final String? info;
  final String typeField;
  const ProfileData({super.key, required this.typeField, this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          typeField,
          style: const TextStyle(
            fontFamily: 'Jost',
            fontSize: 18,
          ),
        ),
        Text(
          '$info',
          style: const TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}

class MenuProfile extends StatelessWidget {
  final String data;
  final Function onTap;
  final IconData icon;
  const MenuProfile({
    super.key,
    required this.data,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 25,
          ),
          Text(
            data,
            style: const TextStyle(color: Colors.black, fontSize: 24),
          )
        ],
      ),
    );
  }
}
