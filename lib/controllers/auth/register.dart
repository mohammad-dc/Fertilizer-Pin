import 'package:fertilizer_pin/controllers/city/city.dart';
import 'package:fertilizer_pin/models/city/city.dart';
import 'package:fertilizer_pin/models/res/register/register.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/services/auth/auth.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  var registerSuccess = Register(success: false, message: '').obs();
  var registerError = Error(success: false, message: '').obs();

  late TextEditingController emailController,
      passwordController,
      fullNameController,
      ssnNumberController,
      phoneController,
      addressController;

  var email = '';
  var password = '';
  var fullName = '';
  var snnNumber = '';
  var phone = '';
  var address = '';

  var authService = AuthServices();
  var citiesList = Get.find<CityController>().citySuccess.response.results;

  RxBool loading = false.obs;
  var citySelected = City().obs;
  var cities;

  late List<City> listCities;

  late List<DropdownMenuItem<City>> _dropdownMenuItems;
  late City _selectedItem;
  List<DropdownMenuItem<City>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<City>> items = [];
    for (City listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: FertilizerText(
            text: listItem.city,
            fontSize: 13,
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    ssnNumberController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();

    listCities = citiesList
        .map((value) => City(id: value.id, city: value.city))
        .toList();

    _dropdownMenuItems = buildDropDownMenuItems(listCities);
    _selectedItem = listCities.length > 0
        ? _dropdownMenuItems[0].value!
        : City(id: 1, city: 'جنين');
    cities = _dropdownMenuItems;
    onCitySelected(_selectedItem);
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    ssnNumberController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }

  void onCitySelected(City city) {
    citySelected(city);
  }

  String? valideateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'يجب ادخال البريد الاكتروني بالشكل الصحيح';
    }
    return null;
  }

  String? valideatePassword(String value) {
    if (value.length < 5) {
      return 'كلمة المرور يجب ان تحتوي على الاقل 5 مدخلات';
    }
    return null;
  }

  String? valideateFullName(String value) {
    if (value.length < 1) {
      return 'يجب ملئ الحقل';
    }
    return null;
  }

  String? valideateSSNNumber(String value) {
    if (value.length < 9) {
      return 'يجب ملئ الحقل بالشكل الصحيح';
    }
    return null;
  }

  String? valideatePhone(String value) {
    if (value.length < 10) {
      return 'يجب ملئ الحقل بالشكل الصحيح';
    }
    return null;
  }

  void checkRegister() async {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loading(true);
    registerFormKey.currentState!.save();
    Map<String, dynamic> body = {
      'full_name': fullName,
      'email': email,
      'password': password,
      'ssn_number': snnNumber,
      'phone': phone,
      'city': citySelected.value.id,
      'address': address
    };

    var response = await authService.register(body);
    if (response != null) {
      if (response is Error) {
        registerError = response;
        loading(false);
        update();
      } else if (response is Register) {
        registerSuccess = response;
        loading(false);
        Get.snackbar('تم انشاء الحساب بنجاح',
            'شكرا لك سيدي على الانضمام, سيتم التواصل معك لاحقا من اجل تأكيد تفعيل الحساب');
        update();
      }
    }
  }
}
