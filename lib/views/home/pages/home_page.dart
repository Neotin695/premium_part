import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/home/bloc/home_bloc.dart';
import 'package:permium_parts/views/home/views/home_view.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Premium Parts'),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            controller: tabController,
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            tabs: const [
              Text('Custom Builder'),
              Text('High-End Pc'),
              Text('Budget Pc '),
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => HomeBloc(),
          child: HomeView(tabController: tabController),
        ));
  }
}
