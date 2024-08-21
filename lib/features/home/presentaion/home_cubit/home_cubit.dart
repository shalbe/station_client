import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/features/home/data/data_source/home_remote_data_source.dart';
import 'package:system_shop/features/home/data/model/add_fund.dart';
import 'package:system_shop/features/home/data/model/app_settings.dart';
import 'package:system_shop/features/home/data/model/cach_order.dart';
import 'package:system_shop/features/home/data/model/company_model.dart';
import 'package:system_shop/features/home/data/model/get_client_car.dart';
import 'package:system_shop/features/home/data/model/get_payment_order.dart';
import 'package:system_shop/features/home/data/model/latest_notifications.dart';
import 'package:system_shop/features/home/data/model/return_fund.dart';
import 'package:system_shop/features/home/data/model/scan_client.dart';
import 'package:system_shop/features/home/data/model/top_sales.dart';
import 'package:system_shop/features/home/data/model/total_shop_sales.dart';
import 'package:system_shop/features/home/data/model/user_profile.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:system_shop/features/home/presentaion/screens/home.dart';
import 'package:system_shop/features/home/presentaion/screens/not_found.dart';
import 'package:system_shop/features/home/presentaion/screens/user_data.dart';
import 'package:system_shop/features/home/presentaion/screens/write_user_number.dart';
import 'package:system_shop/main.dart';

class HomePageCubit extends Cubit<HomeState> {
  HomePageCubit() : super(IntitialHomeStates());
  static HomePageCubit get(context) => BlocProvider.of(context);
  List<MessageData> message = [];
  List<MessageData> AllMessage = [];
  List<CashorderData> cashOrder = [];
  List<CashorderData> debitOrder = [];
  List<PaymentOrderData> paymentOrder = [];
  List<ClientCarData> carData = [];
  List<CompanyData> companyList = [];
  UserProfile? userData;
  double count = 0.0;
  dynamic totalSales;

  dynamic totalSalesInDay = 0;
  dynamic totalSaless = 0;
  dynamic stillDebit = 0;
  dynamic allCashSales = 0;
  dynamic allCashSalesToDay = 0.0;
  dynamic allDebitSales = 0;
  dynamic allDebitSalesToDay = 0;
  dynamic allPayments = 0;
  dynamic allPaymentsToDay = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();

  AppSettings? appSettings;
//  User data

  getUserData() async {
    try {
      emit(GetUserDataLoading());
      var user = await HomeServices.getUserData();
      userData = user;
      emit(GetUserDataSucsses());
    } catch (e) {
      if (kDebugMode) {
        print('error');
        emit(GetUserDataError());
      }
    }
  }

  getSettingsData() async {
    try {
      emit(GetSettingsDataLoading());
      var data = await HomeServices.getSettingsData();
      appSettings = data;
      emit(GetSettingsDataSucsses());
    } catch (e) {
      if (kDebugMode) {
        print('error');
        emit(GetSettingsDataError());
      }
    }
  }

// total Shop Sales
  var dioHelper = DioHelper.instance;
  // getTotalShopSales() async {
  //   emit(GetTotalShopSalesLoading());
  //   dioHelper.get(endpoint: ApiUrls.TOP_SALES_URL).then((value) {
  //     totalSales = GetTotalShopSales.fromJson(value!.data);
  //     print(totalSales!.data);
  //     emit(GetTotalShopSalesSucsses());
  //   }).catchError((er) {
  //     print(er.toString());
  //     emit(GetTotalShopSalesError());
  //   });
  // }

