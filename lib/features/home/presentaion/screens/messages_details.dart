import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home/data/componant/get_message.dart';
import 'package:system_shop/features/home/data/model/latest_notifications.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';

class MessageDetails extends StatelessWidget {
  MessageData? data;
   MessageDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 50.h, left: 12.w, right: 12.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                        ),
                      ),
                      defaultText(
                          txt: ' تفاصيل الرساله',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GetMessage(data: data,)
                ],
              ),
            ),
          );
        });
  }
}
