import 'package:get/get.dart';

class ControllerDialog extends GetxController {
  RxBool isWifi = false.obs;
  RxBool isProjector = false.obs;
  RxBool is2_4P = false.obs;
  RxBool is4_8P = false.obs;
  RxBool is8_12P = false.obs;
  RxBool is12_20P = false.obs;
  RxBool is20_30P = false.obs;
  RxBool is30_40P = false.obs;

  getCharacteristics(int i) {
    switch (i) {
      case 0:
        return isWifi.value;

      case 1:
        return isProjector.value;
      default:
    }
  }

  getPeople(int i) {
    switch (i) {
      case 0:
        return is2_4P.value;
      case 1:
        return is4_8P.value;
      case 2:
        return is8_12P.value;
      case 3:
        return is12_20P.value;
      case 4:
        return is20_30P.value;
      case 5:
        return is30_40P.value;
      default:
    }
  }

  void setCharacteristics(int i) {
    switch (i) {
      case 0:
        isWifi.value = !isWifi.value;
        break;

      case 1:
        isProjector.value = !isProjector.value;
        break;
      default:
    }
  }

  void setPeople(int i) {
    switch (i) {
      case 0:
        is2_4P.value = !is2_4P.value;
        break;
      case 1:
        is4_8P.value = !is4_8P.value;
        break;
      case 2:
        is8_12P.value = !is8_12P.value;
        break;
      case 3:
        is12_20P.value = !is12_20P.value;
        break;
      case 4:
        is20_30P.value = !is20_30P.value;
        break;
      case 5:
        is30_40P.value = !is30_40P.value;
        break;
      default:
    }
  }
}
