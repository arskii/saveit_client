import 'package:budgetapp/components/entity_card.dart';
import 'package:budgetapp/constants.dart';
import 'package:budgetapp/screens/saving_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [mainColor, secondColor]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'tuesday',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '03.03.23',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Jost',
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$1000',
                      style: TextStyle(fontSize: 35),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Month Budget',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$10 000',
                      style: TextStyle(fontSize: 35),
                    )
                  ],
                ),
                Container(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HomeCards(
                        title: 'Savings',
                        icon: Icons.payments,
                        onTap: () => Get.to(SavingScreen()),
                      ),
                      HomeCards(
                        title: 'Reminders',
                        icon: Icons.payments,
                        onTap: () {},
                      ),
                      HomeCards(
                        title: 'Budget',
                        icon: Icons.payments,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest entries',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.more_horiz)
                  ],
                ),
                Column(
                  children: [
                    EntityCard(
                        imageLink: 'assets/cigun.jpg',
                        textTitle: 'apple.de',
                        textDesc: '01.03.2023',
                        textPrice: '\$1200')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeCards extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const HomeCards(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(children: [
            Icon(icon),
            Text(
              title,
              style: TextStyle(fontSize: 15, fontFamily: 'Jost'),
            )
          ]),
        ),
      ),
    );
  }
}
