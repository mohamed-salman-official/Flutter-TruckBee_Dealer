class BookingConfirmedListModel {
  String? message;
  bool? error;
  int? code;
  List<BookingConfirmedListResults>? results;

  BookingConfirmedListModel(
      {this.message, this.error, this.code, this.results});

  BookingConfirmedListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    code = json['code'];
    if (json['results'] != null) {
      results = <BookingConfirmedListResults>[];
      json['results'].forEach((v) {
        results!.add(new BookingConfirmedListResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    data['code'] = this.code;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingConfirmedListResults {
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
  String? truckId;
  String? garageId;
  Null? receiverId;
  Null? dropDate;
  String? createdAt;
  String? updatedAt;
  List<Null>? customeraddresses;
  Truck? truck;

  BookingConfirmedListResults(
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
      this.customeraddresses,
      this.truck});

  BookingConfirmedListResults.fromJson(Map<String, dynamic> json) {
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
    // if (json['customeraddresses'] != null) {
    //   customeraddresses = <Null>[];
    //   json['customeraddresses'].forEach((v) {
    //     customeraddresses!.add(new Null.fromJson(v));
    //   });
    // }
    truck = json['truck'] != null ? new Truck.fromJson(json['truck']) : null;
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
    // if (this.customeraddresses != null) {
    //   data['customeraddresses'] =
    //       this.customeraddresses!.map((v) => v.toJson()).toList();
    // }
    if (this.truck != null) {
      data['truck'] = this.truck!.toJson();
    }
    return data;
  }
}

class Truck {
  int? sId;
  String? id;
  String? name;
  String? type;
  String? regNo;
  String? insuranceNumber;
  String? insuranceExp;
  int? manufacturingYear;
  String? maxLoadWeight;
  String? ownerName;
  String? bodyLength;
  String? bodyWidth;
  String? bodyHeight;
  String? permit;
  String? permitState;
  String? dealerId;
  String? amtFor1st25kms;
  String? amtForAfter25kms;
  bool? isactive;
  Null? supportexId;
  String? createdAt;
  String? updatedAt;

  Truck(
      {this.sId,
      this.id,
      this.name,
      this.type,
      this.regNo,
      this.insuranceNumber,
      this.insuranceExp,
      this.manufacturingYear,
      this.maxLoadWeight,
      this.ownerName,
      this.bodyLength,
      this.bodyWidth,
      this.bodyHeight,
      this.permit,
      this.permitState,
      this.dealerId,
      this.amtFor1st25kms,
      this.amtForAfter25kms,
      this.isactive,
      this.supportexId,
      this.createdAt,
      this.updatedAt});

  Truck.fromJson(Map<String, dynamic> json) {
    sId = json['s_id'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    regNo = json['reg_no'];
    insuranceNumber = json['insurance_number'];
    insuranceExp = json['insurance_exp'];
    manufacturingYear = json['manufacturing_year'];
    maxLoadWeight = json['max_load_weight'];
    ownerName = json['owner_name'];
    bodyLength = json['body_length'];
    bodyWidth = json['body_width'];
    bodyHeight = json['body_height'];
    permit = json['permit'];
    permitState = json['permit_state'];
    dealerId = json['dealer_id'];
    amtFor1st25kms = json['amt_for_1st_25kms'];
    amtForAfter25kms = json['amt_for_after_25kms'];
    isactive = json['isactive'];
    supportexId = json['supportex_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['reg_no'] = this.regNo;
    data['insurance_number'] = this.insuranceNumber;
    data['insurance_exp'] = this.insuranceExp;
    data['manufacturing_year'] = this.manufacturingYear;
    data['max_load_weight'] = this.maxLoadWeight;
    data['owner_name'] = this.ownerName;
    data['body_length'] = this.bodyLength;
    data['body_width'] = this.bodyWidth;
    data['body_height'] = this.bodyHeight;
    data['permit'] = this.permit;
    data['permit_state'] = this.permitState;
    data['dealer_id'] = this.dealerId;
    data['amt_for_1st_25kms'] = this.amtFor1st25kms;
    data['amt_for_after_25kms'] = this.amtForAfter25kms;
    data['isactive'] = this.isactive;
    data['supportex_id'] = this.supportexId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
