import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: RemoveContainers(),
  ));
}

class RemoveContainers extends StatefulWidget {
  const RemoveContainers({Key? key}) : super(key: key);

  @override
  _RemoveContainersState createState() => _RemoveContainersState();
}

class _RemoveContainersState extends State<RemoveContainers> {
  removecontainer() async {
    var url = Uri.http(
        "65.0.103.54", "/cgi-bin/RemoveContainer.py", {"x": cont_name});

    var response = await http.get(url);
    // print(response.body);

    setState(() {
      output = response.body;
    });
  }

  refresh() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://tse2.mm.bing.net/th?id=OIP.1SOcGC17WownW97sUW_U2gHaEo&pid=Api&P=0&w=280&h=176'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "OUTPUT",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        decorationColor: Colors.black,
                        decorationThickness: 3.0,
                        shadows: [
                          Shadow(
                            blurRadius: 4.0,
                            color: Colors.black,
                            offset: Offset(6, 1),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  child: Text(
                    "$output",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        decorationColor: Colors.black,
                        decorationThickness: 3.0,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black,
                            offset: Offset(4, 1),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    color: Colors.red,
                    child: Text(
                      "Refresh",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          decorationColor: Colors.black,
                          decorationThickness: 3.0,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.black,
                              offset: Offset(4, 1),
                            ),
                          ]),
                    ),
                    onPressed: () {
                      refresh();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: MaterialButton(
                    color: Colors.red,
                    child: Text(
                      "Go To Home",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          decorationColor: Colors.black,
                          decorationThickness: 3.0,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.black,
                              offset: Offset(4, 1),
                            ),
                          ]),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "home");
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: MaterialButton(
                    color: Colors.red,
                    child: Text(
                      "Go To Menu",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          decorationColor: Colors.black,
                          decorationThickness: 3.0,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.black,
                              offset: Offset(4, 1),
                            ),
                          ]),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "menu");
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  var output;
  late String cont_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: Icon(Icons.remove),
        title: Text(
          "Container Remove",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              decoration: TextDecoration.combine([]),
              decorationColor: Colors.black,
              decorationThickness: 2.0,
              shadows: [
                Shadow(
                  blurRadius: 1.0,
                  color: Colors.black,
                  offset: Offset(5, 1),
                ),
              ]),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/2248523/pexels-photo-2248523.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              TextField(
                onChanged: (value) {
                  cont_name = value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30.0,
                      ),
                    ),
                  ),
                  prefixIcon: Icon(Icons.input_sharp),
                  hintText: 'Container Name',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              MaterialButton(
                color: Colors.blueAccent,
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      decorationColor: Colors.black,
                      decorationThickness: 3.0,
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.black,
                          offset: Offset(4, 1),
                        ),
                      ]),
                ),
                onPressed: () {
                  removecontainer();
                  refresh();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
