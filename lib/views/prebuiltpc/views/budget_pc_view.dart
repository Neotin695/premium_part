import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/prebuiltpc/bloc/prebuiltpc_bloc.dart';

class BudgetPcView extends StatelessWidget {
  const BudgetPcView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PrebuiltpcBloc()..add(LoadAllPcs(pcType: PcType.budgetPc)),
      child: BlocConsumer<PrebuiltpcBloc, PrebuiltpcState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PcLoaded) {
            return ListView(
              shrinkWrap: true,
              children: state.pcs.map((pc) {
                return ListTile(
                  title: Text(pc.title),
                  subtitle: Text('${pc.cpuId}'),
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
