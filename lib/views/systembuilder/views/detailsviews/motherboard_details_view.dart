import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/models/mother_board_model.dart';

import '../../bloc/systembuilder_bloc.dart';

class MotherboardDetailsView extends StatelessWidget {
  final MotherboardModel componentModel;
  const MotherboardDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    SystembuilderBloc bloc = SystembuilderBloc.get(context);
    return BlocListener<SystembuilderBloc, SystembuilderState>(
      listener: (context, state) {
        if (state is LoadingState) {
          CoolAlert.show(context: context, type: CoolAlertType.loading);
        } else if (state is AddedSuccessfully) {
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
          Text(componentModel.chipsetId.toString()),
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
