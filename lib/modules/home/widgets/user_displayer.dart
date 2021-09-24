import 'dart:math';

import 'package:flutter/material.dart';
import 'package:funspler/general/constants/api_path.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:funspler/general/constants/asset_constant.dart';

class UserDisplayer extends StatelessWidget {
  const UserDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: FadeInImage.assetNetwork(
              width: 32,
              height: 32,
              placeholder: AssetConstant.shimmer,
              image: ApiPath.squareImage(
                  seed: Random().nextInt(10000),
                  width: AppConstant.kDouble_32.toInt())),
        ),
        SizedBox(width: AppConstant.kDouble_8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trong Duong Binh',
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              '@princ3od',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        )
      ],
    );
  }
}
