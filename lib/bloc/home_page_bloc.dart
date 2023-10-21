import 'package:flutter/material.dart';

import '../utils/enums.dart';

class HomePageBloc extends ChangeNotifier {
  bool _dispose = false;
  int _pageIndex = 0;

  HomePageBloc(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }

  int get getPageIndex => _pageIndex;

  void pageChange(int index) {
    _pageIndex = WeChatPages.values[index].index;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
