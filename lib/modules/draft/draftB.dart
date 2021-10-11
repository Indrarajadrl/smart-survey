import 'package:get/get.dart';

class DraftBindings implements Bindings {
  @override
  void dependencies() {
    /*
      ketika menggunakan get.put secara internal memanggil get.find yang dimana
      dependencies akan di load secara segera dan dapat digunakan langsung
      semisalnya controller langsung di binding pada view dalam route
    */
    /*
      ketika menggunakan get.lazyput , controller  diload ketika pagenya telah tampil
    */
    /*
      permanent : dependecies tidak akan dihapus
      tag : tambahkan tag untuk mengupdate instance secara terpisah pada controller yang sama
    */
    // Get.put<LoginC>(LoginC());
    // Get.put<UserR>(UserR());

    //final loginC = Get.find<LoginC>(); simpan pada view untuk menggunakan
  }
}
