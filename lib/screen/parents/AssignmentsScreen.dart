import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignments'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Math Assignment'),
            subtitle: Text('Due Date: 15th August 2023'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to assignment details screen
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Science Assignment'),
            subtitle: Text('Due Date: 20th August 2023'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to assignment details screen
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('English Assignment'),
            subtitle: Text('Due Date: 25th August 2023'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to assignment details screen
            },
          ),
        ],
      ),
    );
  }
}