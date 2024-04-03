import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 15,
            endIndent: 230,
            thickness: 4,
            color: const Color.fromARGB(255, 88, 255, 82),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 17, right: 17, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Go Green Ezy Wheels is a leading electric car rental company committed to providing a new way of traveling that is convenient, healthy, and environmentally friendly.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 150),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.amber,
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {},
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text('Next')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
