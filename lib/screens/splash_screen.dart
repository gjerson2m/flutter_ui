import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/imgs/img_main.png'),
            Column(
              children: [
                Text(
                  'Job hunting',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'made easy',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            MaterialButton(
              elevation: 10,
              minWidth: 170,
              height: 50,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/main');
              },
            )
          ],
        ),
      ),
    );
  }
}
