import 'package:flutter/material.dart';
import 'package:permium_parts/models/cpu_model.dart';

class CpuDetailsView extends StatelessWidget {
  final CpuModel componentModel;
  const CpuDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
        Text(componentModel.title),
        Text(componentModel.coreClock.toString()),
        Text(componentModel.power.toString()),
      ],
    );
  }
}
