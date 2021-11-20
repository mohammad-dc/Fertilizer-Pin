import 'package:fertilizer_pin/controllers/city/city.dart';
import 'package:fertilizer_pin/models/city/city.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/res/update/update.dart';
import 'package:fertilizer_pin/services/user/user.dart';
import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLocationController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> editLocationFormKey = GlobalKey<FormState>();

  var editError = Error(success: false, message: '').obs();
  var editSuccess = UpdateResponse(success: false, message: '').obs();

  late TextEditingController addressController;

  var address = '';

  RxBool loading = false.obs;

  var userServices = UserServices();
  var account = Get.find<AccountController>().account;
  var citiesList = Get.find<CityController>().citySuccess.response.results;

  var citySelected = City().obs;
  var cities;

  late List<City> listCities;
  int index = 0;

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
    addressController = TextEditingController(text: account.address);
    listCities = citiesList
        .map((value) => City(id: value.id, city: value.city))
        .toList();

    citiesList
        .map((City e) => {
              if (e.city == account.city) {index = citiesList.indexOf(e)}
            })
        .toList();

    _dropdownMenuItems = buildDropDownMenuItems(listCities);
    _selectedItem = listCities.length > 0
        ? _dropdownMenuItems[index].value!
        : City(id: 1, city: 'جنين');
    cities = _dropdownMenuItems;
    onCitySelected(_selectedItem);
    update();
  }

  @override
  void onClose() {
    addressController.dispose();
  }

  void onCitySelected(City city) {
    citySelected(city);
  }

  void checkEditLocation() async {
    final isValid = editLocationFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loading(true);
    editLocationFormKey.currentState!.save();
    final response = await userServices.updateLocation(
        address, citySelected.value.id, account.id);
    if (response != null) {
      if (response is Error) {
        loading(false);
        editError = response;
        update();
      } else if (response is UpdateResponse) {
        loading(false);
        editSuccess = response;
        account.address = address;
        account.city = citySelected.value.city;
        update();
        Get.offNamed('/profile');
      }
    }
  }
}
