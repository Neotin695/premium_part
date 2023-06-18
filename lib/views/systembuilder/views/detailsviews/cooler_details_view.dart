import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:permium_parts/models/cooler_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/common.dart';
import '../../../../core/constances/api_const.dart';

class CoolerDetailsView extends StatelessWidget {
  final CoolerModel componentModel;
  const CoolerDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                '${ApiConst.baseUrlImage}/normal_user/image/coolers/${componentModel.image}',
            progressIndicatorBuilder: (_, url, don) {
              return const CircularProgressIndicator();
            }),
        Text(componentModel.title),
        Text(componentModel.minNoise.toString()),
        ElevatedButton(
          onPressed: () {
            Common.selectedPart.cooler = componentModel;
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
