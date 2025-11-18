import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Mi App",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.blue,
        ),
        body: const MyCustomForm(), // ✅ Aquí mostramos el formulario
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                "https://cdn.pixabay.com/photo/2024/02/22/05/40/natural-scenery-8589165_1280.jpg",
                width: 300,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese su nombre',
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese algún texto';
                }
                return null;
              },
            ),

            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese su apellido',
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese algún texto';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Procesando datos...')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
