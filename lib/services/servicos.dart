// classe responsavel pelas operações de consulta e preços dos banhos

import 'package:bestbanho/services/estabelecimento.dart';
import 'package:flutter/material.dart';

class Servico{
  late String nomeEstabelecimento;                  // nome do estabelecimento
  late double distancia;                             // distancia até a casa do cliente do estudo de caso
  late int precoBanhoPequeno;                     // preço do banho de cães pequenos
  late int precoBanhoGrande;                      // preço do banho de cães grandes
 // List<String> diasFuncionamento = <String>["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];          // lista de dias que o estabelecimento funciona
  late Estabelecimento M;   // dias uteis pequenos 20 e grandes 40 fim de semana aumenta 20%
  late Estabelecimento V;           // dias uteis pequenos 15 e grandes 50 fim de semana 20 e grandes 55
  late Estabelecimento C;      // preço fixo para pequenos 30 e grandes 45 
  int Mvalor = 0;
  int Vvalor = 0;
  int Cvalor = 0;
  String Resultado = "";
  int melhorPreco = 0;


    String get getResultado{
    return this.Resultado;
  }

    Servico();

 
  void setResultado(String t){
    this.Resultado = t;
  }
  
  // ignore: non_constant_identifier_names
  void ConsultarBestBanho(String diaBanho, int quantPequeno, int quantGrande ){         // recebe o dia do banho, quantidade de cães pequenos e a quantidade de cães grandes
           

            
            
            M = Estabelecimento("Meu Canino Feliz", 2000, 20, 40); // dias uteis pequenos 20 e grandes 40 fim de semana aumenta 20%
            V = Estabelecimento("Vai Rex", 1700, 15, 50);          // dias uteis pequenos 15 e grandes 50 fim de semana 20 e grandes 55
            C = Estabelecimento("ChowChawgas", 800, 30, 45);       // preço fixo para pequenos 30 e grandes 45  // distancia em metros m  

            // Atribuição de preços aos banhos
            M.setValorBanho(20,40);
            V.setValorBanho(15,50);
            C.setValorBanho(30,45);


                    
                    // Se o banho for solicitado no fim de semana então para o M acrescente uma porcentagem em cima dos banhos
                    if((diaBanho == "Saturday") || (diaBanho == "Sunday")){ 
              
                       Mvalor = (M.getValorCaesPequenos * quantPequeno) + (M.getValorCaesGrandes * quantGrande);
                             M.setValorTotalBanho((Mvalor + (Mvalor * 20 / 100)) as int);

                       Vvalor = ((V.getValorCaesPequenos + 5) * quantPequeno) + ((V.getValorCaesGrandes + 5) * quantGrande);
                             V.setValorTotalBanho(Vvalor);

                      // preço fixo independente do dia do Banho
                      Cvalor = ((C.getValorCaesPequenos * quantPequeno) + (C.getValorCaesGrandes * quantGrande)) as int;
                             C.setValorTotalBanho(Cvalor);
                    
                    }else{

                             Mvalor = (M.getValorCaesPequenos * quantPequeno) + (M.getValorCaesGrandes * quantGrande);
                             M.setValorTotalBanho(Mvalor);

                             Vvalor = (V.getValorCaesPequenos * quantPequeno) + (V.getValorCaesGrandes * quantGrande);
                             V.setValorTotalBanho(Vvalor);

                             // preço fixo independente do dia do Banho
                             Cvalor = ((C.getValorCaesPequenos * quantPequeno) + (C.getValorCaesGrandes * quantGrande)) as int;
                             C.setValorTotalBanho(Cvalor);
                                
                    }
                    // Verificação melhor preço do banho
                    var ListaPrecosBanhos = [M.getValorTotalBanho, V.getValorTotalBanho, C.getValorTotalBanho];
                    
                    
                    var menorPreco = ListaPrecosBanhos[0];

                    for (var i = 0; i < ListaPrecosBanhos.length; i++) {
                            
                            
                             if (ListaPrecosBanhos[i] < menorPreco) {
                                  menorPreco = ListaPrecosBanhos[i];
                              }
                              melhorPreco = menorPreco;
                            }

                      
                    if(M.getValorTotalBanho == melhorPreco){
                      Resultado = "Melhor Local : "+M.getNomeEstabelecimento+"\n"+"Valor Total : "+M.getValorTotalBanho.toString()+"R\$"+"\n"+"Distância : "+M.getDistancia.toString()+"m";
                    } 
                    if(V.getValorTotalBanho == melhorPreco){
                      Resultado = "Melhor Local : "+V.getNomeEstabelecimento+"\n"+"Valor Total : "+V.getValorTotalBanho.toString()+"R\$"+"\n"+"Distância : "+V.getDistancia.toString()+"m";
                    } 
                    if(C.getValorTotalBanho == melhorPreco){
                      Resultado = "Melhor Local : "+C.getNomeEstabelecimento+"\n"+"Valor Total : "+C.getValorTotalBanho.toString()+"R\$"+"\n"+"Distância : "+C.getDistancia.toString()+"m";
                    }
                

  }

}
//