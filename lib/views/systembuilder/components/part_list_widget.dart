import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/systembuilder/components/components_item.dart';
import 'package:sizer/sizer.dart';

import '../bloc/systembuilder_bloc.dart';
import '../pages/details_part_page.dart';

class PartListView extends StatelessWidget {
  final Components component;
  final Function()? onViewAllPressed;

  const PartListView({
    super.key,
    required this.component,
    required this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SystembuilderBloc()..add(LoadAllParts(components: component)),
      child: BlocConsumer<SystembuilderBloc, SystembuilderState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is PartsLoadedSuccess) {
            return SizedBox(
              height: 30.h,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      component.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13.sp),
                    ),
                    trailing: InkWell(
                      onTap: onViewAllPressed,
                      child: Text(
                        'View All',
                        style: TextStyle(fontSize: 13.sp, color: Colors.blue),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.parts.length,
                      itemBuilder: (_, index) {
                        final part = state.parts[index];

                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DetailsPartPage.routeName,
                                  arguments: part);
                            },
                            child: ComponentsItem(
                              basePartModel: part,
                              components: component,
                            ));
                      },
                    ),
                  ),
                ],
              ),
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
