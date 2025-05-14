
#!/bin/bash
echo "Compilando com JFlex..."
java -jar jflex-1.9.1.jar PatentLexer.flex
echo "Compilando Java..."
javac PatentLexer.java Main.java
echo "Executando..."
java Main
