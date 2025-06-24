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

Ajustar la version, ya que android no quiere que haya dos archivos con la misma version. Esto se agrega en el archivo buid.gradle.kts

Luego se puede construir la app:

```bash
flutter build appbundle --release
```

## IOS

Para subir la app a app Store y utilizarla en iphone es necesario una mac con Xcode instalado, hay que seguir estos pasos:

1. Asegúrate de tener Mac, Xcode y una cuenta de desarrollador de Apple.
```bash
xcode-select --install
```
2. Abre ios/Runner.xcworkspace en Xcode.
El proyecto incluye una carpeta IOS, abrir la carpeta en la terminal y ejecutar:
```bash
open Runner.xcworkspace
```
3. Configura el "Signing & Capabilities" (selecciona tu equipo y verifica el Bundle Identifier).
4. Si tu app usa funcionalidades sensibles, añade las descripciones de privacidad en Info.plist.
5. Construye la IPA con flutter build ipa --release. **Conviene hacerlo desde xcode Product > Archive
6. Sube la IPA a App Store Connect usando Transporter o la función de "Distribute App" en Xcode.
7. Utiliza TestFlight para las pruebas beta.

### Modificar el Icono de la Aplicación

Para cambiar el icono que se muestra en la pantalla de inicio de iOS:
En Xcode, en el "Project Navigator" (panel izquierdo), expande la carpeta Runner.

Busca y selecciona el archivo Assets.xcassets.

Dentro de Assets.xcassets, encontrarás un conjunto de imágenes llamado AppIcon. Haz clic en él.

Verás una cuadrícula de espacios para iconos de diferentes tamaños (2x, 3x, para iPhone, iPad, App Store, etc.). Cada espacio está etiquetado con las dimensiones requeridas.

Arrastra y suelta tus archivos de imagen PNG correspondientes a cada tamaño en el espacio adecuado. Asegúrate de que las dimensiones de tus imágenes coincidan con las que Xcode solicita (por ejemplo, 180x180 px para "iPhone App iOS 8-10 60pt @3x").

Asegúrate de reemplazar todos los iconos necesarios para cubrir los diferentes dispositivos y densidades. Puedes usar herramientas online o plugins de Flutter como flutter_launcher_icons para generar automáticamente estos tamaños desde una sola imagen de alta resolución.

Cómo usar flutter_launcher_icons para generar los iconos:
Este paquete simplifica el proceso de generar todos los tamaños de icono necesarios para iOS y Android a partir de una única imagen.

Añade la dependencia:
Abre tu archivo pubspec.yaml (en la raíz de tu proyecto Flutter) y añade flutter_launcher_icons en la sección dev_dependencies:

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  flutter_launcher_icons: "^0.13.1" # Asegúrate de usar la versión más reciente

Guarda el archivo y ejecuta flutter pub get en la terminal.

Configura el icono en pubspec.yaml:
Añade una nueva sección flutter_launcher_icons en el mismo archivo pubspec.yaml, especificando la ruta a tu imagen original del icono y las plataformas para las que quieres generarlos. Se recomienda una imagen cuadrada de al menos 1024x1024 píxeles.

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/launcher_icon.png" # Cambia esta ruta a tu imagen
  # adaptive_icon_background: "#ffffff" # Opcional: para iconos adaptativos de Android (fondo)
  # adaptive_icon_foreground: "assets/icon/foreground.png" # Opcional: para iconos adaptativos de Android (primer plano)

android: true: Genera iconos para Android.

ios: true: Genera iconos para iOS.

image_path: La ruta a tu imagen original (PNG preferentemente) dentro de tu proyecto Flutter. Si aún no tienes una carpeta assets/icon, créala y coloca tu imagen allí.

Ejecuta el comando para generar los iconos:
En tu terminal, desde la raíz del proyecto Flutter, ejecuta:

flutter pub run flutter_launcher_icons