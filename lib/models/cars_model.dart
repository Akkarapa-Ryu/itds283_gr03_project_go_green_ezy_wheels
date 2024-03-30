class CarsModel {
  String image;
  String name;
  String type;
  int rage;
  String seat;
  int dc;
  int? ac;
  String? superCharger;
  double priceHour;
  double priceDay;
  String brand;

  CarsModel(
      {required this.image,
      required this.name,
      required this.type,
      required this.rage,
      required this.seat,
      required this.dc,
      this.ac,
      this.superCharger,
      required this.priceHour,
      required this.priceDay,
      required this.brand});

  // static List<CarsModel> getCars() {

/*
    carsList.add(CarsModel(
        image: 'assets/images/Tesla model X.png',
        name: 'Tesla Model X',
        type: 'SUV',
        rage: 540,
        seat: '7',
        dc: 250,
        superCharger: 'Tesla Supercharger',
        priceHour: 19.09,
        priceDay: 190.00, brand: 'Tesla'));

    carsList.add(CarsModel(
        image: 'assets/images/Tesla model Y.png',
        name: 'Tesla Model S (LR)',
        type: 'Sedan',
        rage: 715,
        seat: '7',
        dc: 250,
        superCharger: 'Tesla Supercharger',
        priceHour: 21.09,
        priceDay: 210.00, brand: 'Tesla'));
      
      carsList.add(CarsModel(
        image: 'assets/images/BYD Seal RWD.png',
        name: 'BYD Seal RWD',
        type: 'Sedan',
        rage: 650,
        seat: '5',
        dc: 150,
        ac: 11,
        priceHour: 21.09,
        priceDay: 210.00, brand: 'BYD'));
           */

  //   return carsList;
  // }
}

final List<CarsModel> carsList = [
  CarsModel(
      image: 'assets/images/Tesla model X.png',
      name: 'Tesla Model X',
      type: 'SUV',
      rage: 540,
      seat: '7',
      dc: 250,
      superCharger: 'Tesla Supercharger',
      priceHour: 19.09,
      priceDay: 190.00,
      brand: 'Tesla'),
  CarsModel(
      image: 'assets/images/Tesla model Y.png',
      name: 'Tesla Model S (LR)',
      type: 'Sedan',
      rage: 715,
      seat: '7',
      dc: 250,
      superCharger: 'Tesla Supercharger',
      priceHour: 21.09,
      priceDay: 210.00,
      brand: 'Tesla'),
  CarsModel(
      image: 'assets/images/BYD Seal RWD.png',
      name: 'BYD Seal RWD',
      type: 'Sedan',
      rage: 650,
      seat: '5',
      dc: 150,
      ac: 11,
      priceHour: 21.09,
      priceDay: 210.00,
      brand: 'BYD')
];
