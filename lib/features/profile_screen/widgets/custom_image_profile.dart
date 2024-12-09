import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/profile_screen/cubit/image_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ImagePickerCubit>();
    return Center(
      child: BlocBuilder<ImagePickerCubit, ImagePickerState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                               backgroundImage: cubit.selectedImage != null
                    ? MemoryImage(cubit.selectedImage!) // تحقق من أن الصورة موجودة
                    : AssetImage('assets/images/profile pic placeholder.webp') as ImageProvider, 
              ),
              Positioned(
                bottom: 6,
                child: GestureDetector(
                  onTap: () {
                    cubit.pickImage();
                  },
                  child: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 12,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
