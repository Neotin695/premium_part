import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/systembuilder_bloc.dart';
import '../views/systembuilder_view.dart';

class SystembuilderPage extends StatelessWidget {
  const SystembuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SystembuilderBloc(),
        child: const SystembuilderView(),
      ),
    );
  }
}
