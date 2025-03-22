void main() {
  
  //dynaymic == null
  dynamic errorMessage = 'hola';
  errorMessage = true;
  errorMessage = [1,2,3,4,5,6];
  errorMessage = {1,2,3,4,5,6};
  errorMessage = () => true;
  errorMessage = null;
  
      
  print("""
      $errorMessage  
  """);
}
