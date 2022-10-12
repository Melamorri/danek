import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    TextFormField(
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.enter_age.tr();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: inputDecoration(LocaleKeys.age.tr()),
                      style: textStyleInput(),
                    ),
                    const SizedBox(height: 100),
                    AnimatedButton(
                      color: CustomColors.lightBlueColor,
                      borderColor: CustomColors.darkBlueColor,
                      shadowColor: CustomColors.darkBlueColor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/chooseheroes');
                        }
                      },
                      child: Text(
                        LocaleKeys.next.tr().toUpperCase(),
                        style: textStyleButton(),
                      ),
                    ),
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
