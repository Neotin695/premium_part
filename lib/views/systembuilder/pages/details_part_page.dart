import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/models/component_model.dart';

import '../../../models/case_model.dart';
import '../../../models/cooler_model.dart';
import '../../../models/cpu_model.dart';
import '../../../models/gpu_mdoel.dart';
import '../../../models/memories_model.dart';
import '../../../models/mother_board_model.dart';
import '../../../models/power_supplies_model.dart';
import '../../../models/storage_model.dart';
import '../bloc/systembuilder_bloc.dart';
import '../views/detailsviews/case_details_view.dart';
import '../views/detailsviews/cooler_details_view.dart';
import '../views/detailsviews/cpu_details_view.dart';
import '../views/detailsviews/gpu_details_view.dart';
import '../views/detailsviews/memory_details_view.dart';
import '../views/detailsviews/motherboard_details_view.dart';
import '../views/detailsviews/power_supplies_details_view.dart';
import '../views/detailsviews/storage_details_view.dart';

class DetailsPartPage extends StatelessWidget {
  static const String routeName = '/detailspage';
  const DetailsPartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final part = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text((part as ComponentModel).title),
      ),
      body: BlocProvider(
          create: (context) => SystembuilderBloc()
            ..add(
              HandleViewEvent(model: part),
            ),
          child: handleView(part)),
    );
  }

  Widget handleView(part) {
    if (part is CpuModel) {
      return CpuDetailsView(componentModel: part as CpuModel);
    } else if (part is GpuModel) {
      return GpuDetailsView(componentModel: part as GpuModel);
    } else if (part is MotherboardModel) {
      return MotherboardDetailsView(componentModel: part as MotherboardModel);
    } else if (part is MemoriesModel) {
      return MemoriesDetailsView(componentModel: part as MemoriesModel);
    } else if (part is CoolerModel) {
      return CoolerDetailsView(componentModel: part as CoolerModel);
    } else if (part is PowerSuppliesModel) {
      return PowerSuppliesDetailsView(
          componentModel: part as PowerSuppliesModel);
    } else if (part is StorageModel) {
      return StorageDetailsView(componentModel: part as StorageModel);
    } else if (part is CaseModel) {
      return CaseDetailsView(componentModel: part as CaseModel);
    }
    return const SizedBox();
  }
}
