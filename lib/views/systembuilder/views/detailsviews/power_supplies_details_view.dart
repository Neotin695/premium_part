import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:permium_parts/models/power_supplies_model.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/common.dart';
import '../../../../core/constances/api_const.dart';

class PowerSuppliesDetailsView extends StatelessWidget {
  final PowerSuppliesModel componentModel;
  const PowerSuppliesDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
                
                fit: BoxFit.cover,
                imageUrl:
                    '${ApiConst.baseUrlImage}/normal_user/image/powersupplies/${componentModel.image}',
                progressIndicatorBuilder: (_, url, don) {
                  return const CircularProgressIndicator();
                }),
        Text(componentModel.title),
        Text(componentModel.efficiency.toString()),
        ElevatedButton(
          onPressed: () {
            Common.selectedPart.powersupply = componentModel;
          },
          child: const Text('Add Components'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (!await launchUrl(Uri.parse(componentModel.link))) {}
          },
          child: const Text('Buy'),
        ),
      ],
    );
  }
}
