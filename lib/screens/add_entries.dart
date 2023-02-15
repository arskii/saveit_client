import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/main_textfield.dart';
import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddEntriesScreen extends StatefulWidget {
  AddEntriesScreen({
    super.key,
  });

  @override
  State<AddEntriesScreen> createState() => _AddEntriesScreenState();
}

class _AddEntriesScreenState extends State<AddEntriesScreen> {
  final controllerTitle = TextEditingController();
  String? _title;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Entries',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MainTexfield(
                    controller: controllerTitle,
                    labelText: 'title',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    validator: (Value) {
                      return null;
                    },
                    onSaved: (input) => _title = input),
                SizedBox(
                  height: 20,
                ),
                MainTexfield(
                    controller: controllerTitle,
                    labelText: 'category',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child:
                            SvgPicture.asset('assets/icons/arrowDownBig.svg'),
                      ),
                    ),
                    validator: (Value) {
                      return null;
                    },
                    onSaved: (input) => _title = input),
                SizedBox(
                  height: 20,
                ),
                MainTexfield(
                    controller: controllerTitle,
                    labelText: 'date & time',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    validator: (Value) {
                      return null;
                    },
                    onSaved: (input) => _title = input),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'payment mode',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 65,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      width: 65,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      width: 65,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      width: 65,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 145,
                ),
                MainButton(text: 'Add', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
