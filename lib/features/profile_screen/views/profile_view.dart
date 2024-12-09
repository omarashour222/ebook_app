import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/profile_screen/cubit/switch_cubit.dart';
import 'package:ebook_app/features/profile_screen/widgets/custom_image_profile.dart';
import 'package:ebook_app/features/profile_screen/widgets/profile_detail.dart';
import 'package:ebook_app/features/profile_screen/widgets/security_detail.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cubit = context.read<SwitchCubit>();
    final signIn = context.read<SignInCubit>();
    var box = Hive.box('USER_BOX');
    String? username = box.get('username', defaultValue: signIn.username);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
          top: height * 0.08, right: width * 0.07, left: width * 0.07),
      child: Column(
        children: [
          CustomImageProfile(),
          SizedBox(
            height: 5,
          ),
          Text(
            'Welcome, ${username ?? 'N/A'}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kPrimaryColor),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          BlocBuilder<SwitchCubit, SwitchState>(
            builder: (context, state) {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    ProfileDetail(
                      text: 'Personal Info',
                      icon: Icons.info_outline,
                    ),
                    ProfileDetail(
                      text: "Cards & Payments",
                      icon: CupertinoIcons.creditcard,
                    ),
                    ProfileDetail(
                      text: "Transactions History",
                      icon: Icons.format_list_bulleted,
                    ),
                    ProfileDetail(
                      text: "Privacy & Data",
                      icon: Icons.front_hand_outlined,
                    ),
                    ProfileDetail(
                      text: "Account ID",
                      icon: Icons.account_box_outlined,
                    ),
                    Row(
                      children: [
                        Text(
                          'Security',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SecurityDetail(
                      text: '2-factor authentication',
                      value: cubit.switchValue,
                      onChanged: (value) {
                        cubit.authSwitch(value);
                      },
                    ),
                    SecurityDetail(
                      text: 'Face ID',
                      value: cubit.faceId,
                      onChanged: (value) {
                        cubit.faceIdSwitch(value);
                      },
                    ),
                    SecurityDetail(
                      text: 'Passcode lock',
                      value: cubit.passCode,
                      onChanged: (value) {
                        cubit.passCodeswitch(value);
                      },
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
