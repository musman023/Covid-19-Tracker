import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/Widgets/reuseable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            FutureBuilder(
                future: statesServices.fetchWorldStatesRecoeds(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50,
                          controller: _controller,
                        ));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data!.cases.toString()),
                            "Recovered": double.parse(
                                snapshot.data!.recovered.toString()),
                            "Deaths":
                                double.parse(snapshot.data!.deaths.toString()),
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left),
                          animationDuration: const Duration(milliseconds: 1500),
                          chartType: ChartType.ring,
                          colorList: colorList,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.03),
                          child: Card(
                            child: Column(
                              children: [
                                ReuseableRow(
                                  title: 'Total',
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReuseableRow(
                                  title: 'Deaths',
                                  value: snapshot.data!.deaths.toString(),
                                ),
                                ReuseableRow(
                                  title: 'Recovered',
                                  value: snapshot.data!.recovered.toString(),
                                ),
                                ReuseableRow(
                                  title: 'Active',
                                  value: snapshot.data!.active.toString(),
                                ),
                                ReuseableRow(
                                  title: 'Critical',
                                  value: snapshot.data!.critical.toString(),
                                ),
                                ReuseableRow(
                                  title: 'Today Deaths',
                                  value: snapshot.data!.todayDeaths.toString(),
                                ),
                                ReuseableRow(
                                  title: 'Today Recovered',
                                  value:
                                      snapshot.data!.todayRecovered.toString(),
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
                    );
                  }
                }),
          ],
        ),
      )),
    );
  }
}
