# Usa una imagen base de Debian
FROM debian:latest

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Instala Apache y Node.js
RUN apt-get update && apt-get install -y \
    apache2 \
    nodejs \
    npm

# Copia los archivos de configuración del servidor Node.js
COPY package*.json ./

# Instala las dependencias para el servidor Node.js
RUN npm install

# Instala Angular CLI de forma global
RUN npm install -g @angular/cli

# Cambia al directorio del cliente para instalar dependencias de Angular
WORKDIR /app/ExamenAngularTry1
COPY ExamenAngularTry1/package*.json ./
RUN npm install

# Vuelve al directorio del servidor y copia el resto de los archivos del proyecto
WORKDIR /app
COPY . .

# Instala 'concurrently' para ejecutar el servidor Node.js y Angular juntos
RUN npm install concurrently --save

# Configura Apache para que sirva en el puerto 80
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf
RUN a2enmod proxy proxy_http
RUN echo 'ProxyPass /node http://localhost:3000/' >> /etc/apache2/sites-available/000-default.conf
RUN echo 'ProxyPassReverse /node http://localhost:3000/' >> /etc/apache2/sites-available/000-default.conf

# Expone los puertos necesarios
EXPOSE 80 3000 4200

# Comando para ejecutar Apache y ambos procesos
CMD ["npx", "concurrently", "\"node server.js\"", "\"cd client && ng serve --host 0.0.0.0\"", "\"apachectl -D FOREGROUND\""]
