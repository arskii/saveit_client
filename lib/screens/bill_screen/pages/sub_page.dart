import 'package:budgetapp/constants.dart';
import 'package:budgetapp/api/subscription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/sub.dart';

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    // get Data
    getSub();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Your monthly payment \n for subcriptions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textPrimary,
                    ),
                  ),
                  Text(
                    '\$61.88',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          width: width * 0.9,
          child: FutureBuilder<List<Subcription>>(
              future: getSub(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Subcription> sub = snapshot.data;
                  return ListView.builder(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    itemCount: sub.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              sub[index].icon!,
                            ),
                            Column(
                              children: [
                                Text(sub[index].text!),
                                Text("\$${sub[index].price!}/mo"),
                              ],
                            ),
                            SvgPicture.asset("assets/icons/arrowRight.svg")
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ],
    );
  }
}
