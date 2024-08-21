import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home/data/componant/controller_container.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:system_shop/features/home_page/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/main.dart';

BuildContext context = MyApp.navKey.currentState!.context;

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 50.h, left: 12.w, right: 12.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.construction_outlined),
                              SizedBox(
                                width: 10.w,
                              ),
                              defaultText(
                                  txt: 'لوحة التحكم',
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                pop(context);
                              },
                              child: Icon(Icons.arrow_forward))
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 170.w,
                              padding: EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: AppColors.buttonGreenColor),
                              child: Center(
                                child: Column(
                                  children: [
                                    defaultText(
                                      txt: 'اجمالي المعاملات اليوم',
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    defaultText(
<<<<<<< HEAD
                                      txt: cubit.totalSalesInDay.toString(),
=======
                                      txt: cubit.totalSalesInDay
                                          .toStringAsFixed(2),
>>>>>>> 1b8c006 (file)
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: Container(
                              width: 170.w,
                              padding: EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.orangeAccent),
                              child: Center(
                                child: Column(
                                  children: [
                                    defaultText(
                                      txt: 'اجمالي مبيعات اليوم نقدي',
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    defaultText(
<<<<<<< HEAD
                                      txt: cubit.allCashSalesToDay.toString(),
=======
                                      txt: cubit.allCashSalesToDay
                                          .toStringAsFixed(2),
>>>>>>> 1b8c006 (file)
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
<<<<<<< HEAD
                        height: 50.h,
=======
                        height: 20.h,
>>>>>>> 1b8c006 (file)
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ControllerContainer(
<<<<<<< HEAD
                              title: cubit.totalSaless.toString(),
=======
                              title: cubit.totalSaless.toStringAsFixed(2),
>>>>>>> 1b8c006 (file)
                              txt: 'اجمالي المعاملات ',
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: ControllerContainer(
<<<<<<< HEAD
                              title: cubit.allCashSales.toString(),
=======
                              title: cubit.allCashSales.toStringAsFixed(2),
>>>>>>> 1b8c006 (file)
                              txt: 'اجمالي المبيعات نقدي',
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ControllerContainer(
<<<<<<< HEAD
                              title: cubit.allDebitSales.toString(),
=======
                              title: cubit.allDebitSales.toStringAsFixed(2),
>>>>>>> 1b8c006 (file)
                              txt: 'اجمالي المبيعات بالدين',
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: ControllerContainer(
<<<<<<< HEAD
                              title: cubit.allPayments.toString(),
=======
                              title: cubit.allPayments.toStringAsFixed(2),
>>>>>>> 1b8c006 (file)
                              txt: 'اجمالي تسديد الدين',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ControllerContainer(
<<<<<<< HEAD
                              title: cubit.stillDebit.toString(),
=======
                              color: AppColors.buttonRedColor,
                              title: cubit.stillDebit.toStringAsFixed(2),
>>>>>>> 1b8c006 (file)
                              txt: 'اجمالي المديونيه المتبقيه ',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
<<<<<<< HEAD
                        height: 50.h,
=======
                        height: 20.h,
>>>>>>> 1b8c006 (file)
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 170.w,
                              padding: EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: AppColors.buttonGreenColor),
                              child: Center(
                                child: Column(
                                  children: [
                                    defaultText(
                                      txt: 'اجمالي مبيعات اليوم بالدين',
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    defaultText(
<<<<<<< HEAD
                                      txt: cubit.allDebitSalesToDay.toString(),
=======
                                      txt: cubit.allDebitSalesToDay
                                          .toStringAsFixed(2),
>>>>>>> 1b8c006 (file)
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: Container(
                              width: 170.w,
                              padding: EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.orangeAccent),
                              child: Center(
                                child: Column(
                                  children: [
                                    defaultText(
                                      txt: 'اجمالي تسديد الدين اليوم ',
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    defaultText(
<<<<<<< HEAD
                                      txt: cubit.allPaymentsToDay.toString(),
=======
                                      txt: cubit.allPaymentsToDay
                                          .toStringAsFixed(2),
>>>>>>> 1b8c006 (file)
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
