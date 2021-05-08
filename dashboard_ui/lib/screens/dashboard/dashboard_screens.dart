import 'package:dashboard_ui/constants.dart';
import 'package:dashboard_ui/screens/dashboard/components/chart.dart';
import 'package:dashboard_ui/screens/dashboard/components/header.dart';
import 'package:dashboard_ui/screens/dashboard/components/storageInfoCard.dart';
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
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                      height: 500,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: defaultPadding,
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      // height: 500,
                      padding: EdgeInsets.all(defaultPadding),
                      // color: secondaryColor,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Text(
                            "Storage Details",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: defaultPadding),
                          Chart(paiCharSelectionData: paiCharSelectionData),
                          StorageInfoCard(
                            file_name: "Documents Files",
                            svgPicture: "assets/icons/Documents.svg",
                            total_files: 1329,
                            total_storage: 1.3,
                          ),
                          StorageInfoCard(
                            file_name: "Media Files",
                            svgPicture: "assets/icons/media.svg",
                            total_files: 1329,
                            total_storage: 1.3,
                          ),
                          StorageInfoCard(
                            file_name: "Other Files",
                            svgPicture: "assets/icons/folder.svg",
                            total_files: 2034,
                            total_storage: 10,
                          ),
                          StorageInfoCard(
                            file_name: "Other Files",
                            svgPicture: "assets/icons/folder.svg",
                            total_files: 2034,
                            total_storage: 10,
                          ),
                          StorageInfoCard(
                            file_name: "Unkown Files",
                            svgPicture: "assets/icons/unknown.svg",
                            total_files: 120,
                            total_storage: 1.3,
                          ),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
