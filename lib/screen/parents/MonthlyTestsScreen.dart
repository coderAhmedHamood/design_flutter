import 'package:flutter/material.dart';

class MonthlyTestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Tests'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Math Test'),
            subtitle: Text('Score: 85%'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to test details screen
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Science Test'),
            subtitle: Text('Score: 92%'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to test details screen
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('English Test'),
            subtitle: Text('Score: 78%'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to test details screen
            },
          ),
        ],
      ),
    );
  }
}