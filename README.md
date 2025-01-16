# Flutter Cookbook App

por David Mauricio Chay Marin

## Introducción

Esta es una aplicación hecha con fines de aprendizaje, como una practica de la **Universidad Tecnológica Metropolitana** siendo parte de la materia **Desarrollo de Móvil Multiplataforma**. El presente repositorio contiene todos los elementos necesarios para poder modificar la aplicación, así como poderla instalar en un dispositivo movil por medio del APK generado.
La aplicación forma parte de las practicas que podemos encontrar en la página web de flutter conocida como "Cookbook", la cual se puede encontrar en [flutter docs](https://docs.flutter.dev/cookbook).
En la presente actividad podrá encontrar una aplicación móvil desarrollada con la herramienta **Flutter** y su lenguaje **Dart** que contiene los elementos de practica que se encuentran en la guía anteriormente mencionada. En la guia se puede encontrar muchas instrucciones para distintos tipos de situaciones, pero para esta actividad se han elegido los siguientes:

- **Design**: Diseños, tipografias, paleta de colores e interfaz de usuario (UI) personalizadas.
- **Forms**: Formularios con campos obligatorios y opcionales como contraseña o correo.
- **Images**: Insersión de imagenes por medio de la web, y utilización de placeholders para la carga de imagenes.
- **Lists**: Diferentes formas de agrupar los objetos como en grids, listas horizontales, espaciado o barras flotantes.
- **Navigation**: Difrentes formas de interactuar y navegar entre pantallas.

Para la elaboración de está aplicación se utilizaron las siguientes herramientas que deben tomarse en consideración para futuros cambios o trabajos en otras máquinas.

### Especificaciones del equipo

- **Máquina**: Laptop Acer Aspire 3 A315
- **RAM**: 4GB DDR4
- **Espacio en disco**: 1TB
- **Procesador**: Intel Core i3
- **Sistema Operativo**: Ubuntu MATE

### Especificaciones de las herramientas

- **Versión de JAVA**: Java 17 (openJDK-17-JDK)
- **IDE**: Visual Studio Code
- **Lenguaje**: Flutter - Dart
- **SDK de Android**: commandlinetools-linux-11076708
- **Controlador de versiones**: Git - GitHub

## Descarga del Repositorio
Para descargar este repositorio y todos los elementos que contiene, necesitara tener instalado todo en lo que en el punto anterior se menciona y los requerimientos minimos para poder ejecutar su entorno de desarrollo.
Cuanto esté listo para acontinuar, tendrá que abrir la terminal de su equipo y dirigirse a la ubicación donde se desea duplicar el repositorio, para ello ejecutará el siguiente comando en su terminal:

`git clone https://github.com/DavidMChay/flutter-cookbook.git`

Una vez que se haya terminado de instalar todas las dependencias del repositorio, abra su IDE de preferencia y espere a que la configuración de SDK y Grandle se termine de ejecutar para poder comenzar a editar el programa.

## Estructura

La aplicación se divide en 5 apartados y una página principal, las cuales aparecen como `main.dart`, `design.dart`, `images.dart`, `forms.dart` y `lists.dart`. 
`main.dart` es la página principal cuando la aplicación se ejecuta y en ella encontrá que las demás páginas son importadas y se crea una lista con diferentes opciones para poder acceder a cada una de ellas y ver sus funcionalidades que se describen en el **Cookbook** de Flutter.

> Nota: Hay que tomar en cuenta que `main.dart` contiene **MaterialApp** la cual puede ser utilizada para diversas funciones en las demás o nuevas ventanas, como en el caso de `navigation.dart` donde las rutas están definidas en la ventana principal y navigation solamente accede a ellas por medio de las rutas, más adelante se explica mejor.

### design.dart

Es la primera opción y contiene 7 elementos diferentes para probar:

- **Exportar fuentes desde un paquete**:
  - Esta opción permite visualizar el cambio de la tipografia por medio de paquetes Dart publicados en [Dart Packages](https://puv.dev).
- **Agregar un cajón a una pantalla**:
  - Esta opción le mostrará una nueva ventana donde visualizará en la esquina superior izquierda un icono de barra de menú hamburguesa, lo cual desplegará un cajón desde el lado izquierdo de la pantalla con dos opciones.
- **Actualizar UI segun la orientación**:
  - Esta opción le permitirá ver que la aplicación reconoce cuando el dispositivo se encuentra sujetado de forma horizonal o vertical por medio de un texto en pantalla.
- **Trabajar con pestañas**:
  - Esta opción le mostrará una ventana donde visualizará una interfaz de usuario con 3 pestañas para elegir y cada una con sus contenidos-
- **Usar fuente personalizada**:
  - Esta opción le permite visualizar el cambio de la tipogtafia por medio de un archivo .tff instalado de forma local en `assets/fonts` y declarado en `pubsec.yaml`, en este caso, se instaló la tipografía **TitlWarp-Regular.tff** 
- **Mostrar SnackBar**:
  - Esta opción le mostrará un botón que al presionarlo, le mostrará una notificación en la parte inferior de la pantalla dentro de la app, conocida tambien como "SnackBar".
- **Usar temas para compartir colores y estilos**:
  - Esta opción le permite mostrar temas y colores personalizados diferentes al declarar uno principal para toda la aplicación.

### images.dart

Es la segunda opción y está mostrará una ventana nueva con 2 opciones de imagenes, utilizando una imagen de referencia ([Esta imagen](https://m.web.umkc.edu/mkakh3/assignment3/images/nature_300x300.jpg)) de 300 x 300 pixeles.

- **Imagenes desde Internet**:
  - Se configura de donde se extraerá la imagen y se cargará, sin embargo el contenido que esté debajo de la imagen, estará en el lugar de la imagen hasta que esta se haya cargado correctamente.
- **Efecto de desvanecimiento (Fade-in)**:
  - Se configura un placeholder para ocupar el espacio de la imagen que se extrae desde la web para que el contenido siga en su lugar en vez de ocupar el lugar de la imagen que se quiere agregar, para ello se configura la imagen de forma local en `assets/`, cuando la imagen se vaya vargando, se irá desvaneciendo el placeholder asignado.

### lists.dart

Es la tercera opción que muestra en 5 secciones diferentes formas de listado de elementos.

- **Lista en cuadrícula (Grid List)**:
  - Muestra 6 items enlistados por medio de cuadriculas.
- **Lista Horizontal**:
  - Muestra una lista de 10 elementos organizada de forma horizontal y que es desplazable para poder visualizar todos los elementos.
- **Lista con diferentes tipos de elementos**:
  - Muestra una lista verticual con diferentes tipos de elementos como música, imagenes o videos.
- **Barra de aplicación flotante sobre una lista**:
  - Muestra una lista en un espacio designado que puede ser desplazado para ver los demás elementos, pero al hacer scroll hacía arriba se sobrepone la barra de aplicación, al hacer scroll hacía abajo esta se esconde.
- **Lista con elementos espaciados**
  - Muestra una lista con separaciones para poder limitar los elementos.
 
### forms.dart

Es la cuarta opción que muestra un pequeño formulario con diferentes campos simulando un inicio de sesión de aplicación. Cada campo cuenta con un icono de lado izquierdo con una placeholder. Además de que hay campos obligatorios y otros no obligatorios que se remarcarán cuando haces clic en el botón y no están todos los campos llenos, si llenase todo, se muestra un SnackBar con la información introducida en los primeros campos, esto para mostrar que la información se envía correctamente en caso de querer integrar una API por ejemplo.

- **Campo de nombre (obligatorio)**
- **Campo de correo (obligatorio)**
- **Campo de contraseña (obligatorio, secreto)**
- **Campo de texto (opcional)**

### navigate.dart

Es la quinta y utima opción que muestra dentro de una ventana 6 opciones para provar la navegación entre ventanas.
- **Navegar a segunda ventana**:
  - Muestra la siguiente pantalla por medio de una consulta directa.
- **Navegar con ruta nombrada**:
  - Muestra la siguiente pantalla por medio de una definición de rutas en MaterialApp.
- **Pasar argumentos**:
  - Muestra la siguiente pantalla pasando un argumento por medio de rutas definidas en MaterialApp, la siguiente pantalla muestra lo que se pasa como argumento desde la primera.
- **Devolver datos**:
  - Muestra una ventada con un botón que al pulsarlo te regresa a la pantalla anterior y muestra un SnackBar para poder simular que se devuelven algun tipo de datos.
- **Enviar datos**:
  - Muestra una ventana con la leyenda "datos enviados" para simular el envio de datos a alguna API.
- **Animar widget entre pantallas**:
  - Muestra una ventana con una animación suave de transición de por medio.

## Instalar aplicación APK en Android

Para instalar la aplicación, es necesario entrar a este repositorio y dirigirse a la carpeta **apk**, desde el dispositivo movil, selecciona la opción de **descargar archivo**, una vez descargado, desde tu gestor de archivos, instala el paquete APK y espera a que se muestre un mensaje de instalción exitosa.
Ahora puedes abrir la aplicación y usarla.
