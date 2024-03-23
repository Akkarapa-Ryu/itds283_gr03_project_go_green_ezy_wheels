import 'package:flutter/material.dart';
import '../../pages/pages.dart';
import '../../theme/theme.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  List<CarsModel> cars = [];

  void _getCars() {
    cars = CarsModel.getCars();
  }

  @override
  void initState() {
    _getCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Car List',
          style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w700),
        )),
        body: SingleChildScrollView(
          child: Center(
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(3),
                itemCount: cars.length,
                itemBuilder: _carCard),
          ),
        ));
  }

  Widget? _carCard(context, index) {
    return Card(
        elevation: 3,
        margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        shadowColor: DesignSystem.c0,
        child: CustomListTile(
          thumbnail: Container(
            height: 90,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DesignSystem.disable),
          ),
          title: cars[index].name,
          type: cars[index].type,
          dc: cars[index].dc,
          supercharge: cars[index].superCharger,
          ac: cars[index].ac,
          priceHour: cars[index].priceHour,
          priceDay: cars[index].priceDay,
          rage: cars[index].rage,
          seat: cars[index].seat,
        ));
  }
}

// https://api.flutter.dev/flutter/material/ListTile-class.html
class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.thumbnail,
      required this.title,
      required this.type,
      required this.dc,
      this.ac,
      this.supercharge,
      required this.priceHour,
      required this.priceDay,
      required this.rage,
      required this.seat});

  final Widget thumbnail;
  final String title; // name's car
  final String type; // type,
  final int rage;
  final String seat;
  final int dc; // dc
  final int? ac;
  final String? supercharge;
  final double priceHour;
  final double priceDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        height: 130,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      thumbnail,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text('$priceHour / Hour'),
                          Text('$priceDay / Day'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(title,style: TextStyle(fontFamily: DesignSystem.fontFamily,fontWeight: FontWeight.bold,fontSize: 15),),
                        Row(
                          children: [
                            Text('Type: $type  Rage: $rage  Seat: $seat',style: TextStyle(fontFamily: DesignSystem.fontFamily,fontWeight: FontWeight.w500,fontSize: 11),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('DC: $dc Kw/H',style: TextStyle(fontFamily: DesignSystem.fontFamily,fontWeight: FontWeight.w500,fontSize: 11),),
                            superchargeORac(supercharge, ac)
                          ],
                        ),
                        ElevatedButton(onPressed: (){}, child: Text('Select'))
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  superchargeORac(supercharge, ac) {
    if (supercharge != null) {
      return Text(' ($supercharge)',style: TextStyle(fontFamily: DesignSystem.fontFamily,fontWeight: FontWeight.w500,fontSize: 11),);
    } else if (ac != null) {
      return Text('  AC: ' + ac.toString() + 'Kw/H',style: TextStyle(fontFamily: DesignSystem.fontFamily,fontWeight: FontWeight.w500,fontSize: 11),);
    }
  }
}
