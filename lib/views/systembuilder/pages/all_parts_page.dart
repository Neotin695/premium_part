import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/systembuilder_bloc.dart';
import '../views/all_parts_view.dart';

class AllPartsPage extends StatelessWidget {
  static const String routeName = '/allparts';
  const AllPartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final component = ModalRoute.of(context)!.settings.arguments as Components;
    return BlocProvider(
      create: (context) => SystembuilderBloc(),
      child: AllPartsView(
        component: component,
      ),
    );
  }
}
