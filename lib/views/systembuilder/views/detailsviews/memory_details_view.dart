import 'package:flutter/material.dart';
import 'package:permium_parts/models/memories_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/common.dart';

class MemoriesDetailsView extends StatelessWidget {
  final MemoriesModel componentModel;
  const MemoriesDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
        Text(componentModel.title),
        Text(componentModel.capacityUnit),
        ElevatedButton(
          onPressed: () {
            Common.selectedPart.memory.add(componentModel);
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
