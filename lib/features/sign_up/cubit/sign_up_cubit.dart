import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/helpers/dio_helper.dart';
import 'package:ebook_app/features/helpers/hive_helper.dart';
import 'package:ebook_app/features/main_views/views/bottom_nav.dart';
import 'package:ebook_app/features/signin_screen/models/signin_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  SignInModel model = SignInModel();
  String? username;
  void Register({
    required String email,
    required String phone,
    required String name, // Consistent usage of `username`
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
        username = model.data?.name;

        var box = Hive.box('USER_BOX');
        box.put('username', username);
        HiveHelper.setValueLoginBox();

        Get.offAll(() => MainView());

        emit(RegisterSuccessState(model.message ?? ""));
      } else {
        emit(RegisterErrorState(model.message ?? ""));
      }
    } catch (e) {
      emit(RegisterErrorState("Connection is bad!"));
    }
  }
}
