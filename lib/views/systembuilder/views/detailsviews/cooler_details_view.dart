import 'package:flutter/material.dart';
import 'package:permium_parts/models/cooler_model.dart';

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
      ],
    );
  }
}
