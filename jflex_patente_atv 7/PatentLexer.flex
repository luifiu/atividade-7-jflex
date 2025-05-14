
%%

%public
%class PatentLexer
%unicode
%cup
%line
%column

%{
  private void printToken(String label, String content) {
    System.out.println(label + ": " + content.trim());
  }
%}

%%

<!--\s*United States Patent:\s*([0-9]+)\s*--> {
  printToken("Número da Patente", yytext().replaceAll("[^0-9]", ""));
}

<title>([^<]+)</title> {
  printToken("Título", yytext().replaceAll("<.*?>", ""));
}

Date of Patent:\s*</td>\s*<td[^>]*>\s*([^<]+) {
  printToken("Data de Publicação", yytext().replaceAll("<.*?>", ""));
}

<center><b>Abstract</b></center>.*?<p>(.*?)</p> {
  printToken("Resumo", yytext().replaceAll("<.*?>", ""));
}

<center><b>Claims</b></center>.*?<p>(.*?)</p> {
  printToken("Reivindicações", yytext().replaceAll("<.*?>", ""));
}

.|\n { /* Ignorar outros tokens */ }
