import 'package:flutter/material.dart';

class TitlePageTow extends StatelessWidget {
 final String titlePage;
  const TitlePageTow({super.key,required this.titlePage});

  @override
  Widget build(BuildContext context) {
      return  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    // height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 19, 194, 45),
                          // Color.fromARGB(255, 37, 179, 169),
                          Color.fromARGB(255, 4, 255, 209)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.9],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(84),
                        bottomRight: Radius.circular(84),
                        // topRight: Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 7),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          titlePage,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );           

  }
}