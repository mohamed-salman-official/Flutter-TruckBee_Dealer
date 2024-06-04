class BookingDetailsModel {
  String? message;
  bool? error;
  int? code;
  BookingDetailsResults? results;

  BookingDetailsModel({this.message, this.error, this.code, this.results});

  BookingDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    code = json['code'];
    results = json['results'] != null
        ? new BookingDetailsResults.fromJson(json['results'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    data['code'] = this.code;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class BookingDetailsResults {
  int? sId;
  String? id;
  String? pickupLocation;
  String? dropoffLocation;
  int? totalkm;
  int? amount;
  String? pickupDate;
  String? transportMode;
  String? truckType;
  Null? truckSize;
  Null? notes;
  Null? isactive;
  String? status;
  String? customerId;
  String? dealerId;
  String? driverId;
  Null? truckId;
  String? garageId;
  Null? receiverId;
  Null? dropDate;
  String? createdAt;
  String? updatedAt;
  Dealer? dealer;
  Driver? driver;
  Null? truck;
  Null? customergarage;
  Customer? customer;
  List<Null>? customeraddresses;
  Null? receiver;

  BookingDetailsResults(
      {this.sId,
      this.id,
      this.pickupLocation,
      this.dropoffLocation,
      this.totalkm,
      this.amount,
      this.pickupDate,
      this.transportMode,
      this.truckType,
      this.truckSize,
      this.notes,
      this.isactive,
      this.status,
      this.customerId,
      this.dealerId,
      this.driverId,
      this.truckId,
      this.garageId,
      this.receiverId,
      this.dropDate,
      this.createdAt,
      this.updatedAt,
      this.dealer,
      this.driver,
      this.truck,
      this.customergarage,
      this.customer,
      this.customeraddresses,
      this.receiver});

  BookingDetailsResults.fromJson(Map<String, dynamic> json) {
    sId = json['s_id'];
    id = json['id'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    totalkm = json['totalkm'];
    amount = json['amount'];
    pickupDate = json['pickup_date'];
    transportMode = json['transport_mode'];
    truckType = json['truck_type'];
    truckSize = json['truck_size'];
    notes = json['notes'];
    isactive = json['isactive'];
    status = json['status'];
    customerId = json['customer_id'];
    dealerId = json['dealer_id'];
    driverId = json['driver_id'];
    truckId = json['truck_id'];
    garageId = json['garage_id'];
    receiverId = json['receiver_id'];
    dropDate = json['drop_date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    dealer =
        json['dealer'] != null ? new Dealer.fromJson(json['dealer']) : null;
    driver =
        json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    truck = json['truck'];
    customergarage = json['customergarage'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    receiver = json['receiver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_id'] = this.sId;
    data['id'] = this.id;
    data['pickup_location'] = this.pickupLocation;
    data['dropoff_location'] = this.dropoffLocation;
    data['totalkm'] = this.totalkm;
    data['amount'] = this.amount;
    data['pickup_date'] = this.pickupDate;
    data['transport_mode'] = this.transportMode;
    data['truck_type'] = this.truckType;
    data['truck_size'] = this.truckSize;
    data['notes'] = this.notes;
    data['isactive'] = this.isactive;
    data['status'] = this.status;
    data['customer_id'] = this.customerId;
    data['dealer_id'] = this.dealerId;
    data['driver_id'] = this.driverId;
    data['truck_id'] = this.truckId;
    data['garage_id'] = this.garageId;
    data['receiver_id'] = this.receiverId;
    data['drop_date'] = this.dropDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.dealer != null) {
      data['dealer'] = this.dealer!.toJson();
    }
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    data['truck'] = this.truck;
    data['customergarage'] = this.customergarage;

    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['receiver'] = this.receiver;
    return data;
  }
}

class Dealer {
  int? sId;
  String? id;
  String? name;
  int? phone;
  int? emergencyPhone;
  String? email;
  String? gstin;
  bool? isactive;
  String? supportexId;
  String? membershipId;
  String? offersId;
  int? rating;
  int? amount;
  int? count;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Dealer(
      {this.sId,
      this.id,
      this.name,
      this.phone,
      this.emergencyPhone,
      this.email,
      this.gstin,
      this.isactive,
      this.supportexId,
      this.membershipId,
      this.offersId,
      this.rating,
      this.amount,
      this.count,
      this.status,
      this.createdAt,
      this.updatedAt});

  Dealer.fromJson(Map<String, dynamic> json) {
    sId = json['s_id'];
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    emergencyPhone = json['emergency_phone'];
    email = json['email'];
    gstin = json['gstin'];
    isactive = json['isactive'];
    supportexId = json['supportex_id'];
    membershipId = json['membership_id'];
    offersId = json['offers_id'];
    rating = json['rating'];
    amount = json['amount'];
    count = json['count'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['emergency_phone'] = this.emergencyPhone;
    data['email'] = this.email;
    data['gstin'] = this.gstin;
    data['isactive'] = this.isactive;
    data['supportex_id'] = this.supportexId;
    data['membership_id'] = this.membershipId;
    data['offers_id'] = this.offersId;
    data['rating'] = this.rating;
    data['amount'] = this.amount;
    data['count'] = this.count;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Driver {
  int? sId;
  String? id;
  String? name;
  int? phone;
  String? email;
  String? license;
  String? licenseExp;
  String? insurance;
  String? insuranceExp;
  int? experience;
  int? emergencyNumber;
  bool? isactive;
  String? dealerId;
  String? supportexId;
  int? rating;
  String? createdAt;
  String? updatedAt;

  Driver(
      {this.sId,
      this.id,
      this.name,
      this.phone,
      this.email,
      this.license,
      this.licenseExp,
      this.insurance,
      this.insuranceExp,
      this.experience,
      this.emergencyNumber,
      this.isactive,
      this.dealerId,
      this.supportexId,
      this.rating,
      this.createdAt,
      this.updatedAt});

  Driver.fromJson(Map<String, dynamic> json) {
    sId = json['s_id'];
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    license = json['license'];
    licenseExp = json['license_exp'];
    insurance = json['insurance'];
    insuranceExp = json['insurance_exp'];
    experience = json['experience'];
    emergencyNumber = json['emergency_number'];
    isactive = json['isactive'];
    dealerId = json['dealer_id'];
    supportexId = json['supportex_id'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['license'] = this.license;
    data['license_exp'] = this.licenseExp;
    data['insurance'] = this.insurance;
    data['insurance_exp'] = this.insuranceExp;
    data['experience'] = this.experience;
    data['emergency_number'] = this.emergencyNumber;
    data['isactive'] = this.isactive;
    data['dealer_id'] = this.dealerId;
    data['supportex_id'] = this.supportexId;
    data['rating'] = this.rating;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Customer {
  int? sId;
  String? id;
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

  Customer(
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

  Customer.fromJson(Map<String, dynamic> json) {
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
