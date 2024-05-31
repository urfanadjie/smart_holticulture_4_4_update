import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_holticulture_4_4/constants/constants_value.dart';
import 'package:smart_holticulture_4_4/ui/root_page.dart';
import 'package:smart_holticulture_4_4/ui/screens/widgets/custom_textfield.dart';
import 'package:smart_holticulture_4_4/ui/screens/signin_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

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
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/ilustrations/sign_up_ilustration.png')),
                ),
                const Text(
                  'Mendaftar',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: false,
                  style: TextStyle(
                    color: Constants.blackColor,
                  ),
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    prefixIcon: Icon(Icons.email, color: Constants.primaryColor.withOpacity(.3),),
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
                  onTap: () {},
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            signup(email, password);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 3),
                                content: Container(
                                  child: Text('Sukses Daftar, silahkan login.'),
                                )
                              )
                            );
                          }
                        },
                        child: const Text(
                          'Daftar Sekarang',
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
                  height: 20,
                ),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('ATAU'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const SignInPage(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Center(
                    child: Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: 'Sudah ada akun? ',
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Masuk',
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
  signup(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('-----------Success Registration-------------');
      Navigator.push(context, PageTransition(
        child: const SignInPage(),
        type: PageTransitionType.bottomToTop,
      ));

          } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: Duration(seconds: 3),
                  content: Container(
                    child: Text('Password terlalu pendek'),
                  )
              )
          );
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: Duration(seconds: 3),
                  content: Container(
                    child: Text('Email sudah ada'),
                  )
              )
          );
        }
      } catch (e) {
      print(e);
    }
  }

}

