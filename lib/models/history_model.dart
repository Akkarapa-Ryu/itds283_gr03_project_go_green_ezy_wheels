class HistoryModel {
  HistoryModel(
      {this.idH = '',
      required this.id,
      required this.phone,
      required this.fname,
      required this.lname,
      required this.email,
      required this.thumbnail,
      required this.title,
      required this.type,
      required this.priceHour,
      required this.priceDay,
      required this.brand,
      required this.locationMessage,
      required this.startDate,
      required this.endDate});

  String idH;

  final String id;
  final String phone;
  final String fname;
  final String lname;
  final String email;

  final String thumbnail;
  final String title; // name's car
  final String type; // type,
  final num priceHour;
  final num priceDay;
  final String brand;

  final String locationMessage;
  final String startDate;
  final String endDate;


    Map<String, dynamic> toJson() => {
      "idH": idH,
        "id": id,
        "phone": phone,
        "fname": fname,
        "lname": lname,
        "email": email,
        "thumbnail": thumbnail,
        "title": title,
        "type": type,
        "priceHour": priceHour,
        "priceDay": priceDay,
        "brand": brand,
        "locationMessage": locationMessage,
        "startDate": startDate,
        "endDate": endDate
      };
}
