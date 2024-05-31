import 'package:flutter/material.dart';
import 'package:smart_holticulture_4_4/constants/constants_value.dart';
import 'package:smart_holticulture_4_4/functions/authFunctions.dart';
import 'package:smart_holticulture_4_4/ui/screens/signin_page.dart';
import 'package:smart_holticulture_4_4/ui/screens/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      ExactAssetImage('assets/icons_ui/scan_image.png'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                    width: 5.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    Text(
                      'User',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                      child: Icon(
                        Icons.verified,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'smartHolticulture Account',
                style: TextStyle(
                  color: Constants.blackColor.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: ProfileWidget(
                        icon: Icons.person,
                        title: 'Profil Saya',
                      ),
                      onTap: (){
                        if (isLoginned == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: Duration(seconds: 5),
                                  content: Container(
                                    child: Text('Sudah Login'),
                                  )
                              )
                          );
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const SignInPage()));
                        };
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.settings,
                      title: 'Pengaturan',
                    ),
                    ProfileWidget(
                      icon: Icons.notifications,
                      title: 'Notifikasi',
                    ),
                    ProfileWidget(
                      icon: Icons.chat,
                      title: 'Pertanyaan',
                    ),
                    ProfileWidget(
                      icon: Icons.share,
                      title: 'Bagikan Aplikasi',
                    ),GestureDetector(
                      onTap: () {
                        if (isLoginned == false) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const SignInPage()));
                        } else {
                          isLoginned = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: Duration(seconds: 5),
                                  content: Container(
                                    child: Text('Berhasil Logout'),
                                  )
                              )
                          );
                        };
                      },
                      child: ProfileWidget(
                        icon: Icons.logout,
                        title: 'Log Out',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
