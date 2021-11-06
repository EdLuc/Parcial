import 'package:flutter/material.dart';

class OpacityPage extends StatefulWidget {
  const OpacityPage({Key key}) : super(key: key);

  @override
  State<OpacityPage> createState() => LogoFadeState();
}

class LogoFadeState extends State<OpacityPage> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: Center(
        child: _widget(opacityLevel),
      ),
    );
  }

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  Widget _widget(opacityLevel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 3),
          child: Column(
            children: const <Widget>[
              FadeInImage(
                image: NetworkImage(
                    'https://www.elagoradiario.com/wp-content/uploads/2019/08/Tuvalu.jpg'),
                placeholder: AssetImage('assets/jar-loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                height: 300.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        ElevatedButton(
          child: const Text('Cambiar Opacidad'),
          onPressed: _changeOpacity,
        ),
      ],
    );
  }
}
