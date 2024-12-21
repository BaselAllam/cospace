import 'package:cospace/user/logic/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserCubit extends Cubit<UserState> {

  UserCubit() : super(InitUserState());

  Future<void> loginUser(String email, String password) async {
    emit(UserLoginLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('userId', userCredential.user!.uid);
      emit(UserLoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(UserLoginErrorState());
    }
  }
}