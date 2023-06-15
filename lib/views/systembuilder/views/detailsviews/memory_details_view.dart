import 'package:flutter/material.dart';
import 'package:permium_parts/models/memories_model.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';

class MemoriesDetailsView extends StatelessWidget {
  final MemoriesModel componentModel;
  const MemoriesDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    SystembuilderBloc bloc = SystembuilderBloc.get(context);
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
        Text(componentModel.title),
        Text(componentModel.capacityUnit),
      ],
    );
  }
}
