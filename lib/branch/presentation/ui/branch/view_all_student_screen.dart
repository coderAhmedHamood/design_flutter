import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_design/branch/presentation/bloc/branch/branch_bloc.dart';
import '../../../../base/constants/my_colors.dart';
import '../../../domain/entities/data_student.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../widgets/data_student_item.dart';

import 'package:colorful_background/colorful_background.dart';
import 'package:animated_background/animated_background.dart';

class ViewAllDataStudentScreen extends StatefulWidget {
  const ViewAllDataStudentScreen({Key? key}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<ViewAllDataStudentScreen>
    with TickerProviderStateMixin {
  late List<DataStudent> allCharacters;
  late List<DataStudent> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: MyColors.myGrey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myYellow,
          // leading:
          // _isSearching
          //     ? BackButton(
          //         color: MyColors.myGrey,
          //       )
          //     : Container(),
          title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
          actions: _buildAppBarActions(),
        ),
//       body:AnimatedBackground(
//   behaviour: RandomParticleBehaviour(
//     options: ParticleOptions(
//       baseColor: Colors.blue,
//       spawnOpacity: 0.0,
//       opacityChangeRate: 0.25,
//       minOpacity: 0.1,
//       maxOpacity: 0.4,
//       spawnMinSpeed: 30.0,
//       spawnMaxSpeed: 70.0,
//       spawnMinRadius: 7.0,
//       spawnMaxRadius: 55.0,
//       particleCount: 40,
//     ),
//   ),
//   vsync: this,
//  child:  buildBlocWidget()
// ),
        body: buildBlocWidget()
//       body:
// ColorfulBackground(
//   duration: Duration(milliseconds: 1000),
//   backgroundColors: [
//     const Color(0xFFFF5ACD),
//     const Color(0xFFFBDA61),
//     const Color(0xFF00AB79),
//     const Color(0xFFF7CE68),
//     const Color(0xFFFF007D),
//   ],

//  decoratorsList: [

//   ],
//   child:  buildBlocWidget()
// ),
        // body: buildBlocWidget()
        // body: OfflineBuilder(
        //   connectivityBuilder: (
        //     BuildContext context,
        //     ConnectivityResult connectivity,
        //     Widget child,
        //   ) {
        //     final bool connected = connectivity != ConnectivityResult.none;
        //   print(connected);
        //   print("MMMMMMMMMMMMMM RRRRRRRRR");
        //     if (connected) {
        //       return buildBlocWidget();
        //     } else {
        //       return buildNoInternetWidget();
        //     }
        //   },
        //   child: SingleChildScrollView(child: showLoadingIndicator()),
        // ),
        );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<BranchBloc, BranchState>(
      builder: (context, state) {
        if (state is LoadedGetDataStudentState) {
          allCharacters = (state).dataStudent;
          print(allCharacters);
          print("mmmm,,,,,,,,,,,,,,mmmmmmmmmm,,,,,,,,,,,");
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.grey2,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacters.length,
      itemBuilder: (ctx, index) {
        return Stack(
          children: [
            AnimatedBackground(
              behaviour: RandomParticleBehaviour(
                options: ParticleOptions(
                  baseColor: Colors.blue,
                  spawnOpacity: 0.0,
                  opacityChangeRate: 0.25,
                  minOpacity: 0.1,
                  maxOpacity: 0.4,
                  spawnMinSpeed: 30.0,
                  spawnMaxSpeed: 70.0,
                  spawnMinRadius: 7.0,
                  spawnMaxRadius: 55.0,
                  particleCount: 40,
                ),
              ),
              vsync: this,
              child: Container(),
            ),
            DataStudentItem(
              dataStudent: _searchTextController.text.isEmpty
                  ? allCharacters[index]
                  : searchedForCharacters[index],
            ),
          ],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'أوائل الفرع',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset('assets/no_internet.png')
          ],
        ),
      ),
    );
  }
}
