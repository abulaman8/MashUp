import 'package:flutter/material.dart';
import 'package:ticktok_ui/screens/album_screen.dart';
import 'package:ticktok_ui/screens/direct_messagee_screen.dart';
import 'package:ticktok_ui/screens/edit_profile_screen.dart';
import 'package:ticktok_ui/screens/find_friends_screen.dart';
import 'package:ticktok_ui/screens/home_screen.dart';
import 'package:ticktok_ui/screens/otp_screen.dart';
import 'package:ticktok_ui/screens/privacy_setting_screen.dart';
import 'package:ticktok_ui/screens/registrartion_screen.dart';
import 'package:ticktok_ui/screens/user_detail_screen.dart';
import 'package:ticktok_ui/utils/themes.dart';
import './routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      initialRoute: routeName.HomeScreen,
      routes: {
        routeName.RegistrationScreen: (context) => RegistrationScreen(),
        routeName.OtpScreen: (context) => OtpScreen(),
        routeName.UserDetailScreen: (context) => const UserDetailScreen(),
        routeName.HomeScreen: (context) => const HomeScreen(),
        routeName.EditProfileScreen: (context) => const EditProfileScreen(),
        routeName.PrivacyAndSettingScreen: (context) =>
            const PrivacyAndSettingScreen(),
        routeName.AlbumScreen: (context) => const AlbumScreen(),
        routeName.DirectMessageScreen: (context) => const DirectMessage(),
        routeName.FindFriendScreen: (context) => const FindFriendsScreen(),
      },
    );
  }
}
