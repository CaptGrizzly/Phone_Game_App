import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);                                          
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Firestore for Game App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Read Data from Cloud Firestore',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const Text('My name is Bryson and I am 22 years old.');
                },
              ),
            ),
            const Text(
              'Write Data to Cloud Firestore',
              style: TextStyle(fontSize:20, fontWeight: FontWeight.w600),
            ),
            MyCustomForm()
          ],
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget{
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What\'s Your Name?',
              labelText: 'Name',
            ),
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.date_range),
              hintText: 'What\'s Your age?',
              labelText: 'Age',
            ),
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), 
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sending Data to Cloud Firestore'),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}