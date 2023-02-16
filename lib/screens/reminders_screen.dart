import 'package:budgetapp/components/entity_card.dart';
import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/reminders_card.dart';
import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
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
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Reminders',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: ListView(
                    children: [
                      RemindersCard(
                          textTitle: 'KFC',
                          textDesc: '16.02.2023',
                          textPrice: '10',
                          linkDue: 'due on'),
                      RemindersCard(
                          textTitle: 'KFC',
                          textDesc: '16.02.2023',
                          textPrice: '10',
                          linkDue: 'due on'),
                      RemindersCard(
                          textTitle: 'KFC',
                          textDesc: '16.02.2023',
                          textPrice: '10',
                          linkDue: 'due on'),
                      RemindersCard(
                          textTitle: 'KFC',
                          textDesc: '16.02.2023',
                          textPrice: '10',
                          linkDue: 'due on'),
                      RemindersCard(
                          textTitle: 'KFC',
                          textDesc: '16.02.2023',
                          textPrice: '10',
                          linkDue: 'due on'),
                      RemindersCard(
                          textTitle: 'KFC',
                          textDesc: '16.02.2023',
                          textPrice: '10',
                          linkDue: 'due on'),
                      RemindersCard(
                          textTitle: 'KFC',
                          textDesc: '16.02.2023',
                          textPrice: '10',
                          linkDue: 'due on'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    child: MainButton(text: 'Add', onTap: () {}),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
