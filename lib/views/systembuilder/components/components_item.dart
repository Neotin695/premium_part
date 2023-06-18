import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:permium_parts/core/constances/api_const.dart';
import 'package:permium_parts/models/component_model.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';
import 'package:sizer/sizer.dart';

class ComponentsItem extends StatelessWidget {
  final ComponentModel basePartModel;
  final Components components;
  const ComponentsItem(
      {super.key, required this.basePartModel, required this.components});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 30.h,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.2.w),
          child: Column(
            children: [
              CachedNetworkImage(
                  height: 15.h,
                  fit: BoxFit.cover,
                  imageUrl:
                      '${ApiConst.baseUrlImage}/normal_user/image/${components.name}/${basePartModel.image}',
                  progressIndicatorBuilder: (_, url, don) {
                    return const CircularProgressIndicator();
                  }),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Text(
                  basePartModel.title,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
