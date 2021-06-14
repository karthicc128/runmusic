import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final player=AudioPlayer();
  List songs=[1,2,3,4,5,6,7,8,9];

  var link="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3";
int _value=1;


  void playaudio(int n) async {
    try {
      link="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-$n.mp3";
    player.play(link);

    }
    catch (e){
      print("sorry");
    }

  }




  void pauseAudio () async {

    await  player.pause();

  }


  void resumeAudio () async {

    await  player.resume();

  }
void stopaudio () async {
    await player.stop();
}



Color play=Colors.green;
  Color stop=Colors.red;
  Color resume=Colors.yellow;
  Color pause=Colors.blueAccent;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("RUN MUSIC"),
          ),
          body: Center(
            child: Column(children: [
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: play,
                 ),
                child: Text("play"),
                onPressed: (){
                  playaudio(_value);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: pause,
                ),
                child: Text("pause "),
                onPressed: (){
                  pauseAudio();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: resume,
                ),
                child: Text("resume"),
                onPressed: (){
                  resumeAudio();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: stop,
                ),
                child: Text("stop"),
                onPressed: (){
                  stopaudio();
                },
              ),
             Container(
              child: DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem(child: Text("song1"),value: 1,),
                  DropdownMenuItem(child: Text("song2"),value: 2,),
                  DropdownMenuItem(child: Text("song3"),value: 3,),
                  DropdownMenuItem(child: Text("song4"),value: 4,),
                  DropdownMenuItem(child: Text("song5"),value: 5,),
                  DropdownMenuItem(child: Text("song6"),value: 6,),
                ],
                onChanged: (value){
                  setState(() {
                    _value=value;
                  });
                },
              ),
              ),


            ]),
          )
      ),
    );
  }
}

