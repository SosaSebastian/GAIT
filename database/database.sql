DROP DATABASE IF EXISTS GAIT;
CREATE DATABASE IF NOT EXISTS GAIT;

USE GAIT;

CREATE TABLE IF NOT EXISTS distributors(
	id INT PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	location VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS roles(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS employees(
	id INT PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	lastname VARCHAR(45) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	state TINYINT DEFAULT 0,
	phone VARCHAR(20) NOT NULL,
	id_distributor INT NOT NULL,
	id_role INT NOT NULL,
	FOREIGN KEY (id_role) REFERENCES roles(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_distributor) REFERENCES distributors(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categories(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL UNIQUE,
	description TEXT NOT NULL
);

CREATE TABLE brands (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS products(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL UNIQUE,
	price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
	discount DECIMAL(10, 2),
	stock INT DEFAULT 0 CHECK (stock >= 0),
	id_brand INT NOT NULL,
	id_category INT NOT NULL,
	FOREIGN KEY (id_brand) REFERENCES brands(id) ON DELETE CASCADE,
	FOREIGN KEY (id_category) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
	total DECIMAL(10, 2) NOT NULL,
	id_employees INT NOT NULL,
	id_distributor INT NOT NULL,
	order_date DATETIME NOT NULL,
	dispatch_date DATETIME NOT NULL,
	delivery_date DATETIME NOT NULL,
	FOREIGN KEY (id_employees) REFERENCES employees(id) ON DELETE CASCADE,
	FOREIGN KEY (id_distributor) REFERENCES distributors(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS order_products(
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_order INT NOT NULL,
	id_product INT NOT NULL,
	quantity INT NOT NULL CHECK (quantity > 0),
	unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price > 0),
	subtotal DECIMAL(10, 2) NOT NULL CHECK (subtotal > 0),
	FOREIGN KEY (id_order) REFERENCES orders(id) ON DELETE CASCADE,
	FOREIGN KEY (id_product) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS payment_methods(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL UNIQUE,
	description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS payments(
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_order INT NOT NULL,
	id_payment_method INT NOT NULL,
	amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
	status ENUM('PENDING', 'COMPLETED', 'FAILED') DEFAULT 'PENDING',
	FOREIGN KEY (id_order) REFERENCES orders(id) ON DELETE CASCADE,
	FOREIGN KEY (id_payment_method) REFERENCES payment_methods(id) ON DELETE CASCADE
);


-- Datos
-- Insertando roles
INSERT INTO roles (name, description) VALUES
('admin', 'Administrador con control total sobre la cuenta del distribuidor, incluyendo la gestión de empleados y productos'),
('viewer', 'Empleado con acceso solo de lectura para consultar pedidos, productos y reportes'),
('moderator', 'Empleado con permisos intermedios, puede gestionar productos, ver pedidos y apoyar en la atención al cliente');

-- Insertando categorías
INSERT INTO categories (name, description) VALUES
('Pinturas Automotrices', 'Pinturas y recubrimientos para personalización de autos.'),
('Herramientas de Pintura', 'Equipos y herramientas para aplicar pintura en autos.'),
('Accesorios de Personalización', 'Accesorios para modificar y mejorar la estética del automóvil.'),
('Iluminación Automotriz', 'Luces LED y otros sistemas de iluminación para autos.'),
('Rines y Llantas', 'Opciones de rines y llantas deportivas para vehículos.');

-- Insertando marcas
INSERT INTO brands (name) VALUES
('3M'),
('Devilbiss'),
('Meguiar''s'),
('Osram'),
('BBS');

-- Insertando productos
INSERT INTO products (name, price, discount, stock, id_brand, id_category) VALUES
('Pistola de Pintura Devilbiss GTI Pro', 320.99, 20.00, 15, 2, 2),
('Kit de Vinilos 3M Negro Mate', 150.50, 10.00, 25, 1, 3),
('Cera Protectora Meguiar''s Ultimate', 25.75, 5.00, 40, 3, 1),
('Faros LED Osram Night Breaker', 85.99, 8.00, 30, 4, 4),
('Rines BBS CH-R 19"', 1200.00, 50.00, 4, 5, 4);

