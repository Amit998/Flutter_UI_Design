import 'package:dashboard_ui/constants.dart';
import 'package:dashboard_ui/models/RecentFile.dart';
import 'package:dashboard_ui/screens/dashboard/components/chart.dart';
import 'package:dashboard_ui/screens/dashboard/components/header.dart';
import 'package:dashboard_ui/screens/dashboard/components/my_files.dart';
import 'package:dashboard_ui/screens/dashboard/components/storageInfoCard.dart';
import 'package:dashboard_ui/screens/dashboard/components/storage_details.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  List<PieChartSectionData> paiCharSelectionData = [
    PieChartSectionData(
        value: 25, color: primaryColor, radius: 25, showTitle: false),
    PieChartSectionData(
        value: 20, color: Color(0xFF26E5FF), radius: 22, showTitle: false),
    PieChartSectionData(
        value: 10, color: Color(0xFFFFCF26), radius: 19, showTitle: false),
    PieChartSectionData(
        value: 15, color: Color(0xFFEE2727), radius: 16, showTitle: false),
    PieChartSectionData(
        value: 20,
        color: primaryColor.withOpacity(0.1),
        radius: 13,
        showTitle: false),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiels(),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        RecentFiles()
                      ],
                    )),
                SizedBox(
                  width: defaultPadding,
                ),
                Expanded(
                    flex: 2,
                    child: Storage_Details(
                        paiCharSelectionData: paiCharSelectionData)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(label: Text("File Name")),
                  DataColumn(label: Text("Date")),
                  DataColumn(label: Text("Size")),
                ],
                rows: List.generate(demoRecentFiles.length,
                    (index) => dataRecentFiles(demoRecentFiles[index]))),
          )
        ],
      ),
    );
  }

  DataRow dataRecentFiles(RecentFile fileInfo) {
    return DataRow(cells: [
      DataCell(Row(
        children: [
          SvgPicture.asset(
            fileInfo.icon!,
            height: 30,
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(fileInfo.title!),
          )
        ],
      )),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ]);
  }
}
