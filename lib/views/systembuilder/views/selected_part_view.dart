import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/systembuilder_bloc.dart';

class SelectedPartView extends StatelessWidget {
  const SelectedPartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SystembuilderBloc()..add(LoadSelectedParts()),
      child: BlocBuilder<SystembuilderBloc, SystembuilderState>(
        builder: (context, state) {
          if (state is LoadedSelectedPart) {
            final part = state.selectedPartModel;
            return Column(
              children: [
                ListTile(
                  title: Text(part.cpuModel!.title),
                ),
                ListTile(
                  title: Text(part.gpuModel!.title),
                ),
                ListTile(
                  title: Text(part.motherboardModel!.title),
                ),
                ListTile(
                  title: Text(part.memoriesModel[0].title),
                ),
                ListTile(
                  title: Text(part.coolerModel!.title),
                ),
                ListTile(
                  title: Text(part.storageModel[0].title),
                ),
                ListTile(
                  title: Text(part.powerSuppliesModel!.title),
                ),
                ListTile(
                  title: Text(part.caseModel!.title),
                ),
              ],
            );
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text('somthing wen wrong'));
        }, 
      ),
    );
  }
}
