import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _nombreduenio = '';
  String _telefono = '';
  String _raza = '';
  String _sexo = '';
  String _edadmascota = '';
  String _tipomascota = '';
  String _fecha = '';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearDuenio(),
          Divider(),
          _crearTelefono(),
          Divider(),
          _crearRaza(),
          Divider(),
          _crearEdad(),
          Divider(),
          _crearTipoMascota(),
          Divider(),
          _crearFecha(context), 
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: RaisedButton(
            child: Text('Mostrar Alerta'),
             color: Colors.cyan,
            textColor: Colors.black,
            shape: StadiumBorder(),
            onPressed: () => _mostrarAlert(context),
             ),
           ),
        ],
      ), 
    );
  }


  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la mascota',
          labelText: 'Nombre Mascota',
          helperText: 'Sólo es el nombre',
          suffixIcon: Icon(Icons.pets_sharp),
          icon: Icon(Icons.pets)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }
  Widget _crearDuenio() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombreduenio.length}'),
          hintText: 'Nombre del dueño',
          labelText: 'Nombre Dueño',
          helperText: 'Sólo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombreduenio = valor;
        });
      },
    );
  }

  Widget _crearTelefono() {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Telefono',
            labelText: 'Teléfono',
            suffixIcon: Icon(Icons.phone),
            icon: Icon(Icons.phone)),
        onChanged: (valor) => setState(() {
              _telefono = valor;
            }));
  }

  Widget _crearRaza() {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Raza',
            labelText: 'Raza',
            suffixIcon: Icon(Icons.pets),
            icon: Icon(Icons.pets)),
        onChanged: (valor) => setState(() {
              _raza = valor;
            }));
  }

  Widget _crearEdad() {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Edad',
            labelText: 'Edad',
            suffixIcon: Icon(Icons.pin),
            icon: Icon(Icons.pin)),
        onChanged: (valor) => setState(() {
              _edadmascota = valor;
            }));
  }

  Widget _crearTipoMascota() {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Tipo Mascota',
            labelText: 'Tipo Mascota',
            suffixIcon: Icon(Icons.pets),
            icon: Icon(Icons.pets)),
        onChanged: (valor) => setState(() {
              _tipomascota = valor;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
  
  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Datos del paciente'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Nombre Mascota: $_nombre'),
                Text('Nombre Dueño: $_nombreduenio'),
                Text('Telefono: $_telefono'),
                Text('Raza: $_raza'),
                Text('Sexo: $_sexo'),
                Text('Edad de la mascota: $_edadmascota'),
                Text('Tipo de Mascota: $_tipomascota'),
                Text('Fecha de nacimiento: $_fecha')
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}