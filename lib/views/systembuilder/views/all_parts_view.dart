import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';
import 'package:permium_parts/views/systembuilder/pages/details_part_page.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constances/api_const.dart';
import '../../../core/services/record_audio.dart';
import '../components/search_delegate.dart';

class AllPartsView extends StatefulWidget {
  final Components component;

  const AllPartsView({super.key, required this.component});

  @override
  State<AllPartsView> createState() => _AllPartsViewState();
}

class _AllPartsViewState extends State<AllPartsView> {
  late SystembuilderBloc bloc;
  final recorder = RecordSearch();

  @override
  void initState() {
    bloc = SystembuilderBloc.get(context);
    recorder.init();
    super.initState();
  }

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SystembuilderBloc()
          ..add(LoadAllParts(components: widget.component)),
        child: BlocConsumer<SystembuilderBloc, SystembuilderState>(
          listener: (context, state) {
            if (state is SuccessSearch) {

              showSearch(
                context: context,
                delegate: MySearchDelegate(bloc, widget.component,
                    components: (state as PartsLoadedSuccess).parts,
                    resultAudio: state.valueSearch),

              );
              print(state.valueSearch);
            }else if(state is FailureSearch){
              CoolAlert.show(context: context, type: CoolAlertType.error,text: state.message);
            }
          },
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
                floatingActionButton: AnimatedFloatingActionButton(
                  animatedIconData: AnimatedIcons.menu_close,
                  fabButtons: [
                    FloatingActionButton(
                      onPressed: () {

                      },
                      heroTag: 'search_image',
                      child: const Icon(Icons.image),
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        await recorder.toggle().then((value) =>
                            bloc.add(VoiceSearchEvent(recorder.path)));

                        setState(() {});
                      },
                      heroTag: 'search_voice',
                      backgroundColor:
                          recorder.isRecording ? Colors.red : Colors.blue,
                      child:
                          Icon(recorder.isRecording ? Icons.stop : Icons.mic),
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
