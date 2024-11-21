# Usa una imagen base de Node.js
FROM node:18-alpine

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos de configuración de dependencias (package.json y package-lock.json)
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto del código de la aplicación
COPY . .

# Compila la aplicación Angular
RUN npm run build

# Expone el puerto 4200 para que sea accesible fuera del contenedor
EXPOSE 4200

# Comando para iniciar la aplicación Angular con --host 0.0.0.0
CMD npm start -- --host 0.0.0.0
