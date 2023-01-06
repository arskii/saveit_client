import 'package:budgetapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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

    return Container(
      padding: EdgeInsets.all(40.0),
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
              Container(
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: textGray),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text('Icon')],
                      ),
                      Column(
                        children: [Text('Patreon membership')],
                      ),
                      Column(
                        children: [Text('Arrow')],
                      )
                    ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
