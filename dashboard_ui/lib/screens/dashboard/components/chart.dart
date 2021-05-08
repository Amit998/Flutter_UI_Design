import 'package:dashboard_ui/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.paiCharSelectionData,
  }) : super(key: key);

  final List<PieChartSectionData> paiCharSelectionData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiCharSelectionData)),
          Positioned.fill(
              // top: 70,
              // bottom: 50,
              // right: 0,
              // left: 0,
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: defaultPadding,
              ),
              Text("29.1",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30)),
              Text("of 128GB")
            ],
          ))
        ],
      ),
    );
  }
}
