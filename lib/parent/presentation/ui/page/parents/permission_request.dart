// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

import '../../../../data/models/permission_model.dart';
import '../../../bloc/parent_bloc.dart';
import '../../../bloc/parent_event.dart';
import '../../../bloc/parent_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/title_page_two.dart';

List<PermissionRequesModel> permissionrequesclass = [];

class PermissionRequestStudentViewScreen extends StatefulWidget {
  @override
  _PermissionRequestScreenState createState() =>
      _PermissionRequestScreenState();
}

class _PermissionRequestScreenState
    extends State<PermissionRequestStudentViewScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentBloc, ParentState>(
      builder: (context, state) {
        if (state is LoadedStudentDataToParentPermissionState) {
          permissionrequesclass = state.permissionRequesModel;
        }
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 252, 252),
            appBar: AppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3),
              TitlePageTow(titlePage: 'طلب استئذان لطالب'),  

                 SizedBox(height: 4),
                WidgetListView(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _showAddPermissionDialog();
              },
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
          ),
        );
      },
    );
  }


  Widget WidgetListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: permissionrequesclass.length,
        itemBuilder: (context, index) {
          final notification = permissionrequesclass[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                color: notification.status
                    ? Color.fromARGB(255, 213, 241, 207)
                    : Color.fromARGB(255, 243, 243, 170),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  // leading: CircleAvatar(
                  //   backgroundColor: notification.iconBackgroundColor,
                  //   child: Icon(
                  //     notification.icon,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          notification.reason,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color:
                              notification.status ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          notification.status ? "مقبول" : "جار المعالجة...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        notification.message,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 8),
                      Text(
                        notification.date,
                        style: TextStyle(
                          color: Color.fromARGB(255, 222, 3, 3),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String reason = '';
        String description = '';

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('إضافة استئذان'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropDown(
                    items: ['مريض', 'مسافر', 'ضروف خاصة'],
                    hint: Text('اختر سبب الاستئذان'),
                    onChanged: (value) {
                      if (value != null) {
                        reason = value;
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: 'وصف الاستئذان'),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // إغلاق حوار الإضافة
                  },
                  child: Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () {
                    // إضافة الاستئذان إلى قائمة الاستئذانات
                    setState(() {
                      final now = DateTime.now();
                      final dateOnly = DateTime(now.year, now.month);
                      PermissionRequesModel newPermissionRequest =
                          PermissionRequesModel(
                        reason: reason,
                        message: description,
                        date: dateOnly.toString(),
                        status: false,
                      );

                      permissionrequesclass.add(newPermissionRequest);



                      BlocProvider.of<ParentBloc>(context).add(
                          AddPermissionToStudentEvent(
                              permissionRequesModel: newPermissionRequest));
                    });
                    Navigator.pop(context); // إغلاق حوار الإضافة
                  },
                  child: Text('إضافة'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
