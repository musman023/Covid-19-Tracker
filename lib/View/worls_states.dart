import 'package:covid_tracker/Widgets/reuseable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = const [
    Color(0xff4285f4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            PieChart(
              dataMap: const {
                "Total": 20,
                "Recovered": 15,
                "Deaths": 5,
              },
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions:
                  const LegendOptions(legendPosition: LegendPosition.left),
              animationDuration: const Duration(milliseconds: 1500),
              chartType: ChartType.ring,
              colorList: colorList,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.06),
              child: Card(
                child: Column(
                  children: [
                    ReuseableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ReuseableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ReuseableRow(
                      title: 'Total',
                      value: '200',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xff1aa260),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Track Countries',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
