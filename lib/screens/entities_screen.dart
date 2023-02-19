import 'package:budgetapp/components/entity_card.dart';
import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';

class EntitiesScreen extends StatefulWidget {
  const EntitiesScreen({super.key});

  @override
  State<EntitiesScreen> createState() => _EntitiesScreenState();
}

final List entity = [
  {
    'imageLink': 'assets/cigun.jpg',
    'textTitle': 'Apple.de',
    'textDesc': '14.02.2023',
    'textPrice': '\$1200'
  },
  {
    'imageLink': 'assets/cigun.jpg',
    'textTitle': 'Apple.de',
    'textDesc': '14.02.2023',
    'textPrice': '\$1200'
  },
  {
    'imageLink': 'assets/cigun.jpg',
    'textTitle': 'Apple.de',
    'textDesc': '14.02.2023',
    'textPrice': '\$1200'
  },
  {
    'imageLink': 'assets/cigun.jpg',
    'textTitle': 'Apple.de',
    'textDesc': '14.02.2023',
    'textPrice': '\$1200'
  },
  {
    'imageLink': 'assets/cigun.jpg',
    'textTitle': 'Apple.de',
    'textDesc': '14.02.2023',
    'textPrice': '\$1200'
  },
  {
    'imageLink': 'assets/cigun.jpg',
    'textTitle': 'Apple.de',
    'textDesc': '14.02.2023',
    'textPrice': '\$1200'
  },
  {
    'imageLink': 'assets/cigun.jpg',
    'textTitle': 'Apple.de',
    'textDesc': '14.02.2023',
    'textPrice': '\$1200'
  },
];

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
                const Expanded(flex: 1, child: EntityNav()),
                Expanded(
                  flex: 6,
                  child: ListView.builder(
                      itemCount: entity.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return EntityCard(
                          imageLink: entity[index]['imageLink'],
                          textTitle: entity[index]['textTitle'],
                          textDesc: entity[index]['textDesc'],
                          textPrice: entity[index]['textPrice'],
                        );
                      }),
                ),
                Expanded(
                  flex: 1,
                  child: MainButton(
                    text: 'Add Entries',
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EntityNav extends StatelessWidget {
  const EntityNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: const BoxDecoration(
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
            child: const Text(
              'all',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Receive',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Sent',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
