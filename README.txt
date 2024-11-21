Pasos a seguir en la parte del cliente:

# Proyecto Docker con Debian, Apache, Node.js y Angular

Este proyecto configura un contenedor Docker con Debian, Apache, Node.js y Angular. Incluye instrucciones para construir y correr la imagen Docker, así como para montar volúmenes para desarrollo.



Para construir la imagen Docker, sigue estos pasos:

1. Clona este repositorio en tu máquina local.
2. Navega al directorio del proyecto.
3. Ejecuta el siguiente comando para construir la imagen Docker:

   docker build -t nombre_de_tu_imagen .


1---npm install socket.io-client	To install socket.io for our client app
2---npm run build	--Build de la parte de angular
3--npm run start	--Start de la parte de angular