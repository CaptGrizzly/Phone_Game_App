import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maze_builder/maze_builder.dart';
//import '../home.dart';

class MazeScreen extends StatelessWidget {
  const MazeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maze',
      theme: ThemeData (
        primarySwatch: Colors.blue,
      ),
      home: const MazePuzzle(),
      );
  }
}
        
class MazePuzzle extends StatefulWidget {
  const MazePuzzle({super.key});
  
  @override State<MazePuzzle> createState() => _MazePuzzleState();
}

class MazeBoxClass {
  Cell cell;
  bool blok = false;
  late Offset offset;

  MazeBoxClass(this.cell) {
    offset = Offset(cell.x, cell.y);
  }
}

class FindPath {
  MazeBoxClass box;
  Offset? offset;
  Offset checkPointOffset;
  int? length;
  bool status = true;
  bool found = false;
  List<FindPath> childPaths = [];
  List<Offset> paths;

  FindPath(this.box,
      {required List<MazeBoxClass> boxs,
      required this.checkPointOffset,
      required this.paths}) {
    offset = box.offset;
    if (boxs.isNotEmpty) findChilsdOnCell(boxs); 
  }

  void findChilsdOnCell(List<MazeBoxClass> boxs) {
    int totalPathFound = 0;
    totalPathFound += findMazeBox(
      boxs,
      box.cell.left,
      box.offset.translate(-1, 0),
    );
    totalPathFound += findMazeBox(
      boxs,
      box.cell.top,
      box.offset.translate(0, -1),
    );
    totalPathFound += findMazeBox(
      boxs,
      box.cell.right,
      box.offset.translate(1, 0),
    );
    totalPathFound += findMazeBox(
      boxs,
      box.cell.bottom,
      box.offset.translate(0, 1),
    );

    status = totalPathFound > 0;

    found = totalPathFound > 3;
  }

  int findMazeBox(
  List<MazeBoxClass> boxs,
  bool wall,
  Offset translate,
) {
  if (!wall || box.offset == checkPointOffset) {
    if (box.offset == checkPointOffset) return 4;

    int index = boxs.indexWhere(
      (element) => element.offset == translate,
    );
    if (index > -1) {
      MazeBoxClass mazeBoxClass = boxs.removeAt(index);

      List<Offset> temps = List<Offset>.from(paths);
      temps.add(mazeBoxClass.offset);
      length = boxs.length;
      //offset = this.box.offset;
      childPaths.add(
        FindPath(
          mazeBoxClass,
          boxs: boxs,
          checkPointOffset: checkPointOffset,
          paths: temps,
        ),
      );
      return 1;
    }
  }

  // Add a default return statement if none of the conditions above are met
  return 0; // You can change this default value based on your logic

  }

  findRoute({List<FindPath>? paths}) {
    paths ??= childPaths;
    for (FindPath path in paths) {
      if (path.found == true) {
        return path;
      }

      if (path.childPaths.isNotEmpty) {
        FindPath? tempPath = findRoute(
          paths: path.childPaths, 
        );

        if(tempPath != null) return tempPath;
      } else {}
    }

    return null;
  }
}

class _MazePuzzleState extends State<MazePuzzle> {
  Size? size;
  double? sizeBox;
  late int numRowCol = 0;
  List<List<Cell>>? maze;
  List<Offset>? result;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void generateMaze() {
    Random rand = Random();
    List<List<Cell>> localMaze = generate(
      width: numRowCol,
      height: numRowCol,
      closed: true,
      seed: rand.nextInt(10000),
    );

  List<MazeBoxClass>? mazeBoxes = localMaze
    .expand((element) => element)
    .map(
      (e) => MazeBoxClass(e),
    )
    .toList();

  List<MazeBoxClass> mazes= List<MazeBoxClass>.from(mazeBoxes);
  MazeBoxClass firstMaze = mazes.removeAt(0);
  FindPath temp = FindPath(firstMaze,
    paths: [firstMaze.offset],
    boxs: mazes,
    checkPointOffset:
      Offset(numRowCol.toDouble() - 1, numRowCol.toDouble() - 1));
  result = temp.findRoute()!.paths;

    setState(() {
      maze = localMaze;
    });
  }

  SizedBox boxMaze(Cell cell) {
    return SizedBox(
      width: sizeBox!.toDouble(),
      height: sizeBox!.toDouble(),
      child: Container(
        decoration: BoxDecoration (
          border: Border(
            bottom: BorderSide(
              color: cell.bottom
                ? Color.fromARGB(255, 56, 14, 14)
                : Colors.transparent,
              width: 2),
            right: BorderSide(
              color:cell.right
                ? Color.fromARGB(255, 56, 14, 14)
                : Colors.transparent,
              width: 2),
            top: BorderSide(
              color:cell.top
                ? Color.fromARGB(255, 56, 14, 14)
                : Colors.transparent,
              width: 2),
            left: BorderSide(
              color:cell.left
                ? Color.fromARGB(255, 56, 14, 14)
                : Colors.transparent,
              width: 2),  
          )
        )
      )
    );


  }
}

//   GridView gridPuzzles() {
//     return GridView(
//       gridDelegate: 
//       SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: maze!.length,
//         childAspectRatio: 1,
//         crossAxisSpacing: 0,
//         mainAxisSpacing: 0,
//       ),
//       children: maze!
//         .map((e) => e.map((e) => boxMaze(e)))
//         .expand((element) => element)
//         .toList(),
//     );

//     @override
//     Widget build (BuildContext context) {
//       return size == null
//         ? Container()
//         : Center (
//           child: Container(
//             constraints: BoxConstraints.loose(size!),
//             child: Stack(
//               children: [
//                 if (maze != null) ...[gridPuzzles()],
//                 if (result != null) ...routePredicts(),
//               ]
//             ),
//           )
//         );
//     }
//   }

// List<Positioned> routePredicts() => result!
//     .map((e) => Positioned(
//       left: e.dx * sizeBox!,
//       top: e.dy * sizeBox!,
//       child: Container(
//         margin: EdgeInsets.all(sizeBox! * .2),
//         alignment: Alignment.center,
//         width: sizeBox! * .6,
//         height: sizeBox! * .6,
//         )))
//         .toList();


//   Cell({
//   required this.x,
//   required this.y,
//   required this.top,
//   required this.left,
//   required this.bottom,
//   required this.right,
//   this.set,
// })
        
        // child: ElevatedButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const GameHomeScreen())
        //     );
        //   },
        //   child: const Text('Home')
