import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/models/case_model.dart';
import 'package:permium_parts/models/cooler_model.dart';
import 'package:permium_parts/models/cpu_model.dart';
import 'package:permium_parts/models/gpu_mdoel.dart';
import 'package:permium_parts/models/memories_model.dart';
import 'package:permium_parts/models/mother_board_model.dart';
import 'package:permium_parts/models/power_supplies_model.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';
import 'package:permium_parts/views/systembuilder/pages/all_parts_page.dart';
import 'package:sizer/sizer.dart';

import '../components/part_list_widget.dart';
import '../pages/details_part_page.dart';

class SystembuilderView extends StatelessWidget {
  const SystembuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystembuilderBloc, SystembuilderState>(
      listener: (context, state) {
        if (state is PartsLoadedSuccess) {
          Navigator.pop(context);

          CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              text: (state.parts[0] as CpuModel).title);
        } else if (state is PartsLoading) {
          CoolAlert.show(context: context, type: CoolAlertType.loading);
        } else if (state is PartsLoadedFailure) {
          Navigator.pop(context);
          CoolAlert.show(
              context: context, type: CoolAlertType.error, text: state.message);
        }
      },
      builder: (_, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    'Create A High Performance Pc',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  const Text(
                    'Premium Parts will help you to create a high-performance PC that meets your specific requirements',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  PartListView(
                    component: Components.cpus,
                    onItemPressed: (part) {
                      Navigator.pushNamed(context, DetailsPartPage.routeName,
                          arguments: part as CpuModel);
                    },
                    onViewAllPressed: () {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.cpus);
                    },
                  ),
                  PartListView(
                    component: Components.gpus,
                    onItemPressed: (part) {
                      Navigator.pushNamed(context, DetailsPartPage.routeName,
                          arguments: part as GpuModel);
                    },
                    onViewAllPressed: () {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.gpus);
                    },
                  ),
                  PartListView(
                    onItemPressed: (part) {
                      Navigator.pushNamed(context, DetailsPartPage.routeName,
                          arguments: part as MotherboardModel);
                    },
                    component: Components.motherboards,
                    onViewAllPressed: () {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.motherboards);
                    },
                  ),
                  PartListView(
                    component: Components.coolers,
                    onItemPressed: (part) {
                      Navigator.pushNamed(context, DetailsPartPage.routeName,
                          arguments: part as CoolerModel);
                    },
                    onViewAllPressed: () {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.coolers);
                    },
                  ),
                  PartListView(
                    component: Components.powersupplies,
                    onItemPressed: (part) {
                      Navigator.pushNamed(context, DetailsPartPage.routeName,
                          arguments: part as PowerSuppliesModel);
                    },
                    onViewAllPressed: () {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.powersupplies);
                    },
                  ),
                  PartListView(
                    component: Components.cases,
                    onItemPressed: (part) {
                      Navigator.pushNamed(context, DetailsPartPage.routeName,
                          arguments: part as CaseModel);
                    },
                    onViewAllPressed: () {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.cases);
                    },
                  ),
                  PartListView(
                    component: Components.memories,
                    onItemPressed: (part) {
                      Navigator.pushNamed(context, DetailsPartPage.routeName,
                          arguments: part as MemoriesModel);
                    },
                    onViewAllPressed: () {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.memories);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
