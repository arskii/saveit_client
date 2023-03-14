import 'package:budgetapp/api/savings.dart';
import 'package:budgetapp/constants.dart';
import 'package:budgetapp/models/saving.model.dart';
import 'package:flutter/material.dart';

class SavingScreen extends StatefulWidget {
  const SavingScreen({super.key});

  @override
  State<SavingScreen> createState() => _SavingScreenState();
}

class _SavingScreenState extends State<SavingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SavingsApi().readJson();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Savings',
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [mainColor, secondColor]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Goals',
                    style: TextStyle(fontSize: 25),
                  ),
                  Icon(Icons.more_horiz)
                ],
              ),
              Expanded(
                child: FutureBuilder(
                    future: SavingsApi().readJson(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        final List<Saving> savings = snapshot.data;
                        return ListView.builder(
                          itemCount: savings.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GoalCard(
                              imageLink: savings[index].imageLink!,
                              textTitle: savings[index].textTitle!,
                              textPrice: savings[index].textPrice!,
                              currentSum: savings[index].currentSum!,
                            );
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  final String imageLink;
  final String textTitle;
  final String textPrice;
  final String currentSum;
  const GoalCard(
      {super.key,
      required this.imageLink,
      required this.textTitle,
      required this.textPrice,
      required this.currentSum});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 55,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imageLink),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textTitle,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Jost',
              ),
            ),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: 0.5,
                minHeight: 10,
              ),
            ),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(currentSum), Text(textPrice)],
              ),
            )
          ],
        )
      ]),
    );
  }
}
