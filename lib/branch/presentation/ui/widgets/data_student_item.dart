import 'package:flutter/material.dart';
import 'package:flutter_design/branch/presentation/ui/branch/data_student_details_screen.dart';
import '../../../../base/constants/my_colors.dart';
import '../../../domain/entities/data_student.dart';

class DataStudentItem extends StatelessWidget {
  final DataStudent dataStudent;

  const DataStudentItem({Key? key, required this.dataStudent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CharacterDetailsScreen(dataStudent: dataStudent),
          ),
        ),
        child: GridTile(
          child: Hero(
            tag: dataStudent.id.toString(),
            child: Container(
              color: MyColors.myGrey,
              child: dataStudent.image.isNotEmpty
                  ?Image.asset(
                    width: double.infinity,
                      height: double.infinity,
                      dataStudent.image,
                      // placeholder: 'assets/images/loading.gif',
                      fit: BoxFit.cover,
                  ) 
                  
                  // FadeInImage.assetNetwork(
                  //     width: double.infinity,
                  //     height: double.infinity,
                  //     placeholder: 'assets/images/loading.gif',
                  //     image: dataStudent.image,
                  //     fit: BoxFit.cover,
                  //   )
                  : Image.asset('assets/school.jpg'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${dataStudent.name}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
