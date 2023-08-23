import 'package:flutter/material.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late FocusNode pin3Focus;
  late FocusNode pin4Focus;
  late FocusNode pin2Focus;

  @override
  void initState() {
    pin2Focus = FocusNode();
    pin3Focus = FocusNode();
    pin4Focus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    pin2Focus.dispose();
    pin3Focus.dispose();
    pin4Focus.dispose();
    super.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Image.asset(
                  ImageAssets.logo,
                  width: size.width * 0.3,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'សូមវាយលេខសម្ងាត់ ៤ ខ្ទង់ដែលបានផ្ញើទៅ',
                  textAlign: TextAlign.center,
                  style: customFontBassac(size.width * 0.045,
                      const Color.fromARGB(221, 80, 26, 26)),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'តាមរយះលេខទូរស័ព្ទ 010917310 :',
                  textAlign: TextAlign.center,
                  style: customFontBassac(size.width * 0.045,
                      const Color.fromARGB(221, 80, 26, 26)),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.08,
                      vertical: size.height * 0.05),
                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.15,
                          child: TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: customFontBassac(
                                size.width * 0.055,
                                const Color.fromARGB(255, 50, 17, 55)
                                    .withOpacity(0.8)),
                            decoration: textFieldStyle(size),
                            onChanged: (value) {
                              nextField(value, pin2Focus);
                            },
                          ),
                        ),
                        otpBox(size, pin2Focus, pin3Focus),
                        otpBox(size, pin3Focus, pin4Focus),
                        SizedBox(
                          width: size.width * 0.15,
                          child: TextFormField(
                            focusNode: pin4Focus,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: customFontBassac(
                                size.width * 0.055,
                                const Color.fromARGB(255, 50, 17, 55)
                                    .withOpacity(0.8)),
                            decoration: textFieldStyle(size),
                            onChanged: (value) {
                              pin4Focus.unfocus();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    Text(
                      'លេខសម្ងាត់នឹងផុតកំណត់ក្នុងរយះពេល :',
                      textAlign: TextAlign.center,
                      style: customFontBassac(size.width * 0.047,
                          const Color.fromARGB(221, 80, 26, 26)),
                    ),
                    Expanded(
                      child: TweenAnimationBuilder(
                        tween: Tween(begin: 30.0, end: 0),
                        duration: const Duration(seconds: 30),
                        builder: (context, value, child) => Text(
                          value < 10
                              ? ' 00: 0${value.toInt()}'
                              : ' 00: ${value.toInt()}',
                          style: customFontKangrey(size.width * 0.04,
                              const Color.fromARGB(221, 255, 0, 0)),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 48, 70, 48),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.005,
                          horizontal: size.width * 0.15),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          'បន្ត',
                          style: customFontBTB(size.width * 0.05,
                              const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'ផ្ញើលេខកូដម្តងទៀត',
                    style: TextStyle(
                      fontFamily: 'KhmerOSKangrey',
                      fontSize: 16,
                      color: Color.fromARGB(221, 90, 6, 6),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox otpBox(Size size, FocusNode focusNode1, focusNode2) {
    return SizedBox(
      width: size.width * 0.15,
      child: TextFormField(
        focusNode: focusNode1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: customFontBassac(size.width * 0.055,
            const Color.fromARGB(255, 50, 17, 55).withOpacity(0.8)),
        decoration: textFieldStyle(size),
        onChanged: (value) {
          nextField(value, focusNode2);
        },
      ),
    );
  }
}
