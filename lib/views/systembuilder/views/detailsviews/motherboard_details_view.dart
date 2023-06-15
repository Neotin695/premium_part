import 'package:flutter/material.dart';
import 'package:permium_parts/models/component_model.dart';
import 'package:permium_parts/models/cpu_model.dart';
import 'package:permium_parts/models/mother_board_model.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';

class MotherboardDetailsView extends StatelessWidget {
  final MotherboardModel componentModel;
  const MotherboardDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    SystembuilderBloc bloc = SystembuilderBloc.get(context);
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
        Text(componentModel.title),
        Text(componentModel.chipsetId.toString()),
      ],
    );
  }
}
