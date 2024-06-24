
import 'package:auth_register/serves/storage/storage_serves.dart';
import 'package:flutter/cupertino.dart';

class ForwardProvider extends ChangeNotifier{
  List forwards = [];
  ForwardProvider(){
    getAllForwards();
  }
  void getAllForwards(){
    forwards = StorageServes.get('forwards')??[];
    notifyListeners();
  }
}