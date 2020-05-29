# Create jar Archiv to run processing from java-Source
# 1.) you need the core.jar file in this folder
# 2.) you need the package and classes inside this folder
# 3.) change the variables below to fit your package, main-class and classes

JAR_FILE=Myjar.jar
JAR_PROG=~/jdk-11/bin/jar
JAVA_PROG=~/jdk1.8.0_152/bin/java
JAVAC_PROG=~/jdk1.8.0_152/bin/javac
JAVA_PACK=
JAVA_CLASSES=*.class
JAVA_MAIN_CLASS=MainClass

echo "Class-Path: lib/core.jar" > manifest.txt
if [ -z "$JAVA_PACK" ] # is empty
then
  echo "Main-Class: $JAVA_MAIN_CLASS" >> manifest.txt
  $JAVAC_PROG -cp ./core.jar $JAVA_MAIN_CLASS.java
  $JAR_PROG -cvfm $JAR_FILE manifest.txt $JAVA_CLASSES
else
  echo "Main-Class: $JAVA_PACK.$JAVA_MAIN_CLASS" >> manifest.txt
  $JAVAC_PROG -cp ./core.jar $JAVA_PACK/$JAVA_MAIN_CLASS.java
  $JAR_PROG -cvfm $JAR_FILE manifest.txt $JAVA_PACK/$JAVA_CLASSES
fi

mkdir dist
cd dist
mv ../$JAR_FILE .
mkdir lib
cp ../core.jar ./lib/
rm ../manifest.txt
if [ -z "$JAVA_PACK" ] # is empty
then
  $JAVA_PROG -jar $JAR_FILE
else
  $JAVA_PROG -jar $JAVA_PACK.$JAR_FILE
fi
