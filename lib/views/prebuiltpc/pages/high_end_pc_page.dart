import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/prebuiltpc_bloc.dart';
import '../views/high_end_pc_view.dart';

class HighEndPcPage extends StatelessWidget {
  static const String routeName = '/highendpc';
  const HighEndPcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PrebuiltpcBloc(),
        child: const HighEndPcView(),
      ),
    );
  }
}
