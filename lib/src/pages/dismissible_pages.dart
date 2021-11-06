import 'package:flutter/material.dart';

class DismissibleItems extends StatelessWidget {
  const DismissibleItems(
      {Key key,
      ListTile child,
      Container background,
      Null Function(DismissDirection direction) onDismissed})
      : super(key: key);

  static const String _titulo = 'Eliminar items de la lista';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: const BorrarWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class BorrarWidget extends StatefulWidget {
  const BorrarWidget({Key key}) : super(key: key);

  @override
  State<BorrarWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<BorrarWidget> {
  List<int> items = List<int>.generate(15, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          child: ListTile(
            title: Text(
              'Item ${items[index]}',
            ),
          ),
          background: Container(
            color: Colors.red,
          ),
          key: ValueKey<int>(items[index]),
          onDismissed: (DismissDirection direction) {
            setState(() {
              items.removeAt(index);
            });
          },
        );
      },
    );
  }
}
