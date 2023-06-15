import 'package:flutter/material.dart';
import 'package:permium_parts/models/storage_model.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';

class StorageDetailsView extends StatelessWidget {
  final StorageModel componentModel;
  const StorageDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    SystembuilderBloc bloc = SystembuilderBloc.get(context);
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
        Text(componentModel.title),
        Text(componentModel.rpm.toString()),
      ],
    );
  }
}
