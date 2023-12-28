//import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/core/data/model/business.dart';
import 'package:jalia/views/ProfileScreen/profile_screen.dart';

import '../core/class/class/crud.dart';
import '../core/data/model/Activities.dart';
import '../core/data/model/comments.dart';
import '../core/data/model/communication.dart';
import '../core/data/model/cv_members.dart';
import '../core/data/model/notifications.dart';
import '../core/data/model/questions.dart';
import '../core/data/model/works.dart';
import '../core/services/appservices.dart';
import '../linksapi.dart';
import '../views/AddBusiness/add_business.dart';
import '../views/AddCv/add_cv.dart';
import '../views/AddWorks/add_works.dart';
import '../views/ErrorAdd/error_add.dart';
import '../views/HomeScreen/home_screen.dart';
import '../views/QuestionsScreen/questions_screen.dart';

class HomeController extends GetxController {
  final crud = Crud();

  final itemKey = GlobalKey();
  final controllerListViewOffers = ScrollController();
  final business = Business();
  AppServices appServices = Get.find();
  final works = Works();
  final communication = Communication();
  final cvMembers = CvMembers();
  final notifications = Notifications();
  final activities = Activities();
  final questions = Questions();
  final comments = Comments();

///////////////////Search Products,,,,,,,,,,////////////////////

  TextEditingController? nameSearchController;

//////////////////////////Show and hide operations Main and Sub Types,,,,,,////////////////

  RxInt theCountofShowingList = 0.obs;
  RxDouble theHeightOfContainer = 80.h.obs;
  RxBool showTheMainTypes = false.obs;
  RxBool showTheSubTypes = false.obs;

  ////////////////////////Fluters Works////////////
  RxBool showtheTypesOfWorks = false.obs;
  RxBool showthePlaces = false.obs;

  RxInt countTheFluterWorks = 0.obs;
  RxBool isFluterPlaceWork = false.obs;
  RxBool isFluterTypeWork = false.obs;
  RxString theTypeWork = "من غير تصنيف".obs;
  RxString thePlaceWork = "Adalar".obs;
  RxInt idOfPlaceWork = 0.obs;
  RxInt idOfTypeWork = 0.obs;

  RxBool noData = false.obs;

  RxInt makeFluters = 0.obs;
  RxBool isFluterNow = false.obs;
  makeFluter() async {
    if (isFluterNow.value == true) {
      makeFluters.value = 0;
      isFluterNow.value = false;
      countTheFluterWorks.value = 0;
      isFluterPlaceWork.value = false;
      isFluterTypeWork.value = false;
      theTypeWork.value = "من غير تصنيف";
      thePlaceWork.value = "Adalar";
      idOfPlaceWork.value = 0;

      idOfTypeWork.value = 0;
    } else {
      if (countTheFluterWorks.value == 1) {
        if (isFluterPlaceWork.value == true) {
          makeFluters.value = 1;
          getAllDataWorkSearching();
          await Future.delayed(const Duration(milliseconds: 30), () async {
            isFluterNow.value = true;
          });
        } else if (isFluterTypeWork.value == true) {
          makeFluters.value = 2;
          getAllDataWorkSearching();
          await Future.delayed(const Duration(milliseconds: 30), () async {
            isFluterNow.value = true;
          });
        }
      } else if (countTheFluterWorks.value == 2) {
        makeFluters.value = 3;
        getAllDataWorkSearching();
        await Future.delayed(const Duration(milliseconds: 30), () async {
          isFluterNow.value = true;
        });
      }
    }
  }

//////////////////////Get Data From DataBase..............................................//////////////////////////////

////////Fluterr////////

  getWorksFromDatabaseFluterPalcesWork() async {
    var response = await crud.postRequest(AppLinksApi.getWork_fluterPlace,
        {"work_place": idOfPlaceWork.toString()});

    if (response['status'] == "success") {
      noData.value = false;
    } else {
      noData.value = true;
    }
    return response;
  }

  getWorksFromDatabaseFluterTypeWork() async {
    var response = await crud.postRequest(
        AppLinksApi.getWork_fluterType, {"work_type": idOfTypeWork.toString()});

    if (response['status'] == "success") {
      noData.value = false;
    } else {
      noData.value = true;
    }
    return response;
  }

  getWorksFromDatabaseFluterAll() async {
    var response = await crud.postRequest(
      AppLinksApi.getWork_fluter,
      {
        "work_type": idOfTypeWork.toString(),
        "work_place": idOfPlaceWork.toString()
      },
    );

    if (response['status'] == "success") {
      noData.value = false;
    } else {
      noData.value = true;
    }
    return response;
  }

