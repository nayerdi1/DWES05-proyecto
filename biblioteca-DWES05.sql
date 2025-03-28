CREATE DATABASE IF NOT EXISTS dwes05biblioteca;
USE dwes05biblioteca;

-- Crear la tabla libros
CREATE TABLE IF NOT EXISTS libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
);


-- Insertar los registros en la tabla libros
INSERT INTO libros (titulo, autor, genero) VALUES
('1984', 'George Orwell', 'Ciencia ficcion'),
('Lagun izoztua', 'Joseba Sarrionandia', 'Euskal literatura'),
('Diez negritos', 'Agatha Christie', 'Novela policiaca'),
('Los hombres me explican cosas', 'Rebecca Solnit', 'Ensayo'),
('A las ocho en el Bule', 'Xabier Silveira', 'Narrativa'),
('Politica del malestar', 'Alicia Valdes', 'Politica'),
('Ostegunak', 'Jon Arretxe', 'Euskal literatura'),
('Fahrenheit 451', 'Ray Bradbury', 'Ciencia ficcion'),
('El nombre de la rosa', 'Umberto Eco', 'Novela historica'),
('Ensayo sobre la ceguera', 'José Saramago', 'Filosofia'),
('Harri eta herri', 'Gabriel Aresti', 'Euskal literatura'),
('La conjura de los necios', 'John Kennedy Toole', 'Humor'),
('El silencio de los corderos', 'Thomas Harris', 'Novela policiaca'),
('Sapiens: De animales a dioses', 'Yuval Noah Harari', 'Historia'),
('El guardian entre el centeno', 'J.D. Salinger', 'Novela'),
('Rayuela', 'Julio Cortázar', 'Narrativa'),
('El Hobbit', 'J.R.R. Tolkien', 'Fantasia'),
('Los pilares de la Tierra', 'Ken Follett', 'Novela historica'),
('El coronel no tiene quien le escriba', 'Gabriel García Márquez', 'Narrativa'),
('Moby Dick', 'Herman Melville', 'Aventura'),
('Eneida', 'Virgilio', 'Epica'),
('Kafka en la orilla', 'Haruki Murakami', 'Ficcion'),
('Americanah', 'Chimamanda Ngozi Adichie', 'Narrativa'),
('Crónica de una muerte anunciada', 'Gabriel García Márquez', 'Novela');

-- Crear la tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    contrasenia VARCHAR(255) NOT NULL,
    rol ENUM('administrador', 'usuario') NOT NULL,
    sesion_iniciada BOOLEAN NOT NULL DEFAULT FALSE
);


-- Insertar los registros en la tabla usuarios
INSERT INTO usuarios (usuario, nombre, contrasenia, rol) VALUES
('nayerdi', 'Nora', SHA2('1234', 256), 'administrador'),
('iarana', 'Iker', SHA2('4321', 256), 'usuario'),
('aetxeberria', 'Amaia', SHA2('2468', 256), 'usuario'),
('jarretxe', 'Jon', SHA2('1357', 256), 'usuario'),
('jurrutia', 'June', SHA2('5678', 256), 'usuario'),
('mgarcia', 'Mikel', SHA2('8765', 256), 'usuario'),
('molasagasti', 'Malen', SHA2('1358', 256), 'usuario');

-- Crear la tabla prestamos
CREATE TABLE IF NOT EXISTS prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libro_id INT NOT NULL,
    usuario_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_devolucion DATE NULL,
    FOREIGN KEY (libro_id) REFERENCES libros(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insertar los registros en la tabla prestamos
INSERT INTO prestamos (libro_id, usuario_id, fecha_inicio, fecha_devolucion) VALUES
(1, 1, '2024-10-10', '2024-10-24'),
(6, 2, '2024-12-13', '2024-12-27'),
(3, 3, '2024-11-15', '2024-11-30'),
(4, 4, '2024-09-20', '2024-10-05'),
(5, 5, '2024-10-01', '2024-10-15'),
(7, 6, '2024-10-25', '2024-11-10'),
(2, 1, '2024-12-19', '2024-12-19');


select * from usuarios;
select * from prestamos;
select * from libros;

