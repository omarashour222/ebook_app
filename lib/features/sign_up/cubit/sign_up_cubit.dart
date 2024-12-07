import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/helpers/dio_helper.dart';
import 'package:ebook_app/features/helpers/hive_helper.dart';
import 'package:ebook_app/features/home_screen/views/home_view.dart';
import 'package:ebook_app/features/signin_screen/models/signin_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
   SignInModel model = SignInModel();
  


  void Register({
    required String email,
    required String phone,
    required String name,  // Consistent usage of `username`
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      final response = await DioHelper.postUrls(Url: 'register', body: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      });
      model = SignInModel.fromJson(response.data);
      if (model.status == true) {
             HiveHelper.setToken(model.data?.token ?? "");
        HiveHelper.setValueLoginBox();

        Get.offAll(const HomeView());

        emit(RegisterSuccessState(model.message ?? ""));
      } else {
        emit(RegisterErrorState(model.message ?? ""));
      }
    } catch (e) {
      emit(RegisterErrorState("Connection is bad!"));
    }
  }
}