  getAllDataWorkSearching() async {
    if (makeFluters.value == 1) {
      var response = await getWorksFromDatabaseFluterPalcesWork();

      return response;
    } else if (makeFluters.value == 2) {
      var response = await getWorksFromDatabaseFluterTypeWork();

      return response;
    } else if (makeFluters.value == 3) {
      var response = await getWorksFromDatabaseFluterAll();
      return response;
    }
  }

//////////////

  getCopmenyFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.get_compeny, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getWorksFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.get_works, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getTypesCompenyFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.get_types_compeny, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getTypesWorksFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.get_types_works, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getTPlacesFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.get_palces, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getCommunicationFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.get_communication, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getCvFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.get_cv_member, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getDataNotificationsFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.getDataNotifications, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getDataActivitiesFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.getDataActivities, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getQuestionsDataFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.getQuestions, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  RxBool isNoHaveComments = false.obs;
  getCommentsDataFromDatabase(String idQu) async {
    var response = await crud.postRequest(AppLinksApi.getComments, {
      "questions_id": idQu.toString(),
    });

    if (response['status'] == "success") {
      isNoHaveComments.value = false;
    } else {
      isNoHaveComments.value = true;
    }
    return response;
  }

  getTheGoldUsersFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.getGoldUsers, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  //////..........................................////////////////

  @override
  void onInit() {
    super.onInit();

    if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
      displayIsHavaAccount.value =
          appServices.sharedPreferences.getInt('isHaveAccount') as int;

      displayUserName.value =
          appServices.sharedPreferences.getString('userName') as String;
      displayUserId.value =
          appServices.sharedPreferences.getString('userID') as String;

      displayUserPhone.value =
          appServices.sharedPreferences.getString('phone') as String;
      displayUserEligibilityAdd.value =
          appServices.sharedPreferences.getString('eligibility_add') as String;

      getDataUser(displayUserName.value.toString());
    }
  }

  goToHome() async {
    await Future.delayed(const Duration(seconds: 5), () async {
      Get.offAll(HomeScreen());
    });
  }

  //////////////////////////////////////The Auth/////////////////////

////////SignUp/////////////////
  GlobalKey<FormState> formSign = GlobalKey<FormState>();
  RxBool isLoadingTheScreenSignUp = false.obs;
  RxBool isAddTheUser = false.obs;
  RxBool isErrorAboutAddTheUser = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String nameSignUp = "";
  String passwordSignUp = "";
  String phoneSignUp = "";

  signUpAccounts(
    String nameUSerNew,
    String password,
    String phone,
  ) async {
    var formKeyData = formSign.currentState;
    if (formKeyData!.validate()) {
      isLoadingTheScreenSignUp.value = true;
      Future.delayed(const Duration(seconds: 3), () async {
        var response = await crud.postRequest(AppLinksApi.signUp, {
          'user_name': nameUSerNew.toString(),
          'user_password': password.toString(),
          'phone': phone.toString(),
        });
///////
        if (response['status'] == "success") {
          getDataUser(nameUSerNew.toString());
          isLoadingTheScreenSignUp.value = false;
          isAddTheUser.value = true;
        } else {
          isLoadingTheScreenSignUp.value = false;
          isErrorAboutAddTheUser.value = true;
        }

        return response;
      });
    }
  }

  cleanTheSignUp() {
    isLoadingTheScreenSignUp.value = false;
    isAddTheUser.value = false;
    isErrorAboutAddTheUser.value = false;
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
    nameSignUp = "";
    passwordSignUp = "";
    phoneSignUp = "";
  }

  ////////////Login//////////////
  GlobalKey<FormState> formLogin = GlobalKey<FormState>();
  String nameLogin = "";
  String passwordLogin = "";
  TextEditingController nameControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  RxBool isLoadingTheScreenLogin = false.obs;
  RxBool isTheUserEnterTheRealyDataLogin = false.obs;
  RxBool isErrorAboutLoginTheUser = false.obs;

  loginAccounts(String nameUSerNew, String password) async {
    var formKeyData = formLogin.currentState;
    if (formKeyData!.validate()) {
      isLoadingTheScreenLogin.value = true;
      Future.delayed(const Duration(seconds: 3), () async {
        var response = await crud.postRequest(AppLinksApi.Login, {
          'user_name': nameUSerNew.toString(),
          'user_password': password.toString(),
        });
///////
        if (response['status'] == "success") {
          getDataUser(nameUSerNew.toString());

          isLoadingTheScreenLogin.value = false;
          isTheUserEnterTheRealyDataLogin.value = true;
        } else {
          isErrorAboutLoginTheUser.value = true;
        }

        return response;
      });
    }
  }

  cleanTheLogin() {
    nameLogin = "";
    passwordLogin = "";
    nameControllerLogin.clear();
    passwordControllerLogin.clear();
    isLoadingTheScreenLogin.value = false;
    isTheUserEnterTheRealyDataLogin.value = false;
    isErrorAboutLoginTheUser.value = false;
  }

