import 'package:cached_network_image/cached_network_image.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/shimmer/shimmer_grid_view.dart';
import 'package:system_shop/features/transactions/presentaion/cubit/transaction_cubit.dart';
import 'package:system_shop/features/transactions/presentaion/cubit/transaction_state.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionCubit>(
      create: (context) => TransactionCubit()..getAllSales(),
      child: BlocConsumer<TransactionCubit, TransactionStates>(
          listener: (context, state) {},
          builder: (context, state) {
            TransactionCubit cubit = TransactionCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/Rectangle 225@2x.png'))),
                    ),
                    // cubit.allSales.isEmpty
                    //     ? Center(
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Icon(Icons.share_location_sharp),
                    //             SizedBox(
                    //               height: 10.h,
                    //             ),
                    //             defaultText(
                    //                 txt: 'لا توجد اي مبيعات',
                    //                 fontSize: 14.sp,
                    //                 fontWeight: FontWeight.bold)
                    //           ],
                    //         ),
                    //       )
                    //     : 
                        Padding(
                            padding: EdgeInsets.only(
                                top: 80.h, left: 12.w, right: 12.w),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      defaultText(
                                        txt: 'جميع المعاملات',
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 550,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        // padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) => Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: double.infinity,
                                                  padding: EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      color: AppColors
                                                          .containerColor),
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0.h,
                                                                left: 15.w),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                defaultText(
                                                                    txt:'00000',
                                                                    //  cubit.allSales[index].price!
                                                                    //     .toStringAsFixed(
                                                                    //         2),
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize: 14
                                                                        .sp,
                                                                    fontWeight:
                                                                        FontWeight.bold),
                                                                defaultText(
                                                                    txt:'0000',
                                                                    fontSize: 12
                                                                        .sp,
                                                                    fontWeight:
                                                                        FontWeight.bold)
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 50.w,
                                                            ),
                                                            Column(
                                                              children: [
                                                                defaultText(
                                                                    txt:'0000',
                                                                    //  cubit
                                                                    //     .allSales[
                                                                    //         index]
                                                                    //     .clientName
                                                                    //     .toString(),
                                                                    fontSize: 16
                                                                        .sp,
                                                                    fontWeight:
                                                                        FontWeight.bold),
                                                                defaultText(
                                                                    txt: cubit
                                                                        .allSales[
                                                                            index]
                                                                        .companyName,
                                                                    fontSize: 12
                                                                        .sp,
                                                                    fontWeight:
                                                                        FontWeight.bold)
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Stack(
                                                        alignment: Alignment
                                                            .center,
                                                        children: [
                                                          Container(
                                                            height: 50.h,
                                                            width: 50.w,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        13),
                                                                color: AppColors
                                                                    .secandColor),
                                                          ),
                                                          Image.asset(
                                                              'assets/images/shopping bag.png')
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: 12,
                                            ),
                                        itemCount: 3),
                                  )
                                ],
                              ),
                            ),
                          )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
