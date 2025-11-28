# Paquexpress Móvil: Aplicación de Agentes de Entrega

Proyecto desarrollado en Flutter y FastAPI para la gestión de entregas y trazabilidad de paquetes.

## Estructura del Proyecto

* **`app_flutter/`**: Código fuente de la aplicación móvil.
* **`api_fastapi/`**: Código fuente del backend REST.
* **`script_db.sql`**: Script de la base de datos MySQL.

## Requisitos Previos

* Flutter SDK (Versión X.X.X)
* Python 3.8+ y pip
* MySQL o MariaDB Server

## Instalación y Uso (Instrucciones de Despliegue)

### 1. Base de Datos (MySQL)

1.  Crea la base de datos `paquexpress_db` en tu servidor MySQL.
2.  Ejecuta el contenido del archivo `script_db.sql`.

### 2. Backend (FastAPI)

1.  Navega a la carpeta `api_fastapi/`.
2.  Instala las dependencias: `pip install -r requirements.txt` (lo crearemos después).
3.  Ejecuta el servidor: `uvicorn main:app --reload` (ajusta la configuración de la BD).

### 3. Aplicación Móvil (Flutter)

1.  Navega a la carpeta `app_flutter/`.
2.  Instala las dependencias: `flutter pub get`.
3.  Ajusta la URL de la API en el código fuente (`lib/config.dart`).
4.  Ejecuta en un dispositivo o emulador: `flutter run`.

