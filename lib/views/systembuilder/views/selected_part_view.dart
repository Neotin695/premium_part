import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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
            return SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  Text('Here you can see all selected components',
                      style: TextStyle(fontSize: 18.sp)),
                  SizedBox(height: 5.h),
                  ListTile(
                    title: Text(part.cpu != null
                        ? part.cpu!.title
                        : 'No Component selected yet!'),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(part.gpu == null
                        ? 'No Component selected yet!'
                        : part.gpu!.title),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(part.motherboard == null
                        ? 'No Component selected yet!'
                        : part.motherboard!.title),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  ),
                  const Divider(),
                  part.memory.isEmpty
                      ? ListTile(
                          title: const Text('No Component selected yet!'),
                          trailing: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
                        )
                      : SizedBox(
                          height: 15.h,
                          child: ListView.builder(
                            itemCount: part.memory.length,
                            itemBuilder: (_, index) {
                              final memory = part.memory[index];
                              return ListTile(
                                title: Text(memory.title),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                              );
                            },
                          ),
                        ),
                  const Divider(),
                  ListTile(
                    title: Text(part.cooler == null
                        ? 'No Component selected yet!'
                        : part.cooler!.title),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  ),
                  const Divider(),
                  part.storage.isEmpty
                      ? ListTile(
                          title: const Text('No Component selected yet!'),
                          trailing: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
                        )
                      : SizedBox(
                          height: 15.h,
                          child: ListView.builder(
                            itemCount: part.storage.length,
                            itemBuilder: (_, index) {
                              final storage = part.storage[index];
                              return ListTile(
                                title: Text(storage.title),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                              );
                            },
                          ),
                        ),
                  const Divider(),
                  ListTile(
                    title: Text(part.powersupply == null
                        ? 'No Component selected yet!'
                        : part.powersupply!.title),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(part.cases == null
                        ? 'No Component selected yet!'
                        : part.cases!.title),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  ),
                  const Divider(),
                ],
              ),
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
