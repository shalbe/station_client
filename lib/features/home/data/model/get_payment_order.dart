class GetPaymentsOrder {
  bool? status;
  String? num;
  String? msg;
  List<PaymentOrderData>? data;

  GetPaymentsOrder({this.status, this.num, this.msg, this.data});

  GetPaymentsOrder.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <PaymentOrderData>[];
      json['data'].forEach((v) {
        data!.add(new PaymentOrderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Num'] = this.num;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentOrderData {
  int? id;
  int? amount;
  String? carNumber;
  String? date;
  int? clientId;
  String? clientName;
  String? clientNumber;
  dynamic employeeId;
  String? employeeName;
  int? userId;
  String? userName;

  PaymentOrderData(
      {this.id,
      this.amount,
      this.carNumber,
      this.clientNumber,
      this.date,
      this.clientId,
      this.clientName,
      this.employeeId,
      this.employeeName,
      this.userId,
      this.userName});

  PaymentOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    carNumber = json['car_number'];
    clientNumber = json['client_number'];
    date = json['date'];
    clientId = json['client_id'];
    clientName = json['client_name'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    userId = json['user_id'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['car_number'] = this.carNumber;
    data['client_number'] = this.clientNumber;
    data['date'] = this.date;
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    return data;
  }
}
