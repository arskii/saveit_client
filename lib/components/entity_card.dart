import 'package:flutter/material.dart';

class EntityCard extends StatelessWidget {
  final String imageLink;
  final String textTitle;
  final String textDesc;
  final String textPrice;
  const EntityCard(
      {super.key,
      required this.imageLink,
      required this.textTitle,
      required this.textDesc,
      required this.textPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(imageLink)),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(textTitle,
                  style: const TextStyle(fontSize: 15, fontFamily: 'Jost')),
              Text(textDesc, style: TextStyle(fontSize: 15, fontFamily: 'Jost'))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(textPrice,
                  style: const TextStyle(fontSize: 15, fontFamily: 'Jost'))
            ],
          )
        ],
      ),
    );
  }
}
