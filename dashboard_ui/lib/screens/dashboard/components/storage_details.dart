import 'package:dashboard_ui/constants.dart';
import 'package:dashboard_ui/screens/dashboard/components/chart.dart';
import 'package:dashboard_ui/screens/dashboard/components/storageInfoCard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class Storage_Details extends StatelessWidget {
  const Storage_Details({
    Key? key,
    required this.paiCharSelectionData,
  }) : super(key: key);

  final List<PieChartSectionData> paiCharSelectionData;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      padding: EdgeInsets.all(defaultPadding),
      // color: secondaryColor,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            file_name: "Unkown Files",
            svgPicture: "assets/icons/unknown.svg",
            total_files: 120,
            total_storage: 1.3,
          ),
        ],
      ),
    );
  }
}
