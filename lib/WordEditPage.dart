import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:text_flutter_player/VideoPreviewPage.dart';

class WordEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WordEditState();
  }
}

class WordEditState extends State<WordEdit> {
  String fileName = '...';
  String path = '...';
  String extension;
  bool hasValidMime = false;
  FileType pickingType;
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => extension = controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
              icon: new Text("Next"),
              iconSize: 80,
              onPressed: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (context) => new VideoPreview()),
                );
              },
            ),
          ],
        ),
        body: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: [
              new Container(
                child: new TextField(
//                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  style: new TextStyle(fontSize: 30.0, color: Colors.blue),
                  decoration: new InputDecoration(
                    hintText: 'type something',
                  ),
                ),
              ),
              new Container(
                child: new IconButton(
                  iconSize: 60,
                  icon: new Icon(Icons.add_circle_outline),
                  onPressed: () => openFileExplorer(),
                ),
              )
            ])),
      ),
    );
  }

  void openFileExplorer() async {
    if (pickingType != FileType.CUSTOM || hasValidMime) {
      try {
        path = await FilePicker.getFilePath(
            type: pickingType, fileExtension: extension);
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        fileName = path != null ? path.split('/').last : '...';
      });
    }
  }
}
