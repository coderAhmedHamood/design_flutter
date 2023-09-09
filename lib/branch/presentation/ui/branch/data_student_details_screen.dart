import 'package:flutter/material.dart';
import '../../../../base/constants/my_colors.dart';
import '../../../domain/entities/data_student.dart';
 
class CharacterDetailsScreen extends StatelessWidget {
  // final Character character = new Character();
  final DataStudent dataStudent;

  const CharacterDetailsScreen({Key? key, required this.dataStudent}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      characterInfo('الاسم : ', dataStudent.name),
                      buildDivider(315),
                      characterInfo(
                          'الصف: ', dataStudent.className),
                      buildDivider(250),
                      characterInfo('الترتيب : ',
                          dataStudent.numberOrder),
                      buildDivider(280),
                      
                      // character.betterCallSaulAppearance.isEmpty
                      1!=1
                          ? Container()
                          : characterInfo('كلمة المدرسة : ',
                              dataStudent.descrption),
                      1==1
                          ? Container()
                          : buildDivider(150),
                      
                      buildDivider(235),
                      SizedBox(
                        height: 20,
                      ),
                      // BlocBuilder<CharactersCubit, CharactersState>(
                      //   builder: (context, state) {
                      //     return checkIfQuotesAreLoaded(state);
                      //   },
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }




  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          dataStudent.name,
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: dataStudent.id.toString(),
          child: Image.asset(
            dataStudent.image,
           fit: BoxFit.cover,
           ),
          // child: Image.network(
          //   "character.image",
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Divider(
        height: 30,
        endIndent: endIndent,
        color: MyColors.myYellow,
        thickness: 2,
      ),
    );
  }

  // Widget checkIfQuotesAreLoaded(CharactersState state) {
  //   if (state is QuotesLoaded) {
  //     return displayRandomQuoteOrEmptySpace(state);
  //   } else {
  //     return showProgressIndicator();
  //   }
  // }

  // Widget displayRandomQuoteOrEmptySpace(state) {
  //   var quotes = (state).quotes;
  //   if (quotes.length != 0) {
  //     int randomQuoteIndex = Random().nextInt(quotes.length - 1);
  //     return Center(
  //       child: DefaultTextStyle(
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontSize: 20,
  //           color: MyColors.myWhite,
  //           shadows: [
  //             Shadow(
  //               blurRadius: 7,
  //               color: MyColors.myYellow,
  //               offset: Offset(0, 0),
  //             )
  //           ],
  //         ),
  //         child: AnimatedTextKit(
  //           repeatForever: true,
  //           animatedTexts: [
  //             FlickerAnimatedText(quotes[randomQuoteIndex].quote),
  //           ],
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }


}
