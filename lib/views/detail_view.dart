import 'package:covid_app/services/reusable_row.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  final String image, name;
  final int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  const DetailView({
    super.key,
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.name)),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * .06),
                      ReusableRow(
                        title: 'Cases',
                        value: widget.totalCases.toString(),
                      ),
                      ReusableRow(
                        title: 'Deaths',
                        value: widget.totalDeaths.toString(),
                      ),
                      ReusableRow(
                        title: 'Recovered',
                        value: widget.totalRecovered.toString(),
                      ),
                      ReusableRow(
                        title: 'Active',
                        value: widget.active.toString(),
                      ),
                      ReusableRow(
                        title: 'Critical',
                        value: widget.critical.toString(),
                      ),
                      ReusableRow(
                        title: 'Today Recovered',
                        value: widget.todayRecovered.toString(),
                      ),
                      ReusableRow(title: 'Test', value: widget.test.toString()),
                    ],
                  ),
                ),
              ),

              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
