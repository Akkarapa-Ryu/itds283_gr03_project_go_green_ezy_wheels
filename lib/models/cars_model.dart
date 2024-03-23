class CarsModel {
  String name;
  String type;
  int rage;
  String seat;
  int dc;
  int? ac;
  String? superCharger;
  double priceHour;
  double priceDay;
  CarsModel(
      {required this.name,
      required this.type,
      required this.rage,
      required this.seat,
      required this.dc,
      this.ac,
      this.superCharger,
      required this.priceHour,
      required this.priceDay});

  static List<CarsModel> getCars() {
    List<CarsModel> cars = [];

    cars.add(CarsModel(
        name: 'Tesla Model X',
        type: 'SUV',
        rage: 540,
        seat: '7',
        dc: 250,
        superCharger: 'Tesla Supercharger',
        priceHour: 19.09,
        priceDay: 190.00));

    cars.add(CarsModel(
        name: 'Tesla Model S (LR)',
        type: 'Sedan',
        rage: 715,
        seat: '7',
        dc: 250,
        superCharger: 'Tesla Supercharger',
        priceHour: 21.09,
        priceDay: 210.00));
      
      cars.add(CarsModel(
        name: 'BYD Seal RWD',
        type: 'Sedan',
        rage: 650,
        seat: '5',
        dc: 150,
        ac: 11,
        priceHour: 21.09,
        priceDay: 210.00));

    return cars;
  }
}