///////////Get Data User////////////////

  goToHomeLoginSignUp() {
    Get.to(HomeScreen());
  }

  String userID = "";
  String userName = "";
  String userPhone = "";
  String userEligibilityAdd = "";

  getDataUser(String name) async {
    var response = await crud.postRequest(AppLinksApi.getDataUser, {
      'user_name': name.toString(),
    });

    if (response['status'] == "success") {
      userID = response['data'][0]['user_id'].toString();
      userName = response['data'][0]['user_name'].toString();
      userPhone = response['data'][0]['phone'].toString();
      userEligibilityAdd = response['data'][0]['eligibility_add'].toString();

      appServices.sharedPreferences.setInt('isHaveAccount', 1);
      appServices.sharedPreferences.setString('userName', userName);
      appServices.sharedPreferences.setString('userID', userID);
      appServices.sharedPreferences.setString('phone', userPhone);
      appServices.sharedPreferences
          .setString('eligibility_add', userEligibilityAdd);

      await Future.delayed(const Duration(seconds: 5), () async {
        onInit();
      });
    } else {}
    return response;
  }
  //////////////////////////////////////Get CV USERS////////////////////////////

  String nameTheUserCv = "";
  String aboutTheUserCv = "";
  String imageTheUSerCv = "";
  String numberTheUserCv = "";
  RxString isCanSeeCvUser = "1".obs;

  RxBool noDataAboutUserCv = false.obs;
  getDataCvUser(String id) async {
    var response = await crud.postRequest(AppLinksApi.getUsersCv, {
      'cv_id_user': id.toString(),
    });

    if (response['status'] == "success") {
      noDataAboutUserCv.value = false;
      nameTheUserCv = response['data'][0]['cv_name'].toString();
      aboutTheUserCv = response['data'][0]['about_cv'].toString();
      imageTheUSerCv = response['data'][0]['cv_image'].toString();
      numberTheUserCv = response['data'][0]['user_phone_cv'].toString();
      isCanSeeCvUser.value = response['data'][0]['is_cv_public'].toString();
    } else {
      noDataAboutUserCv.value = true;
    }
    return response;
  }

/////////DisplayData////////////////////
  RxString displayUserName = "".obs;
  RxString displayUserId = "".obs;
  RxInt displayIsHavaAccount = 0.obs;
  RxString displayUserPhone = "".obs;
  RxString displayUserEligibilityAdd = "".obs;
  RxBool isUserNotHaveAccount = false.obs;

  isHaveAccountTheUser() {
    if (displayIsHavaAccount.value == 0) {
      isUserNotHaveAccount.value = true;
    } else if (displayIsHavaAccount.value == 1) {
      Get.to(ProfileScreen());
    }
  }

  whereGoToAddBuss() {
    if (displayUserEligibilityAdd.value == "1") {
      Get.to(ErrorAdd());
    } else if (displayUserEligibilityAdd.value == "2") {
      Get.to(AddBusiness());
    }
  }

  whereGoToAddWork() {
    if (displayUserEligibilityAdd.value == "1") {
      Get.to(ErrorAdd());
    } else if (displayUserEligibilityAdd.value == "2") {
      Get.to(AddWorks());
    }
  }

  whereGoToAddCv() {
    if (displayUserEligibilityAdd.value == "1") {
      Get.to(ErrorAdd());
    } else if (displayUserEligibilityAdd.value == "2") {
      Get.to(AddCV());
    }
  }
