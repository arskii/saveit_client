import 'package:budgetapp/components/entity_card.dart';
import 'package:budgetapp/constants.dart';
import 'package:budgetapp/screens/add_entries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Entities',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: textPrimary,
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: accentColor,
        icon: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Get.to(() => AddEntriesScreen()),
        label: const Text(
          'ADD ENTRIES',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: h / 1.1,
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
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  const EntityNav(),
                  Expanded(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum EntitySegments { all, receive, sent }

class EntityNav extends StatefulWidget {
  const EntityNav({super.key});

  @override
  State<EntityNav> createState() => _EntityNavState();
}

class _EntityNavState extends State<EntityNav> {
  EntitySegments _selected = EntitySegments.all;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SegmentedButton<EntitySegments>(
          segments: const [
            ButtonSegment(value: EntitySegments.all, label: Text('All')),
            ButtonSegment(
                value: EntitySegments.receive, label: Text('Receive')),
            ButtonSegment(value: EntitySegments.sent, label: Text('Sent')),
          ],
          selected: <EntitySegments>{_selected},
          onSelectionChanged: (Set<EntitySegments> selected) {
            setState(() {
              _selected = selected.first;
            });
          },
        ));
  }
}
