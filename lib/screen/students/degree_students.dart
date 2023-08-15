import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DegreeTestStudentsClass {
  String name;
  double degree;
  int id;

  DegreeTestStudentsClass({
    required this.name,
    required this.degree,
    required this.id,
  });
}

class DegreeTestStudents extends StatefulWidget {
  @override
  State<DegreeTestStudents> createState() => _DegreeTestStudentsState();
}

class _DegreeTestStudentsState extends State<DegreeTestStudents> {
  List<DegreeTestStudentsClass> students = [
    DegreeTestStudentsClass(name: 'عبداللة بن سعيد', degree: 0.0, id: 19),
    DegreeTestStudentsClass(name: 'محمد العيساوي', degree: 0.0, id: 1),
    DegreeTestStudentsClass(name: 'مريم علي', degree: 0.0, id: 2),
    DegreeTestStudentsClass(name: 'زينب فارع', degree: 0.0, id: 3),
    DegreeTestStudentsClass(name: 'علي المقطري', degree: 0.0, id: 4),
    DegreeTestStudentsClass(name: 'فواد علي سالم', degree: 0.0, id: 5),
    DegreeTestStudentsClass(name: 'مريم القاسمي', degree: 0.0, id: 6),
    DegreeTestStudentsClass(name: 'عبدالله زين', degree: 0.0, id: 8),
    DegreeTestStudentsClass(name: 'سيف الحداد', degree: 0.0, id: 9),
  ];

  void showGradeInputDialog(
      BuildContext context, String studentName, int index) {
    double grade = 0.0; // قيمة افتراضية للدرجة

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    studentName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  // FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  print(value);
                  grade = double.tryParse(value) ?? 0.0;
                },
                decoration: InputDecoration(
                  hintText: 'أدخل الدرجة',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.end,
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
                        print("cancel");
                        Navigator.of(context).pop(); // إغلاق الـ dialog
                      },
                      child: Text(
                        'إلغاء',
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
                        print("accept");
                        print(grade);
                        setState(() {
                          students[index].degree =
                              grade; // تحديث درجة الطالب باستخدام الفهرس
                        });
                        Navigator.of(context).pop(); // إغلاق الـ dialog
                      },
                      child: Text(
                        'موافق',
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors,
     appBar: AppBar(

  title: Center(
    child: Text('وضع درجات الإختبار ',
    style: TextStyle(color: Colors.white),),
    ),
     leading: IconButton(
              iconSize: 40,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // context.pop(),
                 Navigator.of(context).pop();
              },
            ),
 
),
      body: Column(
        children: [
          titleBody(),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      showGradeInputDialog(
                          context, students[index].name, index);

                      // students[index].isPresent = !students[index].isPresent;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "الدرجة",
                                  style: TextStyle(
                                      // color: Colors.green,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  students[index].degree.toString(),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            students[index].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget titleBody() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 22, 153, 98),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ' اختبارات الصف الثالث ابتدائي',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'التربية الإسلامية',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (students.any((student) => student.degree != 0.0))
                FloatingActionButton(
                  onPressed: () {
                    List<DegreeTestStudentsClass> studentsWithDegree = students
                        .where((student) => student.degree != 0.0)
                        .toList();

                    for (var student in studentsWithDegree) {
                      print(
                          'Name: ${student.name}, Degree: ${student.degree}, ID: ${student.id}');
                    }
                  },
                  child: Icon(Icons.upload),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
