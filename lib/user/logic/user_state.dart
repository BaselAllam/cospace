

abstract class UserState {}

class InitUserState extends UserState {}

class UserLoginLoadingState extends UserState {}

class UserLoginSuccessState extends UserState {}

class UserLoginErrorState extends UserState {}

class UserLoginSomeThignWentWrongState extends UserState {}