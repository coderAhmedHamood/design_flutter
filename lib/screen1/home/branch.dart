import 'package:flutter/material.dart';

List<Map<String, dynamic>> branches = [
  {
    'name': 'فرع 1',
    'location': 'الموقع 1',
'imagePath': 'assets/notification.png',  },
  {
    'name': 'فرع 2',
    'location': 'الموقع 2',
    'imagePath': 'assets/notification.png',
  },
  // Add more branches here
];

class BranchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفروع'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/notification.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: branches.length,
          itemBuilder: (context, index) {
            final branch = branches[index];

            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Image.asset(
                  branch['imagePath'],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                title: Text(branch['name']),
                subtitle: Text(branch['location']),
                onTap: () {
                  // Handle branch tap
                },
              ),
            );
          },
        ),
      ),
    );
  }
}