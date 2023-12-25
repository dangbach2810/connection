import 'package:flutter/material.dart';

import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SubPageTinTuc extends StatelessWidget {
  const SubPageTinTuc({super.key});
  static int idpage = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => MainViewModel().closeMenu(),
        child: Container(
            color: AppConstant.backgroundColor,
            child: Center(
              child: Text("Tin Tuc"),
            )));
  }
}