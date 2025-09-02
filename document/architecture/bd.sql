-- Base de datos para aplicativo de restaurante
DROP DATABASE IF EXISTS restaurant_db;
CREATE DATABASE restaurant_db;
\c restaurant_db;

-- Tabla de roles
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL -- Owner, Dispositivo, Verificador, Transportador, Cliente
);

-- Tabla de usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    rol_id INTEGER REFERENCES roles(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de mesas
CREATE TABLE mesas (
    id SERIAL PRIMARY KEY,
    numero INTEGER UNIQUE NOT NULL,
    estado VARCHAR(20) DEFAULT 'Libre' CHECK (estado IN ('Libre', 'Ocupada', 'Reservada')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de categorías
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de productos
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    imagen_url VARCHAR(255),
    is_available BOOLEAN DEFAULT true,
    categoria_id INTEGER REFERENCES categorias(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(30) DEFAULT 'Pendiente' CHECK (estado IN ('Pendiente', 'EnVerificacion', 'Aprobado', 'EnPreparacion', 'Listo', 'EnCamino', 'Entregado')),
    mesa_id INTEGER REFERENCES mesas(id),
    usuario_id INTEGER REFERENCES usuarios(id), -- cliente que hace el pedido
    total DECIMAL(10,2) DEFAULT 0,
    notas TEXT
);

-- Tabla de detalle del pedido
CREATE TABLE detalle_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INTEGER REFERENCES pedidos(id) ON DELETE CASCADE,
    producto_id INTEGER REFERENCES productos(id),
    cantidad INTEGER NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL
);

-- Tabla de reservas
CREATE TABLE reservas (
    id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    usuario_id INTEGER REFERENCES usuarios(id),
    mesa_id INTEGER REFERENCES mesas(id),
    estado VARCHAR(20) DEFAULT 'Activa' CHECK (estado IN ('Activa', 'Cancelada', 'Completada')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de notificaciones
CREATE TABLE notificaciones (
    id SERIAL PRIMARY KEY,
    mensaje TEXT NOT NULL,
    tipo VARCHAR(20) CHECK (tipo IN ('Pedido', 'Reserva', 'Sistema')),
    estado VARCHAR(20) DEFAULT 'Pendiente' CHECK (estado IN ('Pendiente', 'Leida')),
    usuario_id INTEGER REFERENCES usuarios(id),
    pedido_id INTEGER REFERENCES pedidos(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de log de eventos
CREATE TABLE log_eventos (
    id SERIAL PRIMARY KEY,
    pedido_id INTEGER REFERENCES pedidos(id),
    usuario_id INTEGER REFERENCES usuarios(id), -- actor
    accion VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notas TEXT
);

-- Índices para mejorar rendimiento
CREATE INDEX idx_pedidos_estado ON pedidos(estado);
CREATE INDEX idx_pedidos_mesa_id ON pedidos(mesa_id);
CREATE INDEX idx_pedidos_fecha_creacion ON pedidos(fecha_creacion);
CREATE INDEX idx_productos_categoria_id ON productos(categoria_id);
CREATE INDEX idx_productos_is_available ON productos(is_available);
CREATE INDEX idx_log_eventos_pedido_id ON log_eventos(pedido_id);
CREATE INDEX idx_log_eventos_timestamp ON log_eventos(timestamp);
CREATE INDEX idx_usuarios_rol_id ON usuarios(rol_id);
CREATE INDEX idx_mesas_estado ON mesas(estado);

-- Datos iniciales - Roles
INSERT INTO roles (nombre) VALUES
('Owner'),
('Dispositivo'),
('Verificador'),
('Transportador'),
('Cliente');

-- Datos iniciales - Usuarios
INSERT INTO usuarios (nombre, email, password_hash, rol_id) VALUES
('Administrador Principal', 'owner@restaurant.com', '$2a$10$example_hash_owner', 1),
('Dispositivo Mesa 1', 'device1@restaurant.com', '$2a$10$example_hash_device1', 2),
('Verificador Cocina', 'verifier@restaurant.com', '$2a$10$example_hash_verifier', 3),
('Transportador Principal', 'transporter1@restaurant.com', '$2a$10$example_hash_transporter1', 4),
('Cliente Ejemplo', 'cliente@example.com', '$2a$10$example_hash_cliente', 5);

-- Datos iniciales - Mesas
INSERT INTO mesas (numero, estado) VALUES
(1, 'Libre'),
(2, 'Libre'),
(3, 'Libre'),
(4, 'Libre'),
(5, 'Libre'),
(6, 'Libre'),
(7, 'Libre'),
(8, 'Libre');

-- Datos iniciales - Categorías
INSERT INTO categorias (nombre) VALUES
('Entradas'),
('Platos Principales'),
('Bebidas'),
('Postres'),
('Especiales del Día');

-- Datos iniciales - Productos
INSERT INTO productos (nombre, descripcion, precio, categoria_id, is_available) VALUES
-- Entradas
('Empanadas de Carne', 'Empanadas criollas rellenas de carne desmechada', 8000.00, 1, true),
('Patacones con Hogao', 'Plátano verde frito con salsa criolla', 12000.00, 1, true),
('Arepa con Queso', 'Arepa asada con queso campesino', 6000.00, 1, true),

-- Platos Principales
('Bandeja Paisa', 'Plato típico con frijoles, arroz, carne, chorizo, chicharrón, huevo, aguacate y arepa', 25000.00, 2, true),
('Pollo Asado', 'Pollo asado con papas criollas y ensalada', 18000.00, 2, true),
('Pescado a la Plancha', 'Pescado fresco con arroz de coco y patacones', 22000.00, 2, true),
('Sancocho de Gallina', 'Sancocho tradicional con gallina criolla', 20000.00, 2, true),

-- Bebidas
('Coca Cola', 'Gaseosa 350ml', 3000.00, 3, true),
('Jugo Natural de Lulo', 'Jugo natural de lulo', 5000.00, 3, true),
('Agua Panela con Limón', 'Bebida tradicional colombiana', 4000.00, 3, true),
('Cerveza Nacional', 'Cerveza colombiana 330ml', 4500.00, 3, true),

-- Postres
('Flan de Caramelo', 'Flan casero con caramelo', 6000.00, 4, true),
('Tres Leches', 'Torta tres leches tradicional', 7000.00, 4, true),
('Helado de Coco', 'Helado artesanal de coco', 4000.00, 4, true),

-- Especiales
('Parrillada Familiar', 'Parrillada para 4 personas con carnes mixtas', 80000.00, 5, true),
('Cazuela de Mariscos', 'Cazuela con mariscos frescos del día', 35000.00, 5, true);
