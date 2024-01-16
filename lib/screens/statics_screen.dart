import 'package:budgetapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StaticsScreen extends StatefulWidget {
  const StaticsScreen({super.key});

  @override
  State<StaticsScreen> createState() => _StaticsScreenState();
}

final List<ChartData> chartData = [
  ChartData('Eats', 20, Colors.red),
  ChartData('Home', 30, Colors.blue),
  ChartData('Medicine', 20, Colors.green),
  ChartData('Others', 30, Colors.yellow)
];

final List<ChartData> globalData = [
  ChartData('Expanses', 20, Colors.grey),
  ChartData('Saved', 30, accentColor),
];
final List<ChartAllData> chartAllData = [
  ChartAllData(2018, 500, 300),
  ChartAllData(2019, 500, 300),
  ChartAllData(2020, 500, 300),
  ChartAllData(2021, 500, 300),
  ChartAllData(2022, 500, 300),
];

class _StaticsScreenState extends State<StaticsScreen> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          title: const Text(
            'Statics',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.1,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  mainColor,
                  secondColor,
                ]),
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: accentColor,
                              ),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: SfCircularChart(
                              // Initialize category axis
                              legend: Legend(
                                  isVisible: true,
                                  position: LegendPosition.right),
                              series: <CircularSeries>[
                                // Render pie chart
                                PieSeries<ChartData, String>(
                                    dataSource: globalData,
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: true)),
                              ])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'your categories',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.more_horiz)
                        ],
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: accentColor,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: SfCircularChart(
                              // Initialize category axis
                              legend: Legend(isVisible: true),
                              series: <CircularSeries>[
                                // Render pie chart
                                PieSeries<ChartData, String>(
                                    dataSource: chartData,
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: true)),
                              ])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'during time',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.more_horiz)
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: accentColor,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        // child: SfCartesianChart(
                        //   primaryXAxis: NumericAxis(),
                        //   primaryYAxis: NumericAxis(),
                        //   series: <ChartSeries<ChartAllData, double>>[
                        //     ColumnSeries(
                        //       dataSource: chartAllData,
                        //       xValueMapper: (ChartAllData data, _) => data.x,
                        //       yValueMapper: (ChartAllData data, _) => data.y,
                        //     ),
                        //     ColumnSeries(
                        //       dataSource: chartAllData,
                        //       xValueMapper: (ChartAllData data, _) => data.x,
                        //       yValueMapper: (ChartAllData data, _) => data.y1,
                        //     ),
                        //   ],
                        // )),
                        child: Spacer(),
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class ChartAllData {
  ChartAllData(this.x, this.y, this.y1);
  final double x;
  final double y;
  final double y1;
}
