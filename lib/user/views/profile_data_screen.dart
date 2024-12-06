import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/custom_back_btn.dart';
import 'package:cospace/shared/shared_widgets/custom_btn_widget.dart';
import 'package:cospace/shared/shared_widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileDataScreen extends StatefulWidget {
  const ProfileDataScreen({super.key});

  @override
  State<ProfileDataScreen> createState() => _ProfileDataScreenState();
}

class _ProfileDataScreenState extends State<ProfileDataScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String birthDate = 'Select Date';
  String selectedGender = 'None';
  File? selectedImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text('Profile Data', style: AppFonts.primaryBlackFont),
        leading: CustomBackBtn(),
      ),
      bottomSheet: Container(
        height: 80,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: CustomBtnWidget(title: 'Update',
        backgroundColor: AppColors.greenColor,
        textStyle: AppFonts.miniWhiteFont,
        size: Size(MediaQuery.of(context).size.width / 1.1, 20),
        onPress: () {},
      ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 170.0,
                  width: 170,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: selectedImg == null ? DecorationImage(
                      image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                      fit: BoxFit.contain
                    ) : DecorationImage(
                      image: FileImage(selectedImg!),
                      fit: BoxFit.fill
                    )
                  ),
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(Icons.add_a_photo),
                    color: AppColors.greenColor,
                    iconSize: 30.0,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.whiteColor,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 200,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('Camera', style: AppFonts.primaryNormalBlackFont),
                                  leading: Icon(Icons.camera, color: AppColors.greenColor, size: 20.0),
                                  onTap: () async {
                                    XFile? pickedImg = await ImagePicker().pickImage(source: ImageSource.camera);
                                    if (pickedImg != null) {
                                      selectedImg = File(pickedImg!.path);
                                      setState(() {});
                                    }
                                  },
                                ),
                                ListTile(
                                  title: Text('Gallery', style: AppFonts.primaryNormalBlackFont),
                                  leading: Icon(Icons.photo, color: AppColors.greenColor, size: 20.0),
                                  onTap: () async {
                                    XFile? pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
                                    if (pickedImg != null) {
                                      selectedImg = File(pickedImg!.path);
                                      setState(() {});
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      );
                    },
                  ),
                ),
              ],
            ),
            field(
              title: 'Name',
              hintTxt: 'User Name',
              prefixIcon: Icons.person,
              controller: nameController
            ),
            field(
              title: 'Phone Number',
              hintTxt: 'Phone Number',
              prefixIcon: Icons.phone,
              controller: phoneController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly]
            ),
            field(
              title: 'Email',
              hintTxt: 'Email',
              prefixIcon: Icons.email,
              controller: emailController,
            ),
            ListTile(
              title: Text('Birth Date', style: AppFonts.subBlackFont),
              subtitle: InkWell(
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(DateTime.now().year - 100),
                    lastDate: DateTime(DateTime.now().year - 14),
                    initialDate: DateTime(DateTime.now().year - 14)
                  );
                  if (selectedDate != null) {
                    birthDate = selectedDate.toString().substring(0, 11);
                    setState(() {});
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.whiteColor
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  child: Text('   $birthDate', style: AppFonts.priamryGreyFont,),
                ),
              ),
            ),
            ListTile(
              title: Text('Gender', style: AppFonts.primaryBlackFont),
              subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.whiteColor
                ),
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$selectedGender', style: AppFonts.priamryGreyFont,),
                    PopupMenuButton(
                      child: Icon(Icons.arrow_downward, color: AppColors.greenColor, size: 20),
                      onSelected: (v) {
                        selectedGender = v;
                        setState(() {});
                      },
                      itemBuilder: (context) {
                        return <PopupMenuEntry<String>>[
                          PopupMenuItem(child: Text('Male', style: AppFonts.subBlackFont,), value: 'Male'),
                          PopupMenuItem(child: Text('FeMale', style: AppFonts.subBlackFont,), value: 'FeMale'),
                        ];
                      },
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}