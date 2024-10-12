import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weather App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Developed by Ajeet Kumar'),
            SizedBox(height: 16),
            Text('© 2024 Weather App. All rights reserved.'),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}