////////////////////ADD Types Into Database////////////////////

  RxBool showThePlacesList = false.obs;
  RxBool showTheTypesComList = false.obs;
  RxBool showTheTypesWorksList = false.obs;
  RxString thePlaceList = "غير مُدخل".obs;
  RxString theTypeOfWork = "غير مُدخل".obs;
  RxString theTypeOfBus = "غير مُدخل".obs;
  //////////////ADD Compeny/////////////////

  GlobalKey<FormState> formAddComeny = GlobalKey<FormState>();
  String nameCom = "a";
  String descriptionCom = "a";
  String numberCom = "a";

  String imageCom = "";
  String typeCom = "1";
  String placeCom = "1";

  TextEditingController nameComController = TextEditingController();
  TextEditingController descriptionComController = TextEditingController();
  TextEditingController numberPhoneComController = TextEditingController();
  RxBool isLoadingAddCom = false.obs;
  RxBool isAddCom = false.obs;
  RxBool isAddErrorCom = false.obs;
  RxBool addImageBuss = false.obs;
  RxBool isNotAddAnyBussData = false.obs;

  var filename;

  RxBool isChooesImage = false.obs;
  upIm(File? mfile) async {
    // ignore: unused_local_variable
    var response =
        await crud.postRequestFile(AppLinksApi.uploadimage, {}, mfile!);
  }

  AddCompeny(String nameComepny, String description, String image, String type,
      String place, String number_phone) async {
    var formKeyData = formAddComeny.currentState;
    if (formKeyData!.validate()) {
      isLoadingAddCom.value = true;

      Future.delayed(const Duration(seconds: 3), () async {
        var response = await crud.postRequest(AppLinksApi.addcompeny, {
          'business_directory_name': nameComepny.toString(),
          'business_directory_description': description.toString(),
          'business_directory_image': "https://larra.xyz/images_nara/$image",
          'business_directory_type': type.toString(),
          'business_directory_place': place.toString(),
          'business_directory_number_phone': number_phone.toString(),
          'add_by': displayUserId.value.toString(),
        });
///////
        if (response['status'] == "success") {
          isLoadingAddCom.value = false;
          isAddCom.value = true;
        } else {
          isLoadingAddCom.value = false;
          isAddErrorCom.value = true;
        }

        return response;
      });
    }
  }

  cleanTheDataAddBuss() {
    thePlaceList.value = "غير مُدخل";
    theTypeOfWork.value = "غير مُدخل";
    theTypeOfBus.value = "غير مُدخل";
    nameCom = "a";
    descriptionCom = "a";
    numberCom = "a";
    imageCom = "";
    typeCom = "1";
    placeCom = "1";

    nameComController.clear();
    descriptionComController.clear();
    numberPhoneComController.clear();
    isAddCom.value = false;
    addImageBuss.value = false;
    isAddErrorCom.value = false;
    isChooesImage.value = false;
    addImageBuss.value = false;
    isChooesImage.value = false;
    filename = null;
  }

  //////////////ADD Works/////////////////

  GlobalKey<FormState> formAddWorks = GlobalKey<FormState>();
  String nameWork = "a";
  String descriptionWo = "a";
  String Worknumber = "a";
  String WorkCom = "a";
  String imageWork = "";
  String typeWork = "1";
  String placeWork = "1";
