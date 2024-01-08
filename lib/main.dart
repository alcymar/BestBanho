import 'dart:io';
import 'package:bestbanho/services/servicos.dart';
import 'package:bestbanho/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     debugShowCheckedModeBanner:
    false;

    return MaterialApp(
      title: 'Best Banho',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
 @required TextEditingController ct_data_banho = TextEditingController();
 @required TextEditingController ct_quant__caes_pequenos = TextEditingController();
 @required  TextEditingController ct_quant_caes_grandes = TextEditingController();

   late int quantCaesPequenos;
   late int quantCaesGrandes;

  late String diaSemana;
  late String diaEscolhido;
  late Servico servico; 

   final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  @override
  void initState() {
    ct_data_banho.text = ""; 
    ct_quant__caes_pequenos.text = "";
    ct_quant_caes_grandes.text = "";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    servico = Servico();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1cb4ec),
        title: Text("Best Banho", style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: Icon(Icons.home, color: Colors.white, size: 28),
        actions: [

          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () => exit(0),
          ),
      ],
      ),
      
      body: Form(
        key: _formKeyValue,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          children: <Widget>[
            SizedBox(height: 10.0),

            
            TextField(
              keyboardType: TextInputType.datetime,
              controller: ct_data_banho,
              decoration: const InputDecoration(
                 enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.cyan),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                   ),
                   
                     
                icon: Icon(
                  Icons.date_range,
                  color: Color(0xff1cb4ec),
                ),
                labelText: 'Qual a data do banho?',
                labelStyle: TextStyle(color: Color(0xff1cb4ec)),
              ),
                
           onTap: () async {

                      DateTime? dataBanho = await showRoundedDatePicker(
                       context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(2021),
                       lastDate: DateTime(2025),
                       borderRadius: 10,
                       theme: ThemeData.light().copyWith(
                        primaryColor: const Color(0xff1cb4ec),
                        hintColor: const Color(0xFF8CE7F1),
                        colorScheme: ColorScheme.light(primary: const Color(0xff1cb4ec)),
                        buttonTheme: ButtonThemeData(
                        textTheme: ButtonTextTheme.primary
                        ),
                       ),
                       );

                  if(dataBanho != null ){ 
                      String formattedDate = DateFormat('dd-MM-yyyy').format(dataBanho);
                      diaSemana = DateFormat('EEEE').format(dataBanho).toString();

                      setState(() {
                        ct_data_banho.text = formattedDate;
                        diaEscolhido = diaSemana;
                        
                      }); 
                  }
            },
            ),

             TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                 enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.cyan),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                   ),  
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Color(0xff1cb4ec),
                ),
                labelText: 'Quantos cães pequenos?',
                labelStyle: TextStyle(color: Color(0xff1cb4ec)),
              ),
              controller: ct_quant__caes_pequenos,
            ),

             TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                 enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.cyan),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                   ), 
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Color(0xff1cb4ec),
                ),
                labelText: 'Quantos cães grandes?',
                labelStyle: TextStyle(color: Color(0xff1cb4ec)),
              ),
              controller: ct_quant_caes_grandes,
            ),

  
            
          ],
        ),
        
          ),

          
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff1cb4ec),
        onPressed: () => {
          
          
          
          quantCaesPequenos =  int.parse(ct_quant__caes_pequenos.text),
          quantCaesGrandes =   int.parse(ct_quant_caes_grandes.text),
          
          

          servico.ConsultarBestBanho(diaSemana, quantCaesPequenos, quantCaesGrandes),
          ExibeResultado(context),
          

        },
        
        child: const Icon(Icons.search, color: Colors.white, size: 28),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  // exibe a caixa de dialogo com as informações
     void ExibeResultado(BuildContext context) {
  // configura os botões
  
  Widget btn_voltar = Container(
    child:Column(
      children: [
       IconButton(
         icon: Icon(Icons.arrow_back, color: Colors.white),
         onPressed: (){
           Navigator.pop(context);
         },
       ),
       Text("Voltar", style: TextStyle(color: Colors.white)),
      ],
    ),
  );


  // configura o  AlertDialog
  AlertDialog alert = AlertDialog(
    
    backgroundColor: Color(0xff1cb4ec),
    title: Text("Resultado", style: TextStyle(color: Colors.white)),

    content: Text(servico.getResultado,
                   style: TextStyle(color: Colors.white)),
    actions: [
      btn_voltar,
    ],
  );
  // exibe o dialogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}          

}
