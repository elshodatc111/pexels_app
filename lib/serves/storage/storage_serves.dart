import 'package:get_storage/get_storage.dart';
class StorageServes{
  static GetStorage box = GetStorage();

  static get(String key) {
    return box.read(key);
  }

  static put(String key, dynamic value) {
    box.write(key, value);
  }

  static remove(String key) {
    box.remove(key);
  }
}