import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/style.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? userName;
  int? userAge;
  bool? formLaunch;

  Future addUser(userName, userAge, launch) async {
    await UserPreferences().setUserName(userName);
    await UserPreferences().setUserAge(userAge);
    await UserPreferences().setFormLaunch(launch);
  }

  @override
  void initState() {
    super.initState();
    userName = UserPreferences().getUserName() ?? '';
    userAge = UserPreferences().getUserAge();
    formLaunch = UserPreferences().getFormLaunch() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/menubackground.png',
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(80),
                  child: Column(children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    TextFormField(
                      onChanged: (userName) => setState(() {
                        this.userName = userName;
                      }),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.enter_name.tr();
                        }
                        return null;
                      },
                      textCapitalization: TextCapitalization.sentences,
                      textAlign: TextAlign.center,
                      decoration: inputDecoration(LocaleKeys.name.tr()),
                      style: textStyleInput(),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (userAge) => setState(() {
                        this.userAge = int.parse(userAge);
                      }),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.enter_age.tr();
                        }
                        // if (!RegExp(r"[0-9.]").hasMatch(value)) {
                        //   return 'Это не возраст';
                        // }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: inputDecoration(LocaleKeys.age.tr()),
                      style: textStyleInput(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    AnimatedButton(
                      color: CustomColors.lightBlueColor,
                      borderColor: CustomColors.darkBlueColor,
                      shadowColor: CustomColors.darkBlueColor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            formLaunch = true;
                            FlameAudio.play('i_danaya.mp3');
                          });
                          Navigator.pushNamed(context, '/chooseheroes');
                          addUser(userName, userAge, formLaunch);
                        }
                      },
                      child: Text(
                        LocaleKeys.next.tr().toUpperCase(),
                        style: textStyleButton(),
                      ),
                    ),
                    SizedBox(height: 20),
                    AnimatedButton(
                      color: CustomColors.redColor,
                      borderColor: CustomColors.darkBlueColor,
                      shadowColor: CustomColors.darkBlueColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/menupage');
                      },
                      child: Text(
                        LocaleKeys.back.tr().toUpperCase(),
                        style: textStyleButton(),
                      ),
                    ),
                    SizedBox(height: 20),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
