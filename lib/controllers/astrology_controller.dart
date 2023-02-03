import 'package:get/get.dart';

class AstrologyController extends GetxController {
  Rx<String> selectedSunSign = "".obs;
  Rx<String> selectedImage = "".obs;
  Rx<bool>   isLight   = true.obs;

  addSunShine({required sunSign, required image}) {
    selectedSunSign.value = sunSign;
    selectedImage.value = image;
  }

  isLightChange(){
    isLight.value = !isLight.value;
  }

}
