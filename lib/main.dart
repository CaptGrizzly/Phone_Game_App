import 'package:csc322_game_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlayerNameScreen(),
    );
  }
}

class PlayerNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Player Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter Your Name',
                labelText: 'Player Name',
              ),
              onChanged: (value) {
                playerName = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (playerName.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GameHomeScreen()),
                  );
                }
              },
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}






// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:flutter/material.dart';
// import 'home.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );                                          
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp (
//       home: HomeScreen(),
//     );
//   }
// }


// class HomeScreen extends StatelessWidget {
//   final Stream<QuerySnapshot> test_collection = FirebaseFirestore.instance.collection('test_collection').snapshots();

//   HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cloud Firestore for Game App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Read Data from Cloud Firestore',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//             ),
//             Container(
//               height: 250,
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               child: StreamBuilder<QuerySnapshot>(stream: test_collection, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text('Something went wrong');
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Text('Loading');
//                 }
//                 return ListView(
//                   children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//                     return ListTile(
//                       title: Text(data['name']),
//                       subtitle: Text(data['age'].toString()),
//                     );
//                   }).toList(),
//                 );
//               },)
//             ),
//             const Text(
//               'Write Data to Cloud Firestore',
//               style: TextStyle(fontSize:20, fontWeight: FontWeight.w600),
//             ),
//             const MyCustomForm()
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyCustomForm extends StatefulWidget{
//   const MyCustomForm({super.key});

//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }

// class MyCustomFormState extends State<MyCustomForm> {
//   final _formKey = GlobalKey<FormState>();

//   var name = '';
//   var age = 0;

//   @override
//   Widget build(BuildContext context){
//     CollectionReference test_collection = FirebaseFirestore.instance.collection('test_collection');
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             decoration: const InputDecoration(
//               icon: Icon(Icons.person),
//               hintText: 'What\'s Your Name?',
//               labelText: 'Name',
//             ),
//             onChanged: (value) {
//               name = value;
//             },
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               icon: Icon(Icons.date_range),
//               hintText: 'What\'s Your age?',
//               labelText: 'Age',
//             ),
//             onChanged: (value) {
//               age = int.parse(value);
//             },
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ), 
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Sending Data to Cloud Firestore'),
//                         ),
//                       );
//                       test_collection
//                         .add({'name': name, 'age': age})
//                         .then((value) => print('User Added'))
//                         .catchError(
//                           (error) => print('Failed to add user: $error'));
//                     }
//                   },
//                   child: const Text('Submit'),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const GameHomeScreen()),
//                     );
//                   },
//                   child: const Text('Game'),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }