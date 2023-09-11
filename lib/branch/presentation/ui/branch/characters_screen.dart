import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_design/branch/presentation/bloc/branch/branch_bloc.dart';
import '../../../domain/entities/data_student.dart';

import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../base/constants/my_colors.dart';
import '../widgets/character_item.dart';
import '../widgets/data_student_item.dart';




class DataStudentsScreen extends StatefulWidget {
  const DataStudentsScreen({Key? key}) : super(key: key);

  @override
  _DataStudentsScreenState createState() => _DataStudentsScreenState();
}

class _DataStudentsScreenState extends State<DataStudentsScreen> {
  late List<DataStudent> allDataStudents;
  late List<DataStudent> searchedForDataStudents;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  void addSearchedFOrItemsToSearchedList(String searchedDataStudent) {
    searchedForDataStudents = allDataStudents
        .where((DataStudent) =>
            DataStudent.name.toLowerCase().startsWith(searchedDataStudent))
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: _isSearching
            ? BackButton(
                color: MyColors.myGrey,
              )
            : Container(),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),


      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return buildBlocWidget();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: SingleChildScrollView(child: showLoadingIndicator()),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        hintText: 'Find a DataStudent...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedDataStudent) {
        addSearchedFOrItemsToSearchedList(searchedDataStudent);
      },
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<BranchBloc, BranchState>(
      builder: (context, state) {
        if (state is LoadedGetDataStudentState) {
          allDataStudents = (state).dataStudent;
          return buildLoadedListWidgets();
        } else {
          // progracepar on loding
          return showLoadingIndicator();
        }
      },
    );
  }

 

  Widget showLoadingIndicator() {
    return const Center(
      child: SpinKitFadingCircle(
        color: MyColors.myYellow,
        size: 50.0,
      ),
 
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
            children: [
            buildDataStudentsList(),
          ],
        ),
      ),
    );
  }

  Widget buildDataStudentsList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      // physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allDataStudents.length
          : searchedForDataStudents.length,
      itemBuilder: (ctx, index) {
        return CharacterItem(
        // return DataStudentItem(
          character: _searchTextController.text.isEmpty
          // dataStudent: _searchTextController.text.isEmpty
              ? allDataStudents[index]
              : searchedForDataStudents[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'DataStudents',
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
            const SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset('assets/images/no_internet.png')
          ],
        ),
      ),
    );
  }
}
