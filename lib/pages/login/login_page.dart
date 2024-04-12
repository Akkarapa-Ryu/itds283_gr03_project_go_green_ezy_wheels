import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            // Background image
            Image.asset(
              'assets/images/background1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      height: 110,
                      width: 110,
                    ),
                  ),
                  SizedBox(height: 10),

                  
                  Text(
                    'Go Green Ezy Wheels',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10.0),

                  
                  Text(
                    'Begin your journey to better driving clean!',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 55.0),

                  
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Continue With Phone Number'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white,
                      minimumSize: Size(275.0, 50.0),
                    ),
                  ),

                  SizedBox(height: 20.0),

                 
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google.jpg',
                      height: 24.0,
                      width: 24.0,
                    ),
                    label: Text('Sign in with Google'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white,
                      minimumSize: Size(275.0, 50.0),
                    ),
                  ),

                  SizedBox(height: 20.0),

                 
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/facebook.jpg',
                      height: 24.0,
                      width: 24.0,
                    ),
                    label: Text('Sign in with Facebook'),
                    
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white,
                      minimumSize: Size(275.0, 50.0),
                    ),
                  ),

                  SizedBox(height: 40.0),

                  
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),

                  
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign In'),
                    style: TextButton.styleFrom(
                       foregroundColor: Color.fromARGB(248, 141, 245, 155),
                        textStyle: TextStyle(
                        fontSize: 16.0,
    
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}