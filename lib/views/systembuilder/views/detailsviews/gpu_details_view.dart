import 'package:flutter/material.dart';
import 'package:permium_parts/models/gpu_mdoel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/common.dart';

class GpuDetailsView extends StatelessWidget {
  final GpuModel componentModel;
  const GpuDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
        Text(componentModel.title),
        Text(componentModel.boostClock.toString()),
        ElevatedButton(
          onPressed: () {
            Common.selectedPart.gpu = componentModel;
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