////////////
  RxBool addImageWork = false.obs;
  RxBool isNotAddDataWork = false.obs;
  TextEditingController nameWorkController = TextEditingController();
  TextEditingController descriptionWorkController = TextEditingController();
  TextEditingController numberPhoneWorkController = TextEditingController();
  TextEditingController ComWorkController = TextEditingController();

  RxBool isLoadingAddWork = false.obs;
  RxBool isAddWork = false.obs;
  RxBool isAddErrorWork = false.obs;

  AddWork(String nameWork, String descriptionWork, String image, String workCom,
      String type, String place, String number_phone) async {
    var formKeyData = formAddWorks.currentState;
    if (formKeyData!.validate()) {
      isLoadingAddWork.value = true;
      var response = await crud.postRequest(AppLinksApi.addWorks, {
        'work_name': nameWork.toString(),
        'work_description': descriptionWork.toString(),
        'work_image': "https://larra.xyz/images_nara/$image",
        'work_company': workCom.toString(),
        'work_number_phone': number_phone.toString(),
        'work_type': type.toString(),
        'work_place': place.toString(),
        'work_add_by': displayUserId.value.toString(),
      });
///////
      if (response['status'] == "success") {
        isLoadingAddWork.value = false;
        isAddWork.value = true;
      } else {
        isLoadingAddWork.value = false;
        isAddErrorWork.value = true;
      }

      return response;
    }
  }

  cleanTheWorksDataAdd() {
    thePlaceList.value = "غير مُدخل";
    theTypeOfWork.value = "غير مُدخل";
    theTypeOfBus.value = "غير مُدخل";
    nameWork = "a";
    descriptionWo = "a";
    Worknumber = "a";
    WorkCom = "a";
    imageWork = "";
    typeWork = "1";
    placeWork = "1";

    nameWorkController.clear();
    descriptionWorkController.clear();
    numberPhoneWorkController.clear();
    ComWorkController.clear();

    isLoadingAddWork.value = false;
    isAddWork.value = false;
    isAddErrorWork.value = false;
    isChooesImage.value = false;

    addImageWork.value = false;
    filename = null;
    addImageWork.value = false;
    isChooesImage.value = false;
  }

  ///////////////////////////////////ADD Cv/////////////////

  GlobalKey<FormState> formAddCv = GlobalKey<FormState>();
  String nameCv = "a";
  String descriptionCv = "a";
  String imageCv = "";
  String phoneNumberOFCv = "a";
  RxString isPublicCv = "0".obs;
  TextEditingController nameCvController = TextEditingController();
  TextEditingController descriptionCvController = TextEditingController();
  TextEditingController phoneNumberCvController = TextEditingController();

  RxBool isLoadingAddCv = false.obs;
  RxBool isAddCv = false.obs;
  RxBool isAddErrorCv = false.obs;
  RxBool addImageCv = false.obs;

  RxBool isNotHaveDataintoCv = false.obs;

  AddCv(String namecv, String descriptioncv, String image, String ispublic,
      String phoneNumber) async {
    var formKeyData = formAddCv.currentState;
    if (formKeyData!.validate()) {
      isLoadingAddCv.value = true;
      var response = await crud.postRequest(AppLinksApi.addCv, {
        'cv_name': namecv.toString(),
        'about_cv': descriptioncv.toString(),
        'cv_image': "https://larra.xyz/images_nara/$image",
        'is_cv_public': ispublic.toString(),
        'user_phone_cv': phoneNumber.toString(),
        'cv_add_by': displayUserId.value.toString(),
      });
///////
      if (response['status'] == "success") {
        isLoadingAddCv.value = false;
        isAddCv.value = true;
      } else {
        isLoadingAddCv.value = false;
        isAddErrorCv.value = true;
      }

      return response;
    }
  }

  cleanTheDataCv() {
    nameCv = "a";
    descriptionCv = "a";
    imageCv = "a";
    phoneNumberOFCv = "a";
    isPublicCv.value = "0";
    nameCvController.clear();
    descriptionCvController.clear();
    phoneNumberCvController.clear();
    isLoadingAddCv.value = false;
    isAddCv.value = false;
    isAddErrorCv.value = false;
    addImageCv.value = false;
    addImageWork.value = false;
    addImageWork.value = false;
    isChooesImage.value = false;
  } ///////////////////////////////////ADD Comments/////////////////

  String Thecomment = "a";
  RxBool isNotHaveAnyComment = false.obs;

  TextEditingController commentsController = TextEditingController();
  RxBool isAddCo = false.obs;
  RxBool isAddErrorCo = false.obs;

  AddComments(String thecomments, String idqu) async {
    isLoadingAddCv.value = true;
    var response = await crud.postRequest(AppLinksApi.addComments, {
      'comment': thecomments.toString(),
      'user_id': displayUserId.value.toString(),
      'questions_id': idqu.toString(),
    });
///////
    if (response['status'] == "success") {
      isLoadingAddCv.value = false;
      isAddCo.value = true;
    } else {
      isLoadingAddCv.value = false;

      isAddErrorCo.value = true;
    }

    return response;
  }

  cleanTheCommetns() {
    Thecomment = "a";
    isLoadingAddCv.value = false;

    commentsController.clear();
    isAddCo.value = false;
    isAddErrorCo.value = false;

    Get.to(QuestionsScreen());
  }

  ///////////////////////////////////ADD Ques/////////////////

  String TheQues = "a";
  RxBool isNotDataHaveInQu = false.obs;

  TextEditingController quesController = TextEditingController();
  RxBool isAddQu = false.obs;
  RxBool isAddErrorQu = false.obs;

  AddQu(String qu) async {
    isLoadingAddCv.value = true;
    var response = await crud.postRequest(AppLinksApi.addQuestion, {
      'ask': qu.toString(),
      'user_id': displayUserId.value.toString(),
    });
///////
    if (response['status'] == "success") {
      isLoadingAddCv.value = false;

      isAddQu.value = true;
    } else {
      isLoadingAddCv.value = false;

      isAddErrorQu.value = true;
    }

    return response;
  }

  cleanTheQu() {
    TheQues = "a";
    quesController.clear();
    isAddQu.value = false;
    isAddErrorQu.value = false;
    isLoadingAddCv.value = false;

    Get.to(QuestionsScreen());
  }
}
