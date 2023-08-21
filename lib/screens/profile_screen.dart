import 'package:flutter/material.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/screens/fetchimagetest.dart';
import 'package:saladapp/screens/login_screen.dart';
import 'package:saladapp/share/widget/bottom_sheet_navigator.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';
import 'package:saladapp/share/widget/header_widget.dart';
import 'package:saladapp/share/widget/profile_form.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

bool isEdit = true;
String changetxt = 'កែប្រែ';

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigatorWidget(
        screen: 5,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            title: "គណនីរបស់អ្នក",
            image: ImageAssets.famer,
          ),
          SizedBox(
            height: size.height * 0.021,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.25,
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.002,
                        horizontal: size.width * 0.005),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(201, 139, 139, 1),
                          Color.fromRGBO(121, 97, 144, 0.14),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        ImageAssets.profile,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: size.height * 0.03,
                        left: size.width * 0.06,
                        right: size.width * 0.06),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(226, 232, 227, 0.4),
                          Color.fromRGBO(84, 159, 100, 0.098),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 2,
                            color: Color.fromARGB(31, 238, 252, 246)),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.height * 0.021),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ព័ត៌មានផ្ទាល់ខ្លូួន',
                                style: customFontSR(
                                    size.width * 0.033, Colors.black),
                              ),
                              TextButton(
                                onPressed: changetxt != ''
                                    ? () {
                                        setState(() {
                                          isEdit = false;
                                          changetxt = '';
                                        });
                                      }
                                    : null,
                                child: Text(
                                  changetxt,
                                  style: customFontSR(
                                      size.width * 0.033, Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ProfileField(
                            textInbox: 'Seakwin',
                            size: size,
                            lblText: 'ឈ្មោះអ្នកប្រើប្រាស់',
                            pwStyle: false,
                            isEdit: isEdit,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ProfileField(
                            textInbox: 'Seakwin.99@gmail.com',
                            size: size,
                            lblText: 'អ៊ីមែល',
                            pwStyle: false,
                            isEdit: isEdit,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ProfileField(
                            textInbox: 'មិនទាន់មាន',
                            size: size,
                            lblText: 'លេខទូរស័ព្ទ',
                            isEdit: isEdit,
                            pwStyle: false,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ProfileField(
                            size: size,
                            textInbox: '123456',
                            lblText: 'លេខសម្ងាត់',
                            pwStyle: true,
                            isEdit: isEdit,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          if (isEdit == true)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xffD2EB9E),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.009,
                                      horizontal: size.width * 0.112),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      'ចាកចេញ',
                                      style: customFontBTB(size.width * 0.037,
                                          const Color(0xff544F4B)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.047),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isEdit = true;
                                          changetxt = 'កែប្រែ';
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffEE8080),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.009,
                                              horizontal: size.width * 0.112),
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Text(
                                              'បោះបង់',
                                              style: customFontBTB(
                                                  size.width * 0.03,
                                                  const Color(0xff544F4B)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.011,
                                  ),
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FetchAPI()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: const Color(0xff767171),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.009,
                                              horizontal: size.width * 0.112),
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Text(
                                              'រក្សាទុក',
                                              style: customFontBTB(
                                                  size.width * 0.033,
                                                  const Color(0xffFFFFFF)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
