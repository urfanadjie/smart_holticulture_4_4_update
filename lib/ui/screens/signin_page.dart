import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_holticulture_4_4/constants/constants_value.dart';
import 'package:smart_holticulture_4_4/functions/authFunctions.dart';
import 'package:smart_holticulture_4_4/ui/root_page.dart';
// import 'package:smart_holticulture_4_4/ui/screens/forgot_password.dart';
import 'package:smart_holticulture_4_4/ui/screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child:
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset(
                          'assets/ilustrations/login_ilustration.png')),
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  key: ValueKey('email'),
                  obscureText: false,
                  style: TextStyle(
                    color: Constants.blackColor,
                  ),
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                    hintText: 'Enter Email',
                  ),
                  cursorColor: Constants.blackColor.withOpacity(.5),
                  validator: (value) {
                    if (!(value.toString().contains('@'))) {
                      return ' Invalid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  key: ValueKey('password'),
                  obscureText: true,
                  style: TextStyle(
                    color: Constants.blackColor,
                  ),
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                    hintText: 'Enter Password',
                  ),
                  cursorColor: Constants.blackColor.withOpacity(.5),
                  validator: (value) {
                    if (value.toString().length < 6) {
                      return ' Invalid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.pushReplacement(
                  //       context,
                  //       PageTransition(
                  //           child: const RootPage(),
                  //           type: PageTransitionType.bottomToTop));
                  // },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            signin(email, password);
                            isLogin = isLoginned;
                            print(isLoginned);
                            isLogin = true;

                          }
                          if (isLogin == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Container(
                                      child: Text('Sukses Login'),
                                    )
                                )
                            );
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pushReplacement(
                //         context,
                //         PageTransition(
                //             child: const ForgotPasswordPage(),
                //             type: PageTransitionType.bottomToTop));
                //   },
                //   child: Center(
                //     child: Text.rich(TextSpan(
                //       children: [
                //         TextSpan(
                //           text: 'Lupa Password? ',
                //           style: TextStyle(
                //             color: Constants.blackColor,
                //           ),
                //         ),
                //         TextSpan(
                //           text: 'Reset disini',
                //           style: TextStyle(
                //             color: Constants.primaryColor,
                //           ),
                //         ),
                //       ],
                //     )),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   width: size.width,
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Constants.primaryColor),
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Text(
                //         'Masuk dengan Google',
                //         style: TextStyle(
                //           color: Constants.blackColor,
                //           fontSize: 18.0,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const SignUp(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Center(
                    child: Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: 'Belum buat Akun? ',
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Buat Sekarang!',
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  signin(String email, password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      isLoginned = true;
      print('-----------Success Login-------------');
      Navigator.pop(context, PageTransition(
          child: const RootPage(),
          type: PageTransitionType.bottomToTop,
        ),
      );
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        loginMessage = 'Akun tidak ada!.';
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 3),
                content: Container(
                  child: Text('Akun tidak ditemukan'),
                )
            )
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        loginMessage = 'Password Salah!.';
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Password Salah'),
                duration: Duration(seconds: 5)
            )
        );
      }
    }
  }


}
