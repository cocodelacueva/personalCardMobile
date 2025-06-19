# personal_card_mobile_app

La arme para aprender a usar flutter. Es una aplicación que muestra tu información y un QR con 

## Comandos: 

* instalar: flutter pub get
* Agregar dependencia flutter pub add dependencia
* Correr: flutter run
* construir android: flutter build appbundle

## Android


En una aplicación Flutter, los íconos y la información específica para Android se configuran en el archivo AndroidManifest.xml y en el directorio res. Aquí te explico cómo configurarlos:

1. Configurar el ícono de la aplicación
El ícono de la aplicación se coloca en el directorio android/app/src/main/res/mipmap-*. Flutter utiliza diferentes tamaños de íconos para distintas densidades de pantalla (mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi).

Pasos:
Reemplazar los íconos predeterminados:

Coloca tus archivos de íconos en los siguientes directorios:
Generar íconos automáticamente:

Usa la herramienta Flutter Launcher Icons para generar íconos automáticamente:
Agrega la dependencia en tu pubspec.yaml:
Ejecuta el comando:
2. Configurar el nombre de la aplicación
El nombre de la aplicación se configura en el archivo AndroidManifest.xml.
Pasos:
Abre el archivo AndroidManifest.xml.
Busca la etiqueta <application> y modifica el atributo android:label:

3. Configurar permisos
Si tu aplicación necesita permisos (por ejemplo, acceso a Internet), agrégalos en el archivo AndroidManifest.xml dentro de la etiqueta <manifest>:

4. Configurar la versión de la aplicación
La versión de la aplicación se configura en el archivo android/app/build.gradle.
Pasos:
Abre el archivo android/app/build.gradle.
Busca las siguientes líneas y modifica los valores según sea necesario:

5. Configurar el nombre del paquete
El nombre del paquete se configura en el archivo AndroidManifest.xml y en el archivo build.gradle.

Pasos:
Modifica el atributo package en el archivo AndroidManifest.xml:

Modifica el applicationId en el archivo android/app/build.gradle:
Resultado esperado:
Después de realizar estos pasos, tu aplicación tendrá un ícono personalizado, un nombre configurado, permisos necesarios, y estará lista para ser ejecutada o publicada en Google Play.

### firmar la app

**MAC:**
```bash
/Applications/Android\ Studio.app/Contents/jbr/Contents/Home/bin/keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

Hay que crear un archivo que se llama key.properties en la raiz de la carpeta android:
android/key.properties
Este archivo debería tener estos datos

```bash
storePassword=ESTA ES LA CLAVE QUE SE PUSO ANTES
keyPassword=ESTA ES LA CLAVE QUE SE PUSO ANTES
keyAlias=upload
storeFile=/Users/coco./upload-keystore.jks > la dirección donde se guardo el archivo.
```

Luego se puede construir la app:

```bash
flutter build appbundle --release
```