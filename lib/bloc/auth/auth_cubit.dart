import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../models/Aattendees/notifications_model.dart';
import '../../models/Auth/get_user_info_model.dart';
import '../../models/Auth/login_model.dart';
import '../../models/Auth/send_otp_model.dart';
import '../../models/Auth/social_media_model.dart';
import '../../models/default_model.dart';
import '../../models/list_model.dart';
import '../../repositories/Auth/auth_repository.dart';
import '../../shared/cash_helper.dart';
import '../../shared/components.dart';
import '../../utilities/app_util.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
   final loginFormKey = GlobalKey<FormState>();
  final profileFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final checkFormKey = GlobalKey<FormState>();
  final newPassFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final contactFormKey = GlobalKey<FormState>();
  final verifyFormKey = GlobalKey<FormState>();
 
  final TextEditingController loginPhone = TextEditingController();
  final TextEditingController loginCode = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();

  final TextEditingController registerEmail = TextEditingController();
  final TextEditingController registerName = TextEditingController();
  final TextEditingController registerPhone = TextEditingController();
  final TextEditingController registerCode = TextEditingController();
  final TextEditingController nationalNum = TextEditingController();
  final TextEditingController registerPassword = TextEditingController();
  final TextEditingController registerConfirmPassword = TextEditingController();
  final TextEditingController dateController = TextEditingController();


  final TextEditingController verifyController1 = TextEditingController();
  final TextEditingController verifyController2 = TextEditingController();
  final TextEditingController verifyController3 = TextEditingController();
  final TextEditingController verifyController4 = TextEditingController();

LoginModel? loginModel;
  login(context) async {
    emit(LoginLoadingState());
    // String fcm = await AppUtil.getToken();
    Map<String,String> formData = {
      "mobile" : "0${loginPhone.text}",
      "password": loginPassword.text
    };
    try{
      Map<String,dynamic> response = await AuthRepositories.login(formData);
      loginModel = LoginModel.fromJson(response);
      emit(LoginLoadedState());
    }catch(e){
      AppUtil.errorToast(context, e.toString());
      emit(LoginErrorState());
      return Future.error(e);
    }
  }




  LoginModel? registerModel;
  register(context) async {
    emit(RegisterLoadingState());
    // String fcm = await AppUtil.getToken();
    Map<String,String> formData = {
      "name": registerName.text,
      "mobile": "0${registerPhone.text}",
      "email": registerEmail.text,
      "password": registerPassword.text,
      "password_confirmation": registerConfirmPassword.text
    };
    try{
      Map<String,dynamic> response = await AuthRepositories.register(formData);
      registerModel = LoginModel.fromJson(response);
      emit(RegisterLoadedState());
    }catch(e){
      AppUtil.errorToast(context, e.toString());
      emit(RegisterErrorState());
      return Future.error(e);
    }
  }
  final TextEditingController phoneCode = TextEditingController();
  SendOtpModel? sendOtpModel;
  sendOtp(context , String type , String  phone ,String mail ) async {
    emit(SendOtpLoadingState());
    try{
      Map<String,dynamic> response = await AuthRepositories.sendOtp(phone, type,mail);
      sendOtpModel = SendOtpModel.fromJson(response);
      emit(SendOtpLoadedState());
    }catch(e){
      AppUtil.errorToast(context, e.toString());
      emit(SendOtpErrorState());
      return Future.error(e);
    }
  }

  final TextEditingController verifyCode = TextEditingController();
  DefaultModel? verifyOtpModel;
  verifyOtp(context, String code , String  phone ) async {
    emit(VerifyOtpLoadingState());
    try{
      Map<String,dynamic> response = await AuthRepositories.verifyOtp(phone,code );
      verifyOtpModel = DefaultModel.fromJson(response);
      emit(VerifyOtpLoadedState());
    }catch(e){
      AppUtil.errorToast(context, e.toString());
      emit(VerifyOtpErrorState());
      return Future.error(e);
    }
  }

  final TextEditingController newPassword = TextEditingController();
  final TextEditingController newConfirmPassword = TextEditingController();
  DefaultModel? changePassModel;
  forgotPassword(context , String phone ) async {
    emit(ForgotPasswordLoadingState());
    Map<String,dynamic> formData = {
      "mobile": "0${phone}",
      "password": newPassword.text,
      "password_confirmation" :newConfirmPassword.text
    };
    try{
      Map<String,dynamic> response = await AuthRepositories.forgotPassword(formData);
      changePassModel = DefaultModel.fromJson(response);
      emit(ForgotPasswordLoadedState());
    }catch(e){
      AppUtil.errorToast(context, e.toString());
      emit(ForgotPasswordErrorState());
      return Future.error(e);
    }
  }



  DefaultModel? logoutModel;
  logout(context) async {
    emit(LogoutLoadingState());
    try{
      Map<String,dynamic> response = await AuthRepositories.logout();
      logoutModel = DefaultModel.fromJson(response);
      emit(LogoutLoadedState());
    }catch(e){
      AppUtil.errorToast(context, e.toString());
      emit(LogoutErrorState());
      return Future.error(e);
    }
  }
GetUserInfoModel? profileModel;
bool isUpdate = false;
  profile() async {
    emit(GetUserInfoLoadingState());
    
    try{
      Map<String,dynamic> response = await AuthRepositories.profile();
      profileModel = GetUserInfoModel.fromJson(response);
      if (profileModel!.status == true) {
       updateEmail.text  = profileModel!.data!.email.toString();
       updateName.text  = profileModel!.data!.name.toString();
       updatePhone.text  = profileModel!.data!.mobile.toString().substring(1);
      }
      emit(GetUserInfoLoadedState());
    }catch(e){
      emit(GetUserInfoErrorState());
      return Future.error(e);
    }
  }

  final TextEditingController updateEmail = TextEditingController();
  final TextEditingController updatePhone = TextEditingController();
  final TextEditingController updateName = TextEditingController();
  final TextEditingController updateId = TextEditingController();
  final updateProfileFormKey = GlobalKey<FormState>();
  GetUserInfoModel? updateProfileModel;
    updateProfile(context) async {
    emit(UpdateProfileLoadingState());
    Map<String,String> formData = {
      "email": updateEmail.text,
      "name" : updateName.text,
      "mobile" : "0${updatePhone.text}",
    };
    print(formData);
    try{
      Map<String,dynamic> response = await AuthRepositories.updateProfile(formData);
      updateProfileModel = GetUserInfoModel.fromJson(response);
      if(updateProfileModel?.status == true){
      CashHelper.setSavedString("phone", updateProfileModel?.data?.mobile ?? "");
      CashHelper.setSavedString("name", updateProfileModel?.data?.name ?? "");
       updateEmail.text  = updateProfileModel!.data!.email.toString();
       updateName.text  = updateProfileModel!.data!.name.toString();
       updatePhone.text  = updateProfileModel!.data!.mobile.toString().substring(1);
      }
      profileModel = updateProfileModel;
      emit(UpdateProfileLoadedState());
    }catch(e){
      emit(UpdateProfileErrorState());
      return Future.error(e);
    }
  }

  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newChangePassword = TextEditingController();
  final TextEditingController newChangeConfirmPassword = TextEditingController();
  GetUserInfoModel? changePassordModel;
  final changePassFormKey = GlobalKey<FormState>();
    changePass(context) async {
      String mobile = await CashHelper.getSavedString("phone", "");
    emit(ChangePasswordLoadingState());
    Map<String,dynamic> formData = {
      "old_password": oldPassword.text,
      "password": newChangePassword.text ,
      "password_confirmation" :  newChangeConfirmPassword.text,
      "mobile" : mobile
    };
    try{
      Map<String,dynamic> response = await AuthRepositories.resetPassword(formData);
      changePassordModel = GetUserInfoModel.fromJson(response);
      emit(ChangePasswordLoadedState());
      if(changePassordModel?.status == true){
      CashHelper.setSavedString("phone", changePassordModel?.data?.mobile ?? "");
      CashHelper.setSavedString("name", changePassordModel?.data?.name ?? "");
       updateEmail.text  = changePassordModel!.data!.email.toString();
       updateName.text  = changePassordModel!.data!.name.toString();
       updatePhone.text  = changePassordModel!.data!.mobile.toString().substring(1);
      }

    }catch(e){
      AppUtil.errorToast(context, e.toString());
      emit(ChangePasswordErrorState());
      return Future.error(e);
    }
  }

  NotificationsModel? notificationsModel;
  notifications(int page) async {
    emit(NotificationsLoadingState());
    try{
      Map<String,dynamic> response = await AuthRepositories.notifications(page);
      notificationsModel = NotificationsModel.fromJson(response);
      emit(NotificationsLoadedState());
    }catch(e){
      emit(NotificationsErrorState());
      return Future.error(e);
    }
  }
  // contact
  final TextEditingController contactEmail = TextEditingController();
  final TextEditingController contactTitle = TextEditingController();
  final TextEditingController contactNotes = TextEditingController();
  DefaultModel? contactModel;
  contact() async {
    emit(ContactLoadingState());
    Map<String,dynamic> formData = {
      "email": contactEmail.text,
      "title": contactTitle.text,
      "notes": contactNotes.text
    };
    try{
      Map<String,dynamic> response = await AuthRepositories.contact(formData);
      contactModel = DefaultModel.fromJson(response);
      emit(ContactLoadedState());
    }catch(e){
      emit(ContactErrorState());
      return Future.error(e);
    }
  }



  ListModel? getCommercialActivitiesListModel;
  getCommercialActivitiesList() async {
    emit(GetCommercialActivitiesListLoadingState());
    try{
      Map<String,dynamic> response = await AuthRepositories.getCommercialActivitiesList();
      getCommercialActivitiesListModel = ListModel.fromJson(response);
      emit(GetCommercialActivitiesListLoadedState());
    }catch(e){
      emit(GetCommercialActivitiesListErrorState());
      return Future.error(e);
    }
  }

  ListModel? getCompaniesOrderTypesListModel;
  getCompaniesOrderTypesList() async {
    emit(GetCompaniesOrderTypesListLoadingState());
    try{
      Map<String,dynamic> response = await AuthRepositories.getCompaniesOrderTypesList();
      getCompaniesOrderTypesListModel = ListModel.fromJson(response);
      emit(GetCompaniesOrderTypesListLoadedState());
    }catch(e){
      emit(GetCompaniesOrderTypesListErrorState());
      return Future.error(e);
    }
  }

  ListModel? getClientCategoriesLisModel;
  getClientCategoriesLis() async {
    emit(GetClientCategoriesListLoadingState());
    try{
      Map<String,dynamic> response = await AuthRepositories.getClientCategoriesList();
      getClientCategoriesLisModel = ListModel.fromJson(response);
      emit(GetClientCategoriesListLoadedState());
    }catch(e){
      emit(GetClientCategoriesListErrorState());
      return Future.error(e);
    }
  }

  //   static Future getCommercialActivitiesList() async {
  //   return await NetworkHelper.repo("get-commercial-activities-list","get",formData: null,headerState: true);
  // }
  // static Future  getCompaniesOrderTypesList() async {
  //   return await NetworkHelper.repo("get-companies-order-types-list","get",formData: null,headerState: true);
  // }
  //   static Future  getClientCategoriesList() async {
  //   return await NetworkHelper.repo("get-client-categories-list","get",formData: null,headerState: true);
  // }

 final businessAccountFormKey1 = GlobalKey<FormState>();
 final businessAccountFormKey2 = GlobalKey<FormState>();
 final businessAccountFormKey3 = GlobalKey<FormState>();
 final businessAccountFormKey4 = GlobalKey<FormState>();

//  businessAccount 1
  final TextEditingController nameBusiness = TextEditingController();
  final TextEditingController commercialActivitiesBusiness = TextEditingController();
  final TextEditingController commercialActivitiesNumberBusiness = TextEditingController();
  String? dateBusiness;
  String? orderTypeBusiness;
  String? activityBusiness;
  final TextEditingController postalBusiness = TextEditingController();
  final TextEditingController cityBusiness = TextEditingController();
  final TextEditingController countryCodeBusiness = TextEditingController();
  final TextEditingController phoneBusiness = TextEditingController();
  final TextEditingController faxBusiness = TextEditingController();
  final TextEditingController emailBusiness = TextEditingController();
  final TextEditingController websiteBusiness = TextEditingController();
  String? clientCategoryIdBusiness;

//  businessAccount 2
  final TextEditingController bankNameBusiness = TextEditingController();
  final TextEditingController branchNameBusiness = TextEditingController();
  final TextEditingController bankAccountNumberBusiness = TextEditingController();

  final TextEditingController companyNameBusiness = TextEditingController();
  final TextEditingController responsableNameBusiness = TextEditingController();
  final TextEditingController responsablePhoneBusiness = TextEditingController();
  final TextEditingController taxBusiness = TextEditingController();

  final TextEditingController managerNameBusiness = TextEditingController();
  final TextEditingController managerPhoneBusiness = TextEditingController();
  final TextEditingController managerDirectPhoneBusiness = TextEditingController();


  // final TextEditingController Business = TextEditingController();
  //  businessAccount 3
  XFile? procurement ;
  XFile? commercialRegistration ;
  XFile? bankStatementFor6Months ;
  XFile? taxCertificate ;
  XFile? identityOfTheOwnerOrOwnersImage ;
  XFile? nationalAddress ;
    
  String? latitude;
  String? longitude;
  final TextEditingController streetNameBusiness = TextEditingController();
  final TextEditingController blockNameBusiness = TextEditingController();
  final TextEditingController apartmentNameBusiness = TextEditingController();
  final TextEditingController specialMarqueBusiness = TextEditingController();

  //  businessAccount 4
  final TextEditingController passwordBusiness = TextEditingController();
  final TextEditingController confirmPasswordBusiness = TextEditingController();
  LoginModel? createBusinessAccountModel;
  createBusinessAccount() async {
    emit(CreateBusinessAccountLoadingState());
    Map<String,String> formData = {
      "name": nameBusiness.text,
      "commercial_activities": commercialActivitiesBusiness.text,
      "commercial_activities_number": commercialActivitiesNumberBusiness.text,
      "date": dateBusiness ?? "",
      "order_type": orderTypeBusiness ?? "",
      "activity": activityBusiness ?? "",
      "postal": postalBusiness.text,
      "city":cityBusiness.text,
      "country_code": countryCodeBusiness.text,
      "mobile": "0${phoneBusiness.text}",
      "fax": faxBusiness.text,
      "email": emailBusiness.text,
      "website": websiteBusiness.text,
      "client_category_id": clientCategoryIdBusiness ?? "",
      "banks[][name]" : bankNameBusiness.text,
      "banks[][branch_name]" : branchNameBusiness.text,
      "banks[][account_number]" : bankAccountNumberBusiness.text,
      "sponsors_company_references[][company_name]" : companyNameBusiness.text,
      "sponsors_company_references[][responsable_name]":responsableNameBusiness.text,
      "sponsors_company_references[][mobile]":responsablePhoneBusiness.text,
      "sponsors_company_references[][tax]":taxBusiness.text,
      "managers[][name]": managerNameBusiness.text,
      "managers[][phone]": managerPhoneBusiness.text,
      "managers[][direct_phone]":  managerDirectPhoneBusiness.text,
      "latitude": latitude ?? "",
      "longitude" :longitude ?? "",
      "street_name" : streetNameBusiness.text,
      "block_name" : blockNameBusiness.text, 
      "apartment_name" : apartmentNameBusiness.text,
      "special_marque": specialMarqueBusiness.text,
      "password": passwordBusiness.text,
      "password_confirmation": confirmPasswordBusiness.text
    };
    try{
      Map<String,dynamic> response = await AuthRepositories.createBusinessAccount(formData, procurement?.path ?? "", commercialRegistration?.path ?? "", bankStatementFor6Months?.path ?? "", taxCertificate?.path ?? "", identityOfTheOwnerOrOwnersImage?.path ?? "", nationalAddress?.path ?? "");
      createBusinessAccountModel = LoginModel.fromJson(response);
      emit(CreateBusinessAccountLoadedState());
    }catch(e){
      // AppUtil.errorToast(context, e.toString());
      emit(CreateBusinessAccountErrorState());
      return Future.error(e);
    }
  }


 final ImagePicker reportPicker = ImagePicker();

    chooseImageDialog(context,String file)async{
    await AppUtil.dialog2(context, "Choose Image From".tr(), [
      InkWell(
          onTap: (){
            openGallery(context,file);
          },
          child: CustomText(text: "Gallery".tr())),
      const Divider(),
      InkWell(
          onTap: (){
            openCamera(context,file);
          },
          child: CustomText(text: "Camera".tr())),
    ]);
  }
    openGallery(context,String file) async {
   var image = await reportPicker.pickImage(source: ImageSource.gallery);
    if(file == "procurement"){
     procurement = image;
    }else if(file == "commercialRegistration"){
    commercialRegistration = image;
    }else if(file == "bankStatementFor6Months"){
    bankStatementFor6Months = image;
    }else if(file == "taxCertificate"){
    taxCertificate = image;
    }else if(file == "identityOfTheOwnerOrOwnersImage"){
    identityOfTheOwnerOrOwnersImage = image;
    }else if(file == "nationalAddress"){
     nationalAddress = image;
    }
    Navigator.of(context,rootNavigator: true).pop();
    emit(PhotosChangeState());
  }

  openCamera(context,String file) async {
   var image = await reportPicker.pickImage(source: ImageSource.camera);
    if(file == "procurement"){
     procurement = image;
    }else if(file == "commercialRegistration"){
    commercialRegistration = image;
    }else if(file == "bankStatementFor6Months"){
    bankStatementFor6Months = image;
    }else if(file == "taxCertificate"){
    taxCertificate = image;
    }else if(file == "identityOfTheOwnerOrOwnersImage"){
    identityOfTheOwnerOrOwnersImage = image;
    }else if(file == "nationalAddress"){
     nationalAddress = image;
    }
    Navigator.of(context,rootNavigator: true).pop();
    emit(PhotosChangeState());
  }

    PrivacyPolicyModel?  privacyPolicyModel;
    privacyPolicy() async {
    emit(PrivacyPolicyLoadingState());
    try{
      Map<String,dynamic> response = await AuthRepositories.privacyPolicy();
      privacyPolicyModel = PrivacyPolicyModel.fromJson(response);
      emit(PrivacyPolicyLoadedState());
    }catch(e){
      emit(PrivacyPolicyErrorState());
      return Future.error(e);
    }
  }

  SocialMediaModel? socialMediaModel;

    socialMedia() async {
    emit(SocialMediaLoadingState());
    try{
      Map<String,dynamic> response = await AuthRepositories.getSocialMedia();
      socialMediaModel = SocialMediaModel.fromJson(response);
      emit(SocialMediaLoadedState());
    }catch(e){
      emit(SocialMediaErrorState());
      return Future.error(e);
    }
  }
}
