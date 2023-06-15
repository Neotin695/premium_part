import 'package:flutter/material.dart';
import 'package:permium_parts/models/gpu_mdoel.dart';

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
      ],
    );
  }
}
