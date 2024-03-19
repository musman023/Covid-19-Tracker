import 'package:covid_tracker/Widgets/reuseable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatefulWidget {
  String name, image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.test,
    required this.todayRecovered,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.06),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      ReuseableRow(
                        title: 'Total',
                        value: widget.totalCases.toString(),
                      ),
                      ReuseableRow(
                        title: 'Deaths',
                        value: widget.totalDeaths.toString(),
                      ),
                      ReuseableRow(
                        title: 'Recovered',
                        value: widget.totalRecovered.toString(),
                      ),
                      ReuseableRow(
                        title: 'Active',
                        value: widget.active.toString(),
                      ),
                      ReuseableRow(
                        title: 'Critical',
                        value: widget.critical.toString(),
                      ),
                      ReuseableRow(
                        title: 'Today Deaths',
                        value: widget.totalDeaths.toString(),
                      ),
                      ReuseableRow(
                        title: 'Today Recovered',
                        value: widget.totalRecovered.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          ),
        ],
      ),
    );
  }
}
