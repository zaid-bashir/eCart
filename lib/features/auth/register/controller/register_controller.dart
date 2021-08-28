import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:ecart/features/auth/register/repository/register_repository.dart';
import 'package:ecart/utils/helper_functions.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';


class RegisterController extends GetxController {
  final RegisterRepository _repository;

  RegisterController(this._repository);

  RxStatus status = RxStatus.empty();

  int index = 0;
  String name = '';
  String username = "";
  String email = "";
  String password = "";
  String? phone;
  String? address;
  File? image;
  dio.MultipartFile? imageData;

  updateFirstPageInfo(
      {required String name,
      required String username,
      required String email,
      required String password}) {
    index = 1;
    this.name = name;
    this.username = username;
    this.email = email;
    this.password = password;
    update();
  }

  updateSecondPageInfo(String? phone, String? address) {
    if (phone != null) this.phone = phone;
    if (address != null) this.address = address;
    index = 2;
    update();
  }

  pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null){
      this.image = File(image.path);
    }
    update();
  }

  register() async {
    status = RxStatus.loading();
    if(image != null){
      imageData = await dio.MultipartFile.fromFile(image!.path, contentType: new MediaType("image", "jpg"));
    }
    update();
    dio.FormData formData = dio.FormData.fromMap({
      "name": name,
      "email": email,
      "username": username,
      "password": password,
      "passwordConfirmation": password,
      "phone": phone,
      "address": address,
      "role": "user",
      "image": imageData }
    );
    final res = await _repository.register(formData);
    status = RxStatus.empty();
    update();
    res.fold((error) => showErrorDialog(error), (r) => Get.defaultDialog(title: r));
  }

  goBack() {
    if (index > 0) {
      index = index - 1;
      update();
    }
  }
}
