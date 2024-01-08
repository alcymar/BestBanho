
class Estabelecimento{
  
  late String nomeEstabelecimento;                  // nome do estabelecimento
  late double distancia;                             // distancia até a casa do cliente do estudo de caso
  late int precoBanhoPequeno;                     // preço do banho de cães pequenos
  late int precoBanhoGrande;                      // preço do banho de cães grandes
  late int valorTotalBanho;
  late int valorCaesPequenos;
  late int valorCaesGrandes;

  Estabelecimento(String nomeEstabelecimento, double distancia, int precoBanhoPequeno, int precoBanhoGrande){
       this.nomeEstabelecimento = nomeEstabelecimento;
       this.distancia = distancia;
       this.precoBanhoPequeno = precoBanhoPequeno;
       this.precoBanhoGrande = precoBanhoGrande;
       this.valorCaesPequenos = 0;
       this.valorCaesGrandes  = 0;
       this.valorTotalBanho = 0;
  }

  
  String get getNomeEstabelecimento{
    return this.nomeEstabelecimento;
  }

  double get getDistancia{
    return this.distancia;
  }

  int get getPrecoBanhoPequeno{
    return this.precoBanhoPequeno;
  }

  int get getPrecoBanhoGrande{
    return this.precoBanhoGrande;
  }

  int get getValorTotalBanho{
    return this.valorTotalBanho;
  }

  void setValorTotalBanho(int valor){
    this.valorTotalBanho = valor;
  }

  int get getValorCaesPequenos{
    return this.valorCaesPequenos;
  }

  int get getValorCaesGrandes{
    return this.valorCaesGrandes;
  }

  void setValorBanho(int precoBanhoPequeno, int precoBanhoGrande){
    this.valorCaesPequenos = precoBanhoPequeno;
    this.valorCaesGrandes = precoBanhoGrande;
  }

  void setAcrescimoPorcentagem(int preco){
        this.precoBanhoPequeno = preco;
        this.precoBanhoGrande = preco;
  }

  // Criar estabelecimentos do Estudo de Caso

   void CriarEstabelecimento(String nomeEstabelecimento, double distancia, int precoBanhoPequeno, int precoBanhoGrande){
       this.nomeEstabelecimento = nomeEstabelecimento;
       this.distancia = distancia;
       this.precoBanhoPequeno = precoBanhoPequeno;
       this.precoBanhoGrande = precoBanhoGrande;
    }

  // falta a criação de um metodo para exibir a lista
     


}
