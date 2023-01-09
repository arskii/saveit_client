import 'package:budgetapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List data = [
      {
        "icon": "assets/icons/patreon.svg",
        "text": "Patreon membership",
        "price": "19.99"
      },
      {"icon": "assets/icons/netflix.svg", "text": "Netflix", "price": "12.00"},
      {"icon": "assets/icons/apple.svg", "text": "Apple", "price": "19.99"},
      {"icon": "assets/icons/spotify.svg", "text": "Spotify", "price": "6.99"},
    ];

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
          child: ListView.builder(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      data[index]["icon"],
                    ),
                    Column(
                      children: [
                        Text(data[index]["text"]),
                        Text("\$${data[index]['price']}/mo"),
                      ],
                    ),
                    SvgPicture.asset("assets/icons/arrowRight.svg")
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
