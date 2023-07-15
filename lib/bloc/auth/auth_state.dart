part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState{}
class LoginLoadedState extends AuthState{}
class LoginErrorState extends AuthState{}

class RegisterLoadingState extends AuthState{}
class RegisterLoadedState extends AuthState{}
class RegisterErrorState extends AuthState{}

class CheckLoadingState extends AuthState{}
class CheckLoadedState extends AuthState{}
class CheckErrorState extends AuthState{}

class SendOtpLoadingState extends AuthState{}
class SendOtpLoadedState extends AuthState{}
class SendOtpErrorState extends AuthState{}

class VerifyOtpLoadingState extends AuthState{}
class VerifyOtpLoadedState extends AuthState{}
class VerifyOtpErrorState extends AuthState{}


class ForgotPasswordLoadingState extends AuthState{}
class ForgotPasswordLoadedState extends AuthState{}
class ForgotPasswordErrorState extends AuthState{}

class LogoutLoadingState extends AuthState{}
class LogoutLoadedState extends AuthState{}
class LogoutErrorState extends AuthState{}



class GetUserInfoLoadingState extends AuthState{}
class GetUserInfoLoadedState extends AuthState{}
class GetUserInfoErrorState extends AuthState{}

class UpdateProfileLoadingState extends AuthState{}
class UpdateProfileLoadedState extends AuthState{}
class UpdateProfileErrorState extends AuthState{}



class ChangePasswordLoadingState extends AuthState{}
class ChangePasswordLoadedState extends AuthState{}
class ChangePasswordErrorState extends AuthState{}

class NotificationsLoadingState extends AuthState{}
class NotificationsLoadedState extends AuthState{}
class NotificationsErrorState extends AuthState{}

class ContactLoadingState extends AuthState{}
class ContactLoadedState extends AuthState{}
class ContactErrorState extends AuthState{}

class GetJobInfoLoadingState extends AuthState{}
class GetJobInfoLoadedState extends AuthState{}
class GetJobInfoErrorState extends AuthState{}

class PrivacyPolicyLoadingState extends AuthState{}
class PrivacyPolicyLoadedState extends AuthState{}
class PrivacyPolicyErrorState extends AuthState{}


class CreateBusinessAccountLoadingState extends AuthState{}
class CreateBusinessAccountLoadedState extends AuthState{}
class CreateBusinessAccountErrorState extends AuthState{}


class GetCommercialActivitiesListLoadingState extends AuthState{}
class GetCommercialActivitiesListLoadedState extends AuthState{}
class GetCommercialActivitiesListErrorState extends AuthState{}

class GetCompaniesOrderTypesListLoadingState extends AuthState{}
class GetCompaniesOrderTypesListLoadedState extends AuthState{}
class GetCompaniesOrderTypesListErrorState extends AuthState{}

class GetClientCategoriesListLoadingState extends AuthState{}
class GetClientCategoriesListLoadedState extends AuthState{}
class GetClientCategoriesListErrorState extends AuthState{}

class PhotosChangeState extends AuthState{}

class SocialMediaLoadingState extends AuthState{}
class SocialMediaLoadedState extends AuthState{}
class SocialMediaErrorState extends AuthState{}

