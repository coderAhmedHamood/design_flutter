import 'package:flutter/material.dart';

class GradeInputDialogScreen extends StatefulWidget {
  final String studentName;

  const GradeInputDialogScreen({
    required this.studentName,
  });

  @override
  _GradeInputDialogScreenState createState() => _GradeInputDialogScreenState();
}

class _GradeInputDialogScreenState extends State<GradeInputDialogScreen> {
  late String selectedBehaviour = 'مشاغب'; // القيمة المختارة
  final GlobalKey<FormState> _formKeyTitle = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyMessage = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  // @override
  // void initState() {
  //   super.initState();
  //   selectedBehaviour = 'مشاغب'; // القيمة المختارة الافتراضية
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.studentName,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.red,
                  child: Column(
                    children: [
                      RadioListTile(
                        title: Text('جيد'),
                        value: 'جيد',
                        groupValue: selectedBehaviour,
                        onChanged: (value) {
                          setState(() {
                            selectedBehaviour = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text('مؤدب'),
                        value: 'مؤدب',
                        groupValue: selectedBehaviour,
                        onChanged: (value) {
                          setState(() {
                            selectedBehaviour = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.green,
                  child: Column(
                    children: [
                      RadioListTile(
                        title: Text('مزعح'),
                        value: 'مزعح',
                        groupValue: selectedBehaviour,
                        onChanged: (value) {
                          setState(() {
                            selectedBehaviour = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text('مشاغب'),
                        value: 'مشاغب',
                        groupValue: selectedBehaviour,
                        onChanged: (value) {
                          setState(() {
                            selectedBehaviour = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(

                    child: Form(
                  key: _formKeyTitle,
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'العنوان',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى إدخال العنوان';
                      }
                      return null;
                    },
                  ),
                ),
                
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
            
                child: Form(
                  key: _formKeyMessage,
                  child: TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'الرسالة',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى إدخال الرسالة';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
                child: TextButton(
                  onPressed: () {
                     Navigator.of(context)
                        .pop(null); // إغلاق الـ dialog مع قيمة رجوع خالية
                  },
                  child: Text(
                    'الغاء', // إلغاء
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: TextButton(
                  onPressed: () {
                    if (_formKeyTitle.currentState!.validate() &&
                        _formKeyMessage.currentState!.validate()) {
                      Navigator.of(context).pop(
                          [selectedBehaviour,_titleController.text,_messageController.text]
                          );
                    }
                  },
          
                  child: Text(
                    'موافق', // إرسال
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
