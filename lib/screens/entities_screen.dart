import 'package:budgetapp/components/entity_card.dart';
import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';

class EntitiesScreen extends StatefulWidget {
  const EntitiesScreen({super.key});

  @override
  State<EntitiesScreen> createState() => _EntitiesScreenState();
}

class _EntitiesScreenState extends State<EntitiesScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'all',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Receive',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sent',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                      ]),
                  height: 50,
                ),
                EntityCard(
                    textTitle: 'Apple.de',
                    textDesc: '14.02.2023',
                    textPrice: '\$1200'),
                EntityCard(
                    textTitle: 'Apple.de',
                    textDesc: '14.02.2023',
                    textPrice: '\$1200'),
                EntityCard(
                    textTitle: 'Apple.de',
                    textDesc: '14.02.2023',
                    textPrice: '\$1200'),
                EntityCard(
                    textTitle: 'Apple.de',
                    textDesc: '14.02.2023',
                    textPrice: '\$1200'),
                MainButton(
                  text: 'Add Entries',
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
