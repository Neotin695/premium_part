import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';
import 'package:permium_parts/views/systembuilder/pages/details_part_page.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constances/api_const.dart';
import '../components/search_delegate.dart';

class AllPartsView extends StatefulWidget {
  final Components component;
  const AllPartsView({super.key, required this.component});

  @override
  State<AllPartsView> createState() => _AllPartsViewState();
}

class _AllPartsViewState extends State<AllPartsView> {
  late SystembuilderBloc bloc;

  @override
  void initState() {
    bloc = SystembuilderBloc.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SystembuilderBloc()
          ..add(LoadAllParts(components: widget.component)),
        child: BlocBuilder<SystembuilderBloc, SystembuilderState>(
          builder: (context, state) {
            if (state is PartsLoadedSuccess) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(widget.component.name),
                  actions: [
                    IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: MySearchDelegate(
                              bloc,
                              widget.component,
                              components: state.parts,
                            ),
                          );
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
                body: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.parts.length,
                      itemBuilder: (_, index) {
                        final part = bloc.handleDataTypes(
                            widget.component, state.parts[index]);

                        return Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, DetailsPartPage.routeName,
                                    arguments: part);
                              },
                              leading: CachedNetworkImage(
                                  height: 5.h,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      '${ApiConst.baseUrlImage}/normal_user/image/${widget.component.name}/${part.image}',
                                  progressIndicatorBuilder: (_, url, don) {
                                    return const CircularProgressIndicator();
                                  }),
                              title: Text(part.title),
                            ),
                            const Divider()
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );
            } else if (state is PartsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Somthing went wrong!!'));
            }
          },
        ),
      ),
    );
  }
}
