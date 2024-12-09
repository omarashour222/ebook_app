import 'package:ebook_app/features/home_screen/cubit/home_screen_cubit.dart';
import 'package:ebook_app/features/home_screen/widgets/grid_builder.dart';
import 'package:ebook_app/features/home_screen/widgets/searchbar.dart';
import 'package:ebook_app/features/home_screen/widgets/semi_appbar.dart';
import 'package:ebook_app/features/home_screen/widgets/skeleton.dart';
import 'package:ebook_app/features/home_screen/widgets/welcome.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocListener<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        if (state is GettingBooksFailed) {
          Get.snackbar('Error', state.msg, backgroundColor: Colors.red);
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.069,
                  ),
                  semiAppBar(),
                  welcome(signInCubit),
                  const SizedBox(
                    height: 28,
                  ),
                  searchBar(height, width, context),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<HomeScreenCubit, HomeScreenState>(
                    builder: (context, state) {
                      if (state is GettingBooksLoading) {
                        return skeletonItems();
                      } else {
                        return gridBuilder(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
