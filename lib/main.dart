import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextEditingController _numberControllerN = TextEditingController();
  var _result = "Kết quả kiểm tra...";

  void checkNumber() {
    int numberN = int.tryParse(_numberControllerN.text) ?? 0;
    int dem=0;

    if(numberN<2){
      _result = "Số bạn nhập không phải là số nguyên tố!";
    }else{
      for(int i=1;i<numberN;i++){
        if(numberN/i==0){
          dem++;
        }
      }
      if(dem==1){
        _result = "Số bạn nhập chính là số nguyên tố!";
      }else{
        _result = "Số bạn nhập không phải là số nguyên tố!";
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiểm tra số nguyên tố - Trần Bá Thiện',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImageField(),
              buildTextFiled(),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "$_result",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            checkNumber;
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            '+',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ],
    );
  }

  Widget buildTextFiled() {
    String value = '';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
          child: TextFormField(
            controller: _numberControllerN,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nhập số cần kiểm tra...',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageField() {
    String value = '';
    return Column(
      children: [
        Image.network(
          'https://kienthuctonghop.vn/wp-content/uploads/2021/09/so-nguyen-to-la-gi-1.jpg',
          width: 250,
        ),
      ],
    );
  }
}