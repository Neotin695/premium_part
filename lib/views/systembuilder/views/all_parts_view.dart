import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';
import 'package:permium_parts/views/systembuilder/pages/details_part_page.dart';
import 'package:sizer/sizer.dart';

class AllPartsView extends StatelessWidget {
  final Components component;
  const AllPartsView({super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    final SystembuilderBloc bloc = SystembuilderBloc.get(context);
    return BlocProvider(
      create: (context) =>
          SystembuilderBloc()..add(LoadAllParts(components: component)),
      child: BlocConsumer<SystembuilderBloc, SystembuilderState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is PartsLoadedSuccess) {
            return ListView.builder(
              itemCount: state.parts.length,
              itemBuilder: (_, index) {
                final part =
                    bloc.handleDataTypes(component, state.parts[index]);

                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, DetailsPartPage.routeName,
                            arguments: part);
                      },
                      leading: Image.asset(
                        'assets/images/placeholder.png',
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.cover,
                      ),
                      title: Text(part.title),
                    ),
                    const Divider()
                  ],
                );
              },
            );
          } else if (state is PartsLoading) {
            return SizedBox(
              width: double.infinity,
              height: 30.h,
              child: const Center(child: CircularProgressIndicator()),
            );
          } else {
            return const Center(child: Text('Somthing went wrong!!'));
          }
        },
      ),
    );
  }
}
