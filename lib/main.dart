import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Living Room',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //class variables
  bool lightsOn = true;
  bool acOn = true;
  bool audioOn = true;

  String lightsStatus = "On";
  String acStatus = "24.0C";
  String audioStatus = "On";

  Color lightBulbColor = Colors.amberAccent;
  Color acColor = Colors.lightBlueAccent;
  Color audioColor = Colors.pink;

  double lightsSliderValue = 0.2;
  double acSliderValue = 24.0;
  double audioSliderValue = 0.4;

  //-----
  //lightsSwitched() - called as onChanged() method for Lights Switch
  void _lightsSwitched(bool value) {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.
    setState(() {
      lightsOn = value;
      if (lightsOn) {     /*lights have been switched ON*/
        lightBulbColor = Colors.amberAccent;
        lightsStatus = "On";

      }
      else {            /*lights have been switched OFF*/
        lightBulbColor = Colors.black38;
        lightsStatus = "Off";
      }
      print("Lights Switched: $value");
    });
  }

  //lightsSliderFunction() - called as onChanged() method for Lights Slider *only if* LightsOn = true
  void _lightsSliderFunction(value) {
    setState(() {
      lightsSliderValue = value;
      print("Lights Slider: $value");
    });
  }

  //-----
  //acSwitched() - called as onChanged() method for AC Switch
  void _acSwitched(bool value) {
    setState(() {
      acOn = value;
      if (acOn) {     /*AC has been switched ON*/
        acColor = Colors.lightBlueAccent;
        acStatus = acSliderValue.toStringAsFixed(1) + "C";
      }
      else {            /*AC has been switched OFF*/
        acColor = Colors.black38;
        acStatus = "Off";
      }
      print("AC Switched: $value");
    });
  }

  //acSliderFunction() - called as onChanged() method for AC Slider *only if* acOn = true
  void _acSliderFunction(value) {
    setState(() {
      acSliderValue = value;
      acStatus = acSliderValue.toStringAsFixed(1) + "C";  /*update status value displayed too*/
      print("AC Slider: $value");
    });
  }

  //-----
  //audioSwitched() - called as onChanged() method for Audio Switch
  void _audioSwitched(bool value) {
    setState(() {
      audioOn = value;
      if (audioOn) {     /*Audio has been switched ON*/
        audioColor = Colors.pink;
        audioStatus = "On";

      }
      else {            /*Audio has been switched OFF*/
        audioColor = Colors.black38;
        audioStatus = "Off";
      }
      print("Audio Switched: $value");
    });
  }

  //audioSliderFunction() - called as onChanged() method for Audio Slider *only if* audioOn = true
  void _audioSliderFunction(value) {
    setState(() {
      audioSliderValue = value;
      print("Audio Slider: $value");
    });
  }

  //-----
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text("Living Room", style: TextStyle(color: Colors.white,),),
        ),
      ),

      body: ListView(
        children: <Widget>[

          //------------LIVING ROOM IMAGE-------------------
          Image(
            image: NetworkImage(
                "https://media.architecturaldigest.com/photos/560c37dd7da26e3235ad995e/16:9/w_1280,c_limit/gray-living-room-01.jpg"),
          ),

          //---------CARD 1-------------------
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.lightbulb,
                      color: lightBulbColor,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Text(
                        "Lights",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(lightsStatus),
                  ],
                ),
                Column(
                  children: [
                    Switch(
                      value: lightsOn,
                      onChanged: _lightsSwitched,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Slider(
                      min: 0,
                      max: 1,
                      value: lightsSliderValue,
                      onChanged: (!lightsOn ? null :_lightsSliderFunction), /*onChanged is either calling the function or set to null depending on if lightsOn is true/false*/
                    ),
                  ],
                ),
              ],
            ),
          ),

          //--------CARD 2---------------
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: acColor,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Text(
                        "AC",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(acStatus),
                  ],
                ),
                Column(
                  children: [
                    Switch(
                      value: acOn,
                      onChanged: _acSwitched,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Slider(
                      min: 5,
                      max: 25,
                      value: acSliderValue,
                      onChanged: (!acOn ? null :_acSliderFunction), /*onChanged is either calling the function or set to null depending on if acOn is true/false*/
                    ),
                  ],
                ),
              ],
            ),
          ),

          //-------CARD 3---------------
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.speaker,
                      color: audioColor,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Text(
                        "Audio",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(audioStatus),
                  ],
                ),
                Column(
                  children: [
                    Switch(
                      value: audioOn,
                      onChanged: _audioSwitched,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Slider(
                      min: 0,
                      max: 1,
                      value: audioSliderValue,
                      onChanged: (!audioOn ? null :_audioSliderFunction), /*onChanged is either calling the function or set to null depending on if audioOn is true/false*/
                    ),
                  ],
                ),
              ],
            ),
          ),


        ],
      ),

       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
