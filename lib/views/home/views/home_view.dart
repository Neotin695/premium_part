import 'package:flutter/material.dart';
import 'package:permium_parts/views/prebuiltpc/pages/budget_pc_page.dart';
import 'package:permium_parts/views/prebuiltpc/pages/high_end_pc_page.dart';

import '../../systembuilder/pages/systembuilder_page.dart';

class HomeView extends StatefulWidget {
  final TabController tabController;
  const HomeView({super.key, required this.tabController});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: const [
        SystembuilderPage(),
        HighEndPcPage(),
        BudgetPcPage(),
      ],
    );
  }
}
