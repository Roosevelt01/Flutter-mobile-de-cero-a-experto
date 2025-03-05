void main() {
 //Inferencia de Tipo con var
 var myname = "Fernando"; // Infiere String 
 print(myname);
  
 //Tipo Explícito
 String myname2 = "Fernando"; // Infiere String 
 print(myname2);
  
 //Variables Inmutables con final
 final myName3 = "Fernando"; // myName no puede cambiar su valor
 print(myName3); 
  
 //Constantes con const
 const myName4 = "Fernando"; // myName es una constante 
 print(myName4);
 
  //Inicialización Tardía
  late final String myName5; // 
  myName5 = "Tu Nombre";
  print(myName5);
  
}
