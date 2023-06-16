import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/models/storage_model.dart';

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
      child: Column(
        children: [
          Image.asset('assets/images/placeholder.png'),
          Text(componentModel.title),
          Text(componentModel.rpm.toString()),
          
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              bloc.add(
                  AddComponent(Components.storages, slug: componentModel.slug));
            },
            child: const Text('Add Components'),
          ),
        ],
      ),
    );
  }
}
