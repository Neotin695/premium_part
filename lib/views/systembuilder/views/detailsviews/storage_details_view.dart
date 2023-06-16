import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/models/storage_model.dart';
import 'package:permium_parts/views/systembuilder/components/circular_dot.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/systembuilder_bloc.dart';

class StorageDetailsView extends StatelessWidget {
  final StorageModel componentModel;
  const StorageDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    SystembuilderBloc bloc = SystembuilderBloc.get(context);
    return BlocListener<SystembuilderBloc, SystembuilderState>(
      listener: (context, state) {
        if (state is LoadingState) {
          CoolAlert.show(context: context, type: CoolAlertType.loading);
        }
        if (state is AddedSuccessfully) {
          Navigator.pop(context);
          CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              text: 'component added successfully');
        } else if (state is AddedFailure) {
          Navigator.pop(context);
          CoolAlert.show(
              context: context, type: CoolAlertType.error, text: state.message);
        }
      },
      child: SingleChildScrollView(
        child: Column(
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
              title: Text('CachUnit: ${componentModel.cacheUnit}'),
            ),
            ListTile(
              leading: const CircularDot(),
              title: Text('CapacityUnit: ${componentModel.capacityUnit}'),
            ),
            ListTile(
              leading: const CircularDot(),
              title: Text('Capacity: ${componentModel.capacity}'),
            ),
            ListTile(
              leading: const CircularDot(),
              title: Text('Cache: ${componentModel.cache}'),
            ),
            ListTile(
              leading: const CircularDot(),
              title: Text('RPM: ${componentModel.rpm}'),
            ),
            ListTile(
              leading: const CircularDot(),
              title: Text('Type: ${componentModel.type}'),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(AddComponent(Components.storages,
                    slug: componentModel.slug));
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
        ),
      ),
    );
  }
}
