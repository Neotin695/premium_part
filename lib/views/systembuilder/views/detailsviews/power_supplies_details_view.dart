import 'package:flutter/material.dart';
import 'package:permium_parts/models/power_supplies_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/common.dart';

class PowerSuppliesDetailsView extends StatelessWidget {
  final PowerSuppliesModel componentModel;
  const PowerSuppliesDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
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
