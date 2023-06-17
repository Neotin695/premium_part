import 'package:flutter/material.dart';
import 'package:permium_parts/models/cooler_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/common.dart';

class CoolerDetailsView extends StatelessWidget {
  final CoolerModel componentModel;
  const CoolerDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
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
