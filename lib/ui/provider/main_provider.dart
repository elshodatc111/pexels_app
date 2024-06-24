import 'package:auth_register/serves/http/http_serves.dart';
import 'package:auth_register/ui/views/fovorite/fovorite_view.dart';
import 'package:auth_register/ui/views/home/home_view.dart';
import 'package:auth_register/ui/views/profel/profel_view.dart';
import 'package:auth_register/ui/views/search/search_view.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  List<Map<String, dynamic>> views = [
    {
      "index": 0,
      'title': "Home",
      'widget': const HomeView(),
      'icon': const Icon(Icons.home),
    },
    {
      "index": 1,
      'title': "Search",
      'widget': const SearchView(),
      'icon': const Icon(Icons.search),
    },
    {
      "index": 2,
      'title': "Fovarite",
      'widget': const FovoriteView(),
      'icon': const Icon(Icons.heart_broken),
    },
    {
      "index": 3,
      'title': "Profel",
      'widget': const ProfelView(),
      'icon': const Icon(Icons.person),
    }
  ];

  Widget get currentViewWidget => views[currentIndex]['widget'];

  String get currentViewTitle => views[currentIndex]['title'];

  Icon get currentViewIcon => views[currentIndex]['icon'];

  int currentIndex = 0;

  void currentIndexChange(int index) {
    currentIndex = index;
    notifyListeners();
  }

  var searchController = TextEditingController();

  List images = [];

  MainProvider() {
      searchImage();
  }

  bool isLoading = false;

  Future searchImage() async {
    if (isLoading) return;
    String searchText = searchController.text;
    if (searchText.isEmpty) {
      searchText = "person";
      notifyListeners();
    }
    if (searchText.length < 3) return;

    isLoading = true;
    notifyListeners();

    var res = await HttpServes.GET(
      "v1/search",
      param: {
        "query": searchText,
        "width": "1920",
        "height": "1080",
      },
    );

    if (res.status == MyResponseStatus.success) {
      images = res.data['photos'];
      notifyListeners();
    }

    isLoading = false;
    notifyListeners();


  }


}
