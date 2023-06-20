import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/prebuiltpc_bloc.dart';

class HighEndPcView extends StatelessWidget {
  const HighEndPcView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PrebuiltpcBloc()..add(LoadAllPcs(pcType: PcType.highEndPc)),
      child: BlocConsumer<PrebuiltpcBloc, PrebuiltpcState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PcLoaded) {
            return ListView(
              shrinkWrap: true,
              children: state.pcs.map((pc) {
                return ListTile(
                  title: Text(pc.title),
                  subtitle: Text(pc.cpu!.title),
                );
              }).toList(),
            );
          }
          return const Center(
            child: Text('Somthing went wrong!'),
          );
        },
      ),
    );
  }
}
