import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  TextEditingController input = new TextEditingController();

  double celcius = 0;
  double kelvin = 0;
  double reamur = 0;

  void konversi() {
    setState((){
      celcius = double.parse(input.text);
      kelvin = celcius + 273.15;
      reamur = celcius * 0.8;
    });
  }
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu")),
          body: Container(
            margin: const EdgeInsets.all(8),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                TextFormField(
                  controller: input,
                decoration: const InputDecoration(hintText: "Masukkan Suhu Dalam Celcius",),
                 keyboardType: TextInputType.number,
                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Suhu Dalam Kelvin",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "$kelvin",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Suhu Dalam Reamur",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "$reamur",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: konversi,
                    child: Text(
                      "Konversi Suhu",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ) 
          ),
        ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
