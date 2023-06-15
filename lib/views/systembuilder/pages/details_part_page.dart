import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/systembuilder_bloc.dart';

class DetailsPartPage extends StatelessWidget {
  static const String routeName = '/detailspage';
  const DetailsPartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final part = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            SystembuilderBloc()..add(HandleViewEvent(model: part!)),
        child: BlocBuilder<SystembuilderBloc, SystembuilderState>(
          builder: (context, state) {
            if (state is LoadViewState) {
              return state.view;
            }
            return const Center(child: Text('somthing went wrong!!!'));
          },
        ),
      ),
    );
  }
}
