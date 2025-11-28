-- Contenido de script_db.sql
CREATE DATABASE IF NOT EXISTS paquexpress_db;
USE paquexpress_db;

-- Tabla Agentes (Para Login y Seguridad)
CREATE TABLE Agentes (
    id_agente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE, 
    -- IMPORTANTE: Aquí se almacena el hash de la contraseña (Bcrypt)
    password_hash VARCHAR(255) NOT NULL, 
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Paquetes (Para la lista de Entregas Asignadas)
CREATE TABLE Paquetes (
    id_paquete INT AUTO_INCREMENT PRIMARY KEY,
    id_unico_paquete VARCHAR(50) NOT NULL UNIQUE, 
    direccion_destino VARCHAR(255) NOT NULL,
    id_agente_asignado INT,
    estado_entrega ENUM('ASIGNADO', 'ENTREGADO') DEFAULT 'ASIGNADO',
    FOREIGN KEY (id_agente_asignado) REFERENCES Agentes(id_agente)
);

-- Tabla RegistrosEntrega (Para la Evidencia de Entrega)
CREATE TABLE RegistrosEntrega (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_paquete INT NOT NULL UNIQUE, 
    id_agente INT NOT NULL,
    latitud DECIMAL(10, 8) NOT NULL,
    longitud DECIMAL(11, 8) NOT NULL,
    url_foto_evidencia VARCHAR(255) NOT NULL, 
    fecha_hora_entrega TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_paquete) REFERENCES Paquetes(id_paquete),
    FOREIGN KEY (id_agente) REFERENCES Agentes(id_agente)
);

-- IMPORTANTE: El hash de la contraseña '123456' DEBE ser generado con Bcrypt. 

INSERT INTO Agentes (nombre, email, password_hash) 
VALUES ('Juan Agente', 'juan@paquexpress.com', '$2b$12$f0i/3y0n8s6L6F4m2L8mG.V0z8k9w7Q5A4S2D1F9G8H7J6K5L4M3N2O1P0R9S8T7U6V5W4X3Y2Z1'); 

INSERT INTO Paquetes (id_unico_paquete, direccion_destino, id_agente_asignado) 
VALUES 
('PAQ-4521', 'Avenida Siempre Viva #742, Springfield', 1),
('PAQ-8903', 'Calle Falsa #123, Ciudad de México', 1);