import 'package:dashboard_ui/constants.dart';
import 'package:dashboard_ui/models/myFiles.dart';
import 'package:dashboard_ui/screens/dashboard/components/file_info_card.dart';
import 'package:dashboard_ui/screens/dashboard/components/progressline.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFiels extends StatelessWidget {
  const MyFiels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("My Files", style: Theme.of(context).textTheme.subtitle1),
            Spacer(),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: defaultPadding,
                      horizontal: defaultPadding * 1.5)),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
            )
          ],
        ),
        SizedBox(height: defaultPadding),
        GridView.builder(
          itemCount: demoMyFiles.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: defaultPadding,
              childAspectRatio: 1.4),
          itemBuilder: (context, index) => FileInfoCard(
            info: demoMyFiles[index],
          ),
        )
      ],
    );
  }
}
