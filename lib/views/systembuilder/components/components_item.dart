import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:permium_parts/models/component_model.dart';
import 'package:sizer/sizer.dart';

class ComponentsItem extends StatelessWidget {
  final ComponentModel basePartModel;
  const ComponentsItem({super.key, required this.basePartModel});

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
              Image.asset(
                'assets/images/placeholder.png',
                fit: BoxFit.cover,
              ),
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
