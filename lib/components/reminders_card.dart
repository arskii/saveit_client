import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RemindersCard extends StatelessWidget {
  final String textTitle, textDesc, textPrice, linkDue;
  RemindersCard({
    super.key,
    required this.textTitle,
    required this.textDesc,
    required this.textPrice,
    required this.linkDue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(textTitle,
                  style: TextStyle(fontSize: 15, fontFamily: 'Jost')),
              Text(textDesc,
                  style: TextStyle(fontSize: 15, fontFamily: 'Jost')),
              Text(textPrice,
                  style: TextStyle(fontSize: 15, fontFamily: 'Jost'))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(child: SvgPicture.asset('assets/icons/dots.svg')),
              SizedBox(height: 30),
              Text(linkDue, style: TextStyle(fontSize: 15, fontFamily: 'Jost'))
            ],
          )
        ],
      ),
    );
  }
}
