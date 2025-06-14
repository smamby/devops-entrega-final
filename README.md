# 📝 Lista de Tareas - DevOps CI/CD

Una aplicación web completa de lista de tareas (Todo App) construida con Node.js, Express y MySQL, completamente dockerizada con pipeline de CI/CD automatizado.

[![CI/CD](https://github.com/smamby/devops-entrega-final/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/smamby/devops-entrega-final/actions/workflows/ci-cd.yml)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://hub.docker.com/)

## 🌐 Demo en Vivo

**Aplicación desplegada:** [https://listatareas-d7fh.onrender.com/](https://listatareas-d7fh.onrender.com/)

## 🚀 Tecnologías Utilizadas

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Node.js, Express.js
- **Base de Datos:** MySQL (Local: Docker, Producción: SkySQL.com)
- **Contenerización:** Docker, Docker Compose
- **Testing:** Jest (pruebas unitarias e integración)
- **CI/CD:** GitHub Actions
- **Despliegue:** Render.com
- **Base de Datos Cloud:** SkySQL.com (conectada a Render)

## ✨ Características

- Interfaz de usuario simple e intuitiva
- Funcionalidades CRUD completas para tareas
- Persistencia de datos en MySQL
- Suite completa de pruebas automatizadas
- Pipeline de CI/CD con GitHub Actions
- Script interactivo para desarrollo
- Entorno consistente con Docker

## 📋 Requisitos Previos

- **Git:** Para clonar el repositorio
- **Docker Desktop:** Incluye Docker Compose necesario para los servicios
  - [Descargar Docker Desktop](https://www.docker.com/products/docker-desktop/)

⚠️ **Importante:** Docker Desktop debe estar ejecutándose antes de construir los contenedores.

## 🏃‍♀️ Instalación y Ejecución

### 1. Clonar el Repositorio

```bash
git clone https://github.com/smamby/devops-entrega-final.git
cd devops-entrega-final
```

### 2. Configurar Variables de Entorno

Crea un archivo `.env` en la raíz del proyecto con las variables de entorno necesarias para la base de datos:

```env
DB_PASSWORD=todopassword
MYSQL_ROOT_PASSWORD=rootpassword
DB_HOST=mysql_db
DB_USER=todouser
DB_PORT=3306
DB_NAME=lista_tareas_db
```

### 3. Ejecutar la Aplicación

#### Opción A: Script Interactivo (Recomendado)

```bash
# Linux/macOS
chmod +x deploy-dev-test.sh
./deploy-dev-test.sh

# Windows (Git Bash)
bash deploy-dev-test.sh
```

El script ofrece un menú con opciones para:
- Probar la aplicación completa
- Ejecutar tests unitarios
- Ejecutar tests de integración

#### Opción B: Docker Compose Manual

**⚠️ Consideraciones importantes para el manejo de logs y tests:**

##### Modo Attached (Sin flag -d) - Recomendado para desarrollo

Si **NO** se detachan los contenedores, se podrán ver los logs de los tests en tiempo real, pero se deberá matar el proceso manualmente al finalizar los mismos.

```bash
# Con logs visibles (recomendado para desarrollo)
docker-compose up --build
```

**Ventajas:**
- Logs visibles en tiempo real
- Ideal para debugging y desarrollo
- Tests se ejecutan automáticamente al iniciar

**Desventajas:**
- Requiere matar el proceso manualmente (Ctrl+C)
- Terminal queda ocupada

##### Modo Detached (Con flag -d) - Para ejecución en background

Si se detachan los contenedores (-d), los tests se ejecutarán en segundo plano y no se verán sus logs. Habrá que ejecutar los tests manualmente.

```bash
# En segundo plano
docker-compose up -d --build
```

**Para ejecutar tests manualmente en modo detached:**

```bash
# Acceder al contenedor de la aplicación
# Linux/macOS:
docker exec -it devops-entrega-final-app-1 bash

# Windows (usando winpty):
winpty docker exec -it devops-entrega-final-app-1 bash

# Dentro del contenedor, ejecutar los tests:
npm run test              # Tests unitarios
npm run test:integration  # Tests de integración
```

**Ventajas del modo detached:**
- Terminal libre para otros comandos
- Contenedores ejecutándose en background
- Control granular sobre cuándo ejecutar tests

**Desventajas:**
- Tests deben ejecutarse manualmente
- Logs no visibles por defecto

### 4. Acceder a la Aplicación

Una vez levantados los contenedores, accede a: [http://localhost:3000](http://localhost:3000)

## 🧪 Pruebas

La aplicación incluye pruebas completas que se ejecutan automáticamente:

### Usar el Script de Desarrollo

```bash
./deploy-dev-test.sh
```

Selecciona opción 2 para tests unitarios o 3 para tests de integración.

### Ejecutar Manualmente (Modo Detached)

```bash
# 1. Verificar que los contenedores estén ejecutándose
docker ps

# 2. Acceder al contenedor de la aplicación
# Linux/macOS:
docker exec -it devops-entrega-final-app-1 bash

# Windows (Git Bash con winpty):
winpty docker exec -it devops-entrega-final-app-1 bash

# 3. Dentro del contenedor, ejecutar tests específicos
npm test                  # Tests unitarios (alias)
npm run test             # Tests unitarios
npm run test:integration # Tests de integración

# 4. Salir del contenedor
exit
```

### Tipos de Tests Disponibles

- **Tests Unitarios:** Validan funciones y componentes individuales
- **Tests de Integración:** Validan la interacción entre componentes y API endpoints
- **Cobertura de Código:** Reportes automáticos de cobertura de pruebas

## 🔄 CI/CD Pipeline

El proyecto implementa un pipeline automatizado con GitHub Actions:

```
📝 CÓDIGO → 🧪 TESTS → 🐳 DOCKER → 🚀 RENDER
    ↓          ↓          ↓          ↓
 git push → npm test → docker → deploy
```

### Jobs del Pipeline:

1. **Build and Test (CI):** Instala dependencias y ejecuta pruebas
2. **Build Docker (CI):** Construye y sube imagen a Docker Hub
3. **Deploy (CD):** Despliega automáticamente a Render (solo branch main)

## ☁️ Infraestructura de Producción

- **Aplicación:** Render.com
- **Base de Datos:** SkySQL.com (conectada automáticamente a Render)

## 📁 Estructura del Proyecto

```
devops-entrega-final/
├── .github/workflows/     # Configuración CI/CD
├── __tests__/            # Pruebas unitarias e integración
├── mysql-init/           # Scripts de inicialización DB
├── public/               # Frontend (HTML, CSS, JS)
├── .env                  # Variables de entorno (crear manualmente)
├── app.js                # Aplicación Express
├── docker-compose.yml    # Configuración servicios
├── Dockerfile            # Imagen de la aplicación
├── deploy-dev-test.sh    # Script de desarrollo
└── package.json          # Dependencias Node.js
```

## 🛑 Detener la Aplicación

```bash
# Detener y eliminar contenedores
docker-compose down

# Detener, eliminar contenedores y volúmenes
docker-compose down -v

# Verificar que no hay contenedores ejecutándose
docker ps
```

## 🔧 Desarrollo

### Comandos Útiles

```bash
# Instalar dependencias localmente (opcional)
npm install

# Ejecutar pruebas localmente (requiere configuración local)
npm test

# Reconstruir contenedores con cambios
docker-compose up --build

# Ver logs de contenedores específicos
docker-compose logs app
docker-compose logs mysql_db

# Acceder a la base de datos MySQL directamente
docker exec -it devops-entrega-final-mysql_db-1 mysql -u todouser -p
```

### Flujo de Contribución

1. Fork del repositorio
2. Crear rama de feature: `git checkout -b feature/nueva-funcionalidad`
3. Realizar cambios y commits
4. Ejecutar pruebas localmente con `./deploy-dev-test.sh`
5. Push de la rama: `git push origin feature/nueva-funcionalidad`
6. Crear Pull Request a main

## 🐛 Debugging y Troubleshooting

### Problemas comunes:

**1. Contenedores no inician:**
```bash
# Verificar Docker Desktop esté ejecutándose
docker --version

# Limpiar contenedores y volúmenes
docker-compose down -v
docker system prune -f
```

**2. Tests fallan:**
```bash
# Verificar variables de entorno
cat .env

# Reiniciar contenedores
docker-compose restart
```

**3. Base de datos no conecta:**
```bash
# Verificar logs de MySQL
docker-compose logs mysql_db

# Verificar conexión desde la app
docker-compose logs app
```

## 👥 Equipo - Los Originales

- Christian J. Lemos
- Gabriela A. Peña
- Sebastián Rodriguez Mamby
- Martín Sciotti

## 📞 Soporte

Si encuentras algún problema, abre un [issue](https://github.com/smamby/devops-entrega-final/issues) en el repositorio.

---

**Docente:** Javier Blanco  
**Seminario de Actualización DevOps**