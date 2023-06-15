import 'package:flutter/material.dart';
import 'package:permium_parts/models/case_model.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';

class CaseDetailsView extends StatelessWidget {
  final CaseModel componentModel;
  const CaseDetailsView({super.key, required this.componentModel});

  @override
  Widget build(BuildContext context) {
    SystembuilderBloc bloc = SystembuilderBloc.get(context);
    return Column(
      children: [
        Image.asset('assets/images/placeholder.png'),
        Text(componentModel.title),
        Text(componentModel.vgaMaxLength.toString()),
      ],
    );
  }
}
