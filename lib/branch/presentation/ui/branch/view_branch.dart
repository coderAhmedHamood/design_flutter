import 'package:flutter/material.dart';

 import '../../../domain/entities/branch.dart';
import '../../bloc/branch/branch_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/branch_list_widget.dart';
class BranchScreen extends StatefulWidget {
  @override
  _BranchScreenState createState() => _BranchScreenState();
}

class _BranchScreenState extends State<StatefulWidget> {
  List<Branch> branches=[];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchBloc, BranchState>(
      builder: (context, state) {
        if (state is LoadedBranchState) {
          branches = state.branch;
        }
        return Container(
          color: Color.fromRGBO(209, 207, 207, 1),
          child: 
      BranchListWidget(branches: branches),
        );
      },
    );
  }

}
