import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> platformerScoresCollection =
        FirebaseFirestore.instance.collection('2d_platformer_scores').snapshots();

    final Stream<QuerySnapshot> hitAndBlowScoresCollection =
        FirebaseFirestore.instance.collection('hit_and_blow_scores').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '2D Platformer Scores',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: platformerScoresCollection,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading');
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text('Player: ${data['playerName']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date: ${data['date'].toDate().toString()}'),
                            Text('Guesses Taken: ${data['guessesTaken']}'),
                            Text('Time Taken: ${data['timeTaken']}'),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hit and Blow Scores',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: hitAndBlowScoresCollection,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading');
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text('Player: ${data['playerName']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date: ${data['date'].toDate().toString()}'),
                            Text('Enemies Killed: ${data['enemiesKilled']}'),
                            Text('Fruit Collected: ${data['fruitCollected']}'),
                            Text('Num Of Jumps: ${data['numOfJumps']}'),
                            Text('Time Taken: ${data['timeTaken']}'),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
