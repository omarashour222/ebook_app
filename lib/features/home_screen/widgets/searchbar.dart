import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/home_screen/cubit/home_screen_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget searchBar(double height, double width, BuildContext context) {
  final cubit = context.read<HomeScreenCubit>();
  return TextFormField(
      decoration: InputDecoration(
          hintText: '   Search here',
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 135, 135, 135), fontSize: 20),
          contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.026,
            horizontal: width * 0.05,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                cubit.gettingBooks(searchText: cubit.searchController.text);
                FocusManager.instance.primaryFocus!.unfocus();
                cubit.searchController.text = '';
              },
              child: Icon(
                CupertinoIcons.search,
                size: 30,
              ),
            ),
          )),
      onFieldSubmitted: (value) {
        cubit.gettingBooks(searchText: value);
        cubit.searchController.text = '';
      },
      controller: cubit.searchController,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      });
}
