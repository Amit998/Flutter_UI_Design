import 'package:dashboard_ui/constants.dart';
import 'package:dashboard_ui/models/myFiles.dart';
import 'package:dashboard_ui/screens/dashboard/components/progressline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    this.info,
  }) : super(key: key);

  final CloudStorageInfo? info;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 4.5),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: info!.color?.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: SvgPicture.asset(
                  info!.svgSrc!,
                  color: info!.color,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white54,
              )
            ],
          ),
          Text(
            info!.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                  color: info!.color!.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              ProgressLine(
                percentage: info?.percentage,
                color: info?.color,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info!.numOfFiels!} Files",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white54),
              ),
              Text(
                "${info!.totalStorage!}",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
