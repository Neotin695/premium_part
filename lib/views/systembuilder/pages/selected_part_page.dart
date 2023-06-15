import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/systembuilder_bloc.dart';
import '../views/selected_part_view.dart';

class SelectedPartPage extends StatelessWidget {
  const SelectedPartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SystembuilderBloc(),
        child: const SelectedPartView(),
      ),
    );
  }
}
