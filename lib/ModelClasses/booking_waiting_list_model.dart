class BookingWaitingListModel {
  String? message;
  bool? error;
  int? code;
  List<BookingWaitingListResults>? results;

  BookingWaitingListModel({this.message, this.error, this.code, this.results});

  BookingWaitingListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    code = json['code'];
    if (json['results'] != null) {
      results = <BookingWaitingListResults>[];
      json['results'].forEach((v) {
        results!.add(new BookingWaitingListResults.fromJson(v));
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

class BookingWaitingListResults {
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
  List<Null>? customeraddresses;
  Null? truck;

  BookingWaitingListResults(
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

  BookingWaitingListResults.fromJson(Map<String, dynamic> json) {
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

    truck = json['truck'];
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

    data['truck'] = this.truck;
    return data;
  }
}
