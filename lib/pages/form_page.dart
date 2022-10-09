import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:flutter/material.dart';

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
                          return 'Введите ваше имя';
                        }
                        return null;
                      },
                      textCapitalization: TextCapitalization.sentences,
                      textAlign: TextAlign.center,
                      decoration: inputDecoration('Имя'),
                      style: textStyleInput(),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите ваш возраст';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: inputDecoration('Возраст'),
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
                        'ДАЛЕЕ',
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
