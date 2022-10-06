import 'package:danek/helpers/colors.dart';
import 'package:danek/main.dart';
import 'package:danek/models/models.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  FormPageState createState() => FormPageState();
}

enum BoyGirlType { boy, girl }

BoyGirlType boyGirlKey = BoyGirlType.boy;

Map<BoyGirlType, Transformation> boyGirl = {
  BoyGirlType.boy: Transformation('assets/images/boy.jpg'),
  BoyGirlType.girl: Transformation('assets/images/girl.jpg'),
};

class FormPageState extends State<FormPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/boy.jpg'),
                height: 40,
                width: 40,
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    if (boyGirlKey == BoyGirlType.boy) {
                      boyGirlKey = BoyGirlType.girl;
                    } else if (boyGirlKey == BoyGirlType.girl) {
                      boyGirlKey = BoyGirlType.boy;
                    }
                  });
                },
              ),
              const Image(
                image: AssetImage('assets/images/girl.jpg'),
                height: 35,
                width: 35,
              ),
            ],
          ),
          SwitchReplaceInherited(
            boyGirlKey: boyGirlKey,
            child: const BoyGirl(),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chooseheroes');
              },
              child: Text('Далее'))
        ]),
      ),
    );
  }
}

class BoyGirl extends StatelessWidget {
  const BoyGirl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    boyGirlKey = context
            .dependOnInheritedWidgetOfExactType<SwitchReplaceInherited>()
            ?.boyGirlKey ??
        0;
    return Stack(
      children: [
        Image.asset(boyGirl[boyGirlKey]!.foto,
            width: double.infinity, height: 600, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.only(top: 220, left: 100),
          child: Container(
            width: 200,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration('Name'),
                  style: textStyleInput(),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration('Age'),
                  style: textStyleInput(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Transformation {
  String foto;

  Transformation(this.foto);
}

class SwitchReplaceInherited extends InheritedWidget {
  final boyGirlKey;

  const SwitchReplaceInherited({
    Key? key,
    required this.boyGirlKey,
    required this.child,
  }) : super(key: key, child: child);

  final Widget child;

  @override
  bool updateShouldNotify(SwitchReplaceInherited oldWidget) {
    return BoyGirlType != oldWidget.boyGirlKey;
  }
}