  getLatestMessage() async {
    emit(GetlatestMessageLoading());
    var sales = await HomeServices.getLatestNotification();
    if (sales?.status == true) {
      message = sales?.data ?? [];
      emit(GetlatestMessageSucsses());
    } else if (sales?.status == false) {
      emit(GetlatestMessageError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getAllMessage() async {
    emit(GetAllMessageLoading());
    var sales = await HomeServices.getAllNotification();
    if (sales?.status == true) {
      AllMessage = sales?.data ?? [];
      emit(GetAllMessageSucsses());
    } else if (sales?.status == false) {
      emit(GetAllMessageError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getCashOrder() async {
    emit(GetCashOrderLoading());
    var sales = await HomeServices.getCashOrder();
    if (sales?.status == true) {
      cashOrder = sales?.data ?? [];
      emit(GetCashOrderSucsses());
    } else if (sales?.status == false) {
      emit(GetCashOrderError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getDebitOrder() async {
    emit(GetDebitOrderLoading());
    var sales = await HomeServices.getDebitOrder();
    if (sales?.status == true) {
      debitOrder = sales?.data ?? [];
      emit(GetDebitOrderSucsses());
    } else if (sales?.status == false) {
      emit(GetDebitOrderError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getPaymentOrder() async {
    emit(GetDebitOrderLoading());
    var sales = await HomeServices.getPaymentsOrder();
    if (sales?.status == true) {
      paymentOrder = sales?.data ?? [];
      emit(GetDebitOrderSucsses());
    } else if (sales?.status == false) {
      emit(GetDebitOrderError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getClientCar() async {
    emit(GetClientCarLoading());
    var sales = await HomeServices.getClientCar();
    if (sales?.status == true) {
      carData = sales?.data ?? [];
      emit(GetClientCarSucsses());
    } else if (sales?.status == false) {
      emit(GetClientCarError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getCompanyList() async {
    emit(GetlatestMessageLoading());
    var List = await HomeServices.getCompanyData();
    if (List?.status == true) {
      companyList = List?.data ?? [];
      print('companyList===============$companyList');
      emit(GetCompanySucsses());
    } else if (List?.status == false) {
      emit(GetCompanyError());
    } else {
      emit(GetCompanyFailed());
    }
  }

  int? clientId;
  ScanClientById? scanClientById;
  TextEditingController number = TextEditingController();
  scanByNumber() {
    var formData = FormData.fromMap({"number": number.text});
    emit(ScanByIdLoading());
    DioHelper.postData(path: ApiUrls.SCAN_CLIENT_URL, data: formData)
        .then((value) {
      scanClientById = ScanClientById.fromJson(value.data);

      getAllCashCount();
      getLatestMessage();
      getSettingsData();
      getCachInDayCount();
      getAllSalesCount();
      getStillDebitCount();
      getAllDebitInDayCount();
      getAllPaymentInDayCount();
      getAllPaymentCount();
      getClientCar();
      getAllDebitCount();
      getAllMessage();
      getCashOrder();
      getPaymentOrder();
      getDebitOrder();
      gettotalSalesToDayCount();
      number.clear();
      emit(ScanByIdSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(ScanByIdError());
    });
  }

  String? success;
  scan(id) {
    var formData = FormData.fromMap({"shop_id": id});
    emit(ScanByIdLoading());
    DioHelper.postData(path: ApiUrls.SCAN_URL, data: formData).then((value) {
      scanClientById = ScanClientById.fromJson(value.data);
      if (scanClientById!.status == true) {
        nextPage(context, UserData());
      } else {
        nextPage(context, ShopNotFount());
      }
      emit(ScanByIdSucsses());
    }).catchError((er) {
      print(er.toString());
      nextPage(context, ShopNotFount());
      emit(ScanByIdError());
    });
  }

  AddFund? addFund;
  TextEditingController price = TextEditingController();

  loadData() async {
    await getUserData();
    await getLatestMessage();
    await getAllCashCount();
    await getCachInDayCount();
    await getAllSalesCount();
    await getStillDebitCount();
    await getAllDebitInDayCount();
    await getAllPaymentInDayCount();
    await getAllPaymentCount();
    await getAllDebitCount();
    await gettotalSalesToDayCount();
    // await getTopSales();
    emit(GetPartenerSucsses());
  }

  // ReturnFund? returnFund;
  // addReturnFund({
  //   int? clientId,
  //   int? companyId,
  // }) {
  //   var formData = FormData.fromMap(
  //       {"price": price.text, "shop_id": clientId, "company_id": companyId});
  //   emit(ReturnFundLoading());
  //   DioHelper.postData(path: ApiUrls.RETURN_FUND_URL, data: formData)
  //       .then((value) {
  //     returnFund = ReturnFund.fromJson(value.data);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: defaultText(txt: returnFund?.msg.toString())));
  //     getTopSales();
  //     emit(ReturnFundSucsses());
  //   }).catchError((er) {
  //     print(er.toString());
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: defaultText(txt: 'هناك خطآ')));
  //     emit(ReturnFundError());
  //   });
  // }

  Future getAllSalesCount() async {
    emit(GetOrderCountLoading());
    DioHelper.getData(path: ApiUrls.All_SALES_URL).then((value) {
      totalSaless = value.data['data'] ?? 0.0;
      emit(GetOrderCountSucsess());
    }).catchError((er) {
      print(er.toString());
      emit(GetOrderCountError());
    });
  }

  Future gettotalSalesToDayCount() async {
    emit(GetOrderCountLoading());
    DioHelper.getData(path: ApiUrls.All_SALES_TO_DAY_URL).then((value) {
      totalSalesInDay = value.data['data'] ?? 0.0;
      emit(GetOrderCountSucsess());
    }).catchError((er) {
      print(er.toString());
      emit(GetOrderCountError());
    });
  }

  Future getStillDebitCount() async {
    emit(GetOrderCountLoading());
    DioHelper.getData(path: ApiUrls.STILL_DEBIT_URL).then((value) {
      stillDebit = value.data['data'] ?? 0.0;
      emit(GetOrderCountSucsess());
    }).catchError((er) {
      print(er.toString());
      emit(GetOrderCountError());
    });
  }

  Future getAllCashCount() async {
    emit(GetOrderCountLoading());
    DioHelper.getData(path: ApiUrls.ALL_CASH_SALES_URL).then((value) {
      if (value.statusCode == 200) {
        allCashSales = value.data['data'] ?? 0.0;
        emit(GetOrderCountSucsess());
      }
    }).catchError((er) {
      print(er.toString());
      emit(GetOrderCountError());
    });
  }

  Future getCachInDayCount() async {
    emit(GetOrderCountLoading());

    DioHelper.getData(path: ApiUrls.ALL_CASH_SALES_TO_DAY_URL).then((value) {
      if (value.statusCode == 200) {
        log('=================================${value.data}');
        allCashSalesToDay = value.data['data'] ?? 0.0;
        emit(GetOrderCountSucsess());
      }
    }).catchError((er) {
      print(er.toString());
      emit(GetOrderCountError());
    });
    // var total =
    //     await HomeServices.getOrderCountData(ApiUrls.ALL_CASH_SALES_TO_DAY_URL);
    // if (total?.status == true) {
    //   allCashSalesToDay = (total?.data ?? 0).toDouble();
    //   emit(GetOrderCountSucsess());
    // } else if (total?.status == false) {
    //   emit(GetOrderCountError());
    // } else {
    //   emit(GetOrderCountfailed());
    // }
  }

  Future getAllDebitCount() async {
    emit(GetOrderCountLoading());

    DioHelper.getData(path: ApiUrls.ALL_DEBIT_SALES_URL).then((value) {
      if (value.statusCode == 200) {
        allDebitSales = value.data['data'] ?? 0.0;
        emit(GetOrderCountSucsess());
      }
    }).catchError((er) {
      print(er.toString());
      emit(GetOrderCountError());
    });
  }

  Future getAllDebitInDayCount() async {
    emit(GetOrderCountLoading());

    DioHelper.getData(path: ApiUrls.ALL_DEBIT_SALES_TO_DAY_URL).then((value) {
      if (value.statusCode == 200) {
        allDebitSalesToDay = value.data['data'] ?? 0.0;
        emit(GetOrderCountSucsess());
      }
    }).catchError((er) {
      print(er.toString());
      emit(GetOrderCountfailed());
    });
  }

  Future getAllPaymentCount() async {
    emit(GetOrderCountLoading());
    DioHelper.getData(path: ApiUrls.ALL_PAYMENTS_URL).then((value) {
      if (value.statusCode == 200) {
        allPayments = value.data['data'] ?? 0.0;
        emit(GetOrderCountSucsess());
      }
    }).catchError((er) {
      print(er.toString());
      emit(GetOrderCountError());
    });
  }

  Future getAllPaymentInDayCount() async {
    emit(GetOrderCountLoading());

    DioHelper.getData(path: ApiUrls.ALL_PAYMENTS_TO_DAY_URL).then((value) {
      if (value.statusCode == 200) {
        allPaymentsToDay = value.data['data'] ?? 0.0;
        emit(GetOrderCountSucsess());
      }
    }).catchError((er) {
      print(er.toString());
      emit(GetOrderCountfailed());
    });
  }
}
