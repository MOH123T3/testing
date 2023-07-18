class LoginResponse {
  String? status;
  String? result;
  UserData? userData;
  String? token;
  String? message;

  LoginResponse(
      {this.status, this.result, this.userData, this.token, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    userData =
        json['userData'] != null ? UserData.fromJson(json['userData']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['result'] = result;
    if (userData != null) {
      data['userData'] = userData!.toJson();
    }
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}

class UserData {
  int? arogyaMitraId;
  String? name;
  String? mobileNo;
  String? email;
  String? status;
  int? gramId;
  String? gramName;
  String? address;

  UserData(
      {this.arogyaMitraId,
      this.name,
      this.mobileNo,
      this.email,
      this.status,
      this.gramId,
      this.gramName,
      this.address});

  UserData.fromJson(Map<String, dynamic> json) {
    arogyaMitraId = json['arogya_mitra_id'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    status = json['status'];
    gramId = json['gram_id'];
    gramName = json['gram_name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['arogya_mitra_id'] = arogyaMitraId;
    data['name'] = name;
    data['mobile_no'] = mobileNo;
    data['email'] = email;
    data['status'] = status;
    data['gram_id'] = gramId;
    data['gram_name'] = gramName;
    data['address'] = address;
    return data;
  }
}
