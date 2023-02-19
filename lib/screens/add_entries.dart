import 'package:budgetapp/components/main_button.dart';
import 'package:budgetapp/components/main_textfield.dart';
import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:date_field/date_field.dart';

class AddEntriesScreen extends StatefulWidget {
  AddEntriesScreen({
    super.key,
  });

  @override
  State<AddEntriesScreen> createState() => _AddEntriesScreenState();
}

class _AddEntriesScreenState extends State<AddEntriesScreen> {
  final controllerTitle = TextEditingController();
  final controllerCategory = TextEditingController();
  final controllerDate = TextEditingController();

  String? _title, _category, _date;
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
                const Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Add Entries',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MainTexfield(
                          controller: controllerTitle,
                          labelText: 'title',
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            return null;
                          },
                          onSaved: (input) => _title = input),
                      const SizedBox(
                        height: 15,
                      ),
                      MainTexfield(
                          controller: controllerCategory,
                          labelText: 'category',
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: SvgPicture.asset(
                                  'assets/icons/arrowDownBig.svg'),
                            ),
                          ),
                          validator: (Value) {
                            return null;
                          },
                          onSaved: (input) => _category = input),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomDateTimeField(
                        labelText: 'Date & time',
                        onSaved: (input) => _date = input.toString(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'payment mode',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PaymentCard(),
                                  PaymentCard(),
                                  PaymentCard(),
                                  PaymentCard(),
                                ],
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: MainButton(text: 'Add', onTap: () {})),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}

class CustomDateTimeField extends StatelessWidget {
  final String labelText;
  final Function(String?) onSaved;
  const CustomDateTimeField({
    super.key,
    required this.labelText,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 5),
          DateTimeFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              alignLabelWithHint: true,
              fillColor: Colors.white,
              filled: true,
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              suffixIcon: Icon(Icons.event_note),
            ),
            mode: DateTimeFieldPickerMode.dateAndTime,
            autovalidateMode: AutovalidateMode.always,
            validator: (e) =>
                (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
