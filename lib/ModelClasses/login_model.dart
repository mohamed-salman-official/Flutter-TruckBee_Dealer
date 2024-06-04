class LogInModel {
  String? email;
  String? password;

  LogInModel({this.email, this.password});

  LogInModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null && email!.isNotEmpty) {
      data['email'] = email;
    }
    if (password != null && password!.isNotEmpty) {
      data['password'] = password;
    }
    return data;
  }
}

class UserData {
  UserDetails? user;
  int? role;
  String? token;

  UserData({this.user, this.role, this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserDetails.fromJson(json['user']) : null;
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}

class UserDetails {
  int? sId;
  dynamic id;
  String? name;
  String? dob;
  String? email;
  int? phone;
  int? emergencyNumber;
  String? gender;
  bool? isactive;
  String? supportexId;
  String? membershipId;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.sId,
      this.id,
      this.name,
      this.dob,
      this.email,
      this.phone,
      this.emergencyNumber,
      this.gender,
      this.isactive,
      this.supportexId,
      this.membershipId,
      this.createdAt,
      this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    sId = json['s_id'];
    id = json['id'];
    name = json['name'];
    dob = json['dob'];
    email = json['email'];
    phone = json['phone'];
    emergencyNumber = json['emergency_number'];
    gender = json['gender'];
    isactive = json['isactive'];
    supportexId = json['supportex_id'];
    membershipId = json['membership_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['emergency_number'] = this.emergencyNumber;
    data['gender'] = this.gender;
    data['isactive'] = this.isactive;
    data['supportex_id'] = this.supportexId;
    data['membership_id'] = this.membershipId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class ErrorModel {
  String? error;
  int? errorCode;
  String? errorMessage;
  ErrorsByField? errorsByField;
  Map<String, dynamic>? errorsByField1;
  String? errorDescription;
  String? result;
  bool? isError;

  ErrorModel(
      {this.error,
      this.errorCode,
      this.errorMessage,
      this.errorsByField,
      this.errorsByField1,
      this.errorDescription,
      this.result,
      this.isError});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    error = json['Error'];
    errorCode = json['code'];
    errorMessage = json['message'];
    errorsByField = json['errorsByField'] != null
        ? ErrorsByField.fromJson(json['errorsByField'])
        : null;
    if (json['errorsByField'] != null) {
      errorsByField1 = json['errorsByField'];
    }
    if (json['error_description'] != null) {
      errorDescription = json['error_description'];
    }
    if (json['result'] != null) {
      result = json['result'];
    }
    if (json['error'] != null) {
      isError = json['error'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = error;
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    if (errorsByField != null) {
      data['errorsByField'] = errorsByField!.toJson();
    }
    if (errorsByField1 != null) {
      data['errorsByField'] = errorsByField1;
    }
    if (errorDescription != null) {
      data['error_description'] = errorDescription;
    }
    if (result != null) {
      data['result'] = result;
    }
    if (isError != null) {
      data['error'] = isError;
    }
    return data;
  }
}

class ErrorsByField {
  String? fieldsUsername;
  String? fieldsPassword;

  ErrorsByField({this.fieldsUsername, this.fieldsPassword});

  ErrorsByField.fromJson(Map<String, dynamic> json) {
    fieldsUsername = json['fields/username'].toString();
    fieldsPassword = json['fields/password'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fields/username'] = fieldsUsername;
    data['fields/password'] = fieldsPassword;
    return data;
  }
}
