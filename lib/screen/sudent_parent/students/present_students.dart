import 'package:flutter/material.dart';
 

class PreparingStudentsClass {
  String name;
  bool isPresent;
  bool isSick;
  int id;

  PreparingStudentsClass({
    required this.name,
    required this.isPresent,
    required this.isSick,
    required this.id,
  });
}

class PreparingStudentsScreen extends StatefulWidget {
  @override
  State<PreparingStudentsScreen> createState() => _PreparingStudentsState();
}

class _PreparingStudentsState extends State<PreparingStudentsScreen> {
  List<PreparingStudentsClass> students = [
    PreparingStudentsClass(
        name: 'عبداللة بن سعيد', isPresent: false, isSick: false, id: 19),
    PreparingStudentsClass(
        name: 'محمد العيساوي', isPresent: false, isSick: false, id: 1),
    PreparingStudentsClass(
        name: 'مريم علي', isPresent: false, isSick: false, id: 2),
    PreparingStudentsClass(
        name: 'زينب فارع', isPresent: false, isSick: false, id: 3),
    PreparingStudentsClass(
        name: 'علي المقطري', isPresent: false, isSick: false, id: 4),
    PreparingStudentsClass(
        name: 'فواد علي سالم', isPresent: false, isSick: false, id: 5),
    PreparingStudentsClass(
        name: 'مريم القاسمي', isPresent: false, isSick: false, id: 6),
    PreparingStudentsClass(
        name: 'عبدالله زين', isPresent: false, isSick: false, id: 8),
    PreparingStudentsClass(
        name: 'سيف الحداد', isPresent: false, isSick: false, id: 9),
  ];

  bool isAllPresent = false;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          // backgroundColor: Colors,
          appBar: AppBar(
            title: Center(
              child: Text(
                'تحضير الطلاب يوم الثلاثاء',
                style: TextStyle(color: Colors.white),
              ),
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
              // SizedBox(height: 50,),
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
                          // students[index].isPresent = !students[index].isPresent;
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                                      "م",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      //  checkColor: Colors.white,
                                      value: students[index].isSick,
                                      onChanged: (value) {
                                        setState(() {
                                          students[index].isSick = value!;
                                          students[index].isPresent = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "ح",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: students[index].isPresent,
                                      onChanged: (value) {
                                        setState(() {
                                          students[index].isPresent = value!;
                                          students[index].isSick = false;
                                        });
                                      },
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
            'تحضير الصف الثالث ابتدائي',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    for (var student in students) {
                      student.isPresent = !isAllPresent;
                      student.isSick = false;
                    }
                    isAllPresent = !isAllPresent;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isAllPresent
                        ? Colors.green
                        : Color.fromARGB(255, 0, 118, 214),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        isAllPresent ? 'إلغاء' : 'تحديد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        isAllPresent
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              if (students.any((student) => student.isPresent))
                FloatingActionButton(
                  onPressed: () {
                    List<String> presentStudents = students
                        .where((student) => student.isPresent)
                        .map((student) => student.name)
                        .toList();

                    print(presentStudents);
                  },
                  child: Icon(Icons.upload),
                ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
