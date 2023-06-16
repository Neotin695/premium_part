import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:permium_parts/models/cpu_model.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/circular_dot.dart';

class CpuDetailsView extends StatelessWidget {
  final CpuModel componentModel;
  const CpuDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    SystembuilderBloc bloc = SystembuilderBloc.get(context);
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Product Features',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        ListTile(
          leading: const CircularDot(),
          title: Text('BoostClock: ${componentModel.boostClock}'),
        ),
        ListTile(
          leading: const CircularDot(),
          title: Text('CapacityUnit: ${componentModel.brand}'),
        ),
        ListTile(
          leading: const CircularDot(),
          title: Text('Capacity: ${componentModel.cores}'),
        ),
        ListTile(
          leading: const CircularDot(),
          title: Text('Cache: ${componentModel.gpuIncluded}'),
        ),
        ListTile(
          leading: const CircularDot(),
          title: Text('RPM: ${componentModel.socketId}'),
        ),
        ListTile(
          leading: const CircularDot(),
          title: Text('Type: ${componentModel.coreClock}'),
        ),
        ElevatedButton(
          onPressed: () {
            bloc.add(
                AddComponent(Components.storages, slug: componentModel.slug));
          },
          child: const Text('Add Components'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (!await launchUrl(Uri.parse(componentModel.link))) {
              // ignore: use_build_context_synchronously
              CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  text: 'Could not launch${componentModel.link}');
            }
          },
          child: const Text('Buy'),
        ),
      ],
    );
  }
}
