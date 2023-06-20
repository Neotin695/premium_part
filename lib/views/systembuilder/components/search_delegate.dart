// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/services/record_audio.dart';
import '../../../models/component_model.dart';
import '../pages/details_part_page.dart';

class MySearchDelegate extends SearchDelegate {
  final List<ComponentModel> components;
  final SystembuilderBloc bloc;
  final Components component;
  String resultAudio = '';
  MySearchDelegate(
    this.bloc,
    this.component, {
    required this.components,
    this.resultAudio = '',
  });

  final recorder  = RecordSearch();

  @override
  List<Widget>? buildActions(BuildContext context) {
    recorder.init();
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            recorder.dispose();
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results =
        components.where((element) => element.title.contains(query)).toList();
    query = resultAudio;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: results.length,
      itemBuilder: (_, index) {
        final part = bloc.handleDataTypes(component, results[index]);

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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ComponentModel> suggestion = components.where((e) {
      final title = e.title.toLowerCase();
      final input = query.toLowerCase();
      return title.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (_, index) {
        final component = suggestion[index];

        return ListTile(
          onTap: () {
            query = component.title;
          },
          title: Text(component.title),
        );
      },
    );
  }
}
