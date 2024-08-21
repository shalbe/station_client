class GetOrderCountData {
  bool? status;
  String? num;
  String? msg;
  int? data;

  GetOrderCountData({this.status, this.num, this.msg, this.data});

  GetOrderCountData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Num'] = this.num;
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
