CREATE DATABASE practica1Progra2;
CREATE USER 'muebleria'@'localhost' IDENTIFIED BY 'Mueble12345';
GRANT USAGE,INSERT,DELETE,UPDATE,SELECT ON practica1progra2.* TO 'muebleria'@'localhost';
USE practica1Progra2;
CREATE TABLE usuario(
	nombre_usuario VARCHAR(45) NOT NULL,
    contraseña VARCHAR(12) NOT NULL,
    tipo INT NOT NULL,
    CONSTRAINT PK_USUARIO PRIMARY KEY(nombre_usuario)
	);
CREATE TABLE mueble(
	nombre_mueble VARCHAR(35) NOT NULL,
    precio DOUBLE NOT NULL,
    CONSTRAINT PK_MUEBLE PRIMARY KEY(nombre_mueble)
	);
CREATE TABLE pieza(
	tipo_pieza VARCHAR(35) NOT NULL,
    costo DOUBLE NOT NULL,
    cantidad INT,
    CONSTRAINT PK_PIEZA PRIMARY KEY(tipo_pieza)
	);
CREATE TABLE ensamblar(
	numero_ensamble INT NOT NULL AUTO_INCREMENT,
    nombre_mueble VARCHAR(35) NOT NULL,
    nombre_usuario VARCHAR(45) NOT NULL,
    precio DOUBLE,
    fecha DATE NOT NULL,
    CONSTRAINT PK_ENSAMBLAR PRIMARY KEY(numero_ensamble),
    CONSTRAINT FK_TO_USUARIO FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre_usuario),
    CONSTRAINT FK_TO_MUEBLE FOREIGN KEY(nombre_mueble) REFERENCES mueble(nombre_mueble)
	);
CREATE TABLE ensamble(
	numero_asignacion INT NOT NULL AUTO_INCREMENT,
    nombre_mueble VARCHAR(35) NOT NULL,
    tipo_pieza VARCHAR(35) NOT NULL,
    cantidad INT,
    CONSTRAINT PK_ENSAMBLE PRIMARY KEY(numero_asignacion),
    CONSTRAINT FK_TO_MUEBLE2 FOREIGN KEY(nombre_mueble) REFERENCES mueble(nombre_mueble),
	CONSTRAINT FK_TO_PIEZA1 FOREIGN KEY(tipo_pieza) REFERENCES pieza(tipo_pieza)
	);
CREATE TABLE cliente(
	nit VARCHAR(12) NOT NULL,
    nombre_cliente VARCHAR(45),
    direccion_cliente VARCHAR(35),
    municipio VARCHAR(35),
    departamento VARCHAR(35),
    CONSTRAINT PK_CLIENTE PRIMARY KEY(nit)
	);
    CREATE TABLE mueble_venta(
    numero_mueble INT NOT NULL AUTO_INCREMENT,
	nombre_mueble_venta VARCHAR(35) ,
    precio_venta DOUBLE,
    CONSTRAINT PK_MUEBLE PRIMARY KEY(numero_mueble)
);
CREATE TABLE factura(
	numero_factura INT NOT NULL AUTO_INCREMENT,
    nombre_usuario VARCHAR(45) NOT NULL,
    nombre_mueble VARCHAR(35) NOT NULL,
    nit VARCHAR(12) NOT NULL,
    cantidad INT NOT NULL,
    total_pago DOUBLE NOT NULL,
    fecha DATE,
    CONSTRAINT PK_FACTURA PRIMARY KEY(numero_factura),
    CONSTRAINT FK_TO_USUARIO2 FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre_usuario),
    CONSTRAINT FK_TO_MUEBLE3 FOREIGN KEY(nombre_mueble) REFERENCES mueble(nombre_mueble),
    CONSTRAINT FK_TO_CLIENTE FOREIGN KEY(nit) REFERENCES cliente(nit)
	);

CREATE TABLE devolucion(
	numero_devolucion INT NOT NULL AUTO_INCREMENT,
    numero_factura INT NOT NULL,
    nombre_mueble VARCHAR(35) NOT NULL,
    nit VARCHAR(12) NOT NULL,
    fecha_devolucion DATE NOT NULL,
    CONSTRAINT PK_DEVOLUCION PRIMARY KEY(numero_devolucion),
    CONSTRAINT FK_TO_FACTURA FOREIGN KEY(numero_factura) REFERENCES factura(numero_factura),
    CONSTRAINT FK_TO_MUEBLE4 FOREIGN KEY(nombre_mueble) REFERENCES mueble(nombre_mueble),
    CONSTRAINT FK_TO_CLIENTE2 FOREIGN KEY(nit) REFERENCES cliente(nit)
	);
CREATE TABLE ganancia(
	numero_accion INT NOT NULL AUTO_INCREMENT,
    nombre_usuario VARCHAR(45) NOT NULL,
    numero_factura INT NOT NULL,
    numero_devolucion INT NOT NULL,
    nombre_mueble VARCHAR(35) NOT NULL,
    nit VARCHAR(12) NOT NULL,
    dinero DOUBLE,
    CONSTRAINT PK_GANANCIA PRIMARY KEY(numero_accion),
    CONSTRAINT FK_TO_USUARIO3 FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre_usuario),
    CONSTRAINT FK_TO_FACTURA2 FOREIGN KEY(numero_factura) REFERENCES factura(numero_factura),
    CONSTRAINT FK_TO_DEVOLUCION FOREIGN KEY(numero_devolucion) REFERENCES devolucion(numero_devolucion),
    CONSTRAINT FK_TO_MUEBLE5 FOREIGN KEY(nombre_mueble) REFERENCES mueble(nombre_mueble),
    CONSTRAINT FK_TO_CLIENTE3 FOREIGN KEY(nit) REFERENCES cliente(nit)
	);