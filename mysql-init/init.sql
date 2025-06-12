create database if not exists lista_tareas_db;

USE lista_tareas_db;

CREATE TABLE IF NOT EXISTS tareas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    completada BOOLEAN DEFAULT FALSE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tareas (descripcion) VALUES ('Comprar pan');
INSERT INTO tareas (descripcion, completada) VALUES ('Hacer ejercicio', TRUE);

