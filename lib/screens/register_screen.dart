import 'package:flutter/material.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/screens/login_screen.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';
import 'package:saladapp/share/widget/textformfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.093,
                  top: size.height * 0.1,
                  right: size.width * 0.093),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      ImageAssets.logo,
                      width: size.width * 0.3,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      'ចុះឈ្មោះគណនីថ្មី',
                      style: customFontBassac(
                          size.width * 0.093, const Color(0xff5F5F5F)),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    TextFieldWidget(
                      onChanged: (p0) {},
                      controller: username,
                      size: size,
                      lblText: 'ឈ្មោះអ្នកប្រើប្រាស់',
                      pwStyle: false,
                    ),

                    SizedBox(
                      height: size.height * 0.038,
                    ),
                    TextFieldWidget(
                      onChanged: (p0) {},
                      controller: email,
                      size: size,
                      lblText: 'អ៊ីមែល',
                      pwStyle: false,
                    ),
                    SizedBox(
                      height: size.height * 0.038,
                    ),
                    TextFieldWidget(
                      onChanged: (p0) {},
                      controller: password,
                      size: size,
                      lblText: 'លេខសម្ងាត់',
                      pwStyle: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: Text(
                    //       'ភ្លេចលេខសម្ងាត់ ?',
                    //       style: customFontSR(
                    //           size.width * 0.033, const Color(0xffC54646)),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: size.height * 0.038,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(121, 121, 121, 1),
                              Color.fromRGBO(36, 45, 1, 0.4),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.291, vertical: 9),
                          child: Text(
                            'ចុះឈ្មោះ',
                            style: customFontBassac(
                                size.width * 0.037, const Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.054,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'ចូលគណនី',
                        style: TextStyle(
                          fontFamily: 'KhmerOSKangrey',
                          fontSize: size.width * 0.042,
                          color: const Color(0xffA88383),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
