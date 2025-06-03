-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2025 at 12:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taller`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(35) NOT NULL,
  `teléfono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `email`, `teléfono`) VALUES
(401, 'Ana García Pérez', 'ana.garcia@email.com', 611222333),
(402, 'Sofia Garsia', 'sofia.garcia@email.com', 622333444),
(403, 'Maria Lopez', 'maria.lopez@email.com', 633444555),
(404, 'Pablo Ruiz', 'pablo.ruiz@email.com', 644545666);

-- --------------------------------------------------------

--
-- Table structure for table `cliente_vehículo`
--

CREATE TABLE `cliente_vehículo` (
  `id_cliente` int(11) NOT NULL,
  `id_vehículo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cliente_vehículo`
--

INSERT INTO `cliente_vehículo` (`id_cliente`, `id_vehículo`) VALUES
(401, 301),
(401, 302),
(402, 304),
(403, 305),
(404, 303);

-- --------------------------------------------------------

--
-- Table structure for table `mecánico`
--

CREATE TABLE `mecánico` (
  `id_mecánico` int(11) NOT NULL,
  `nombre` varchar(31) NOT NULL,
  `especialidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mecánico`
--

INSERT INTO `mecánico` (`id_mecánico`, `nombre`, `especialidad`) VALUES
(101, 'Ana García Pérez', 'técnica'),
(102, 'Juan Perez', 'motores'),
(103, 'Pedro Gonzales', 'suspension'),
(104, 'Carlos Diaz', 'electricidad'),
(105, 'Miguel Sanchez', 'chapa y pintura');

-- --------------------------------------------------------

--
-- Table structure for table `repuesto`
--

CREATE TABLE `repuesto` (
  `id_repuesto` int(11) NOT NULL,
  `marca` varchar(42) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `cantidad` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repuesto`
--

INSERT INTO `repuesto` (`id_repuesto`, `marca`, `nombre`, `precio_unitario`, `cantidad`) VALUES
(201, 'bosch', 'filtro de aceite', 15.50, 100),
(202, 'repsol', 'aceite de motor 5L', 45.00, 50),
(203, 'ngk', 'bujías', 8.75, 200),
(204, 'trw', 'pastillas de freno', 60.25, 75);

-- --------------------------------------------------------

--
-- Table structure for table `servició`
--

CREATE TABLE `servició` (
  `id_servició` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `detalle` varchar(80) NOT NULL,
  `costo_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servició`
--

INSERT INTO `servició` (`id_servició`, `fecha`, `detalle`, `costo_total`) VALUES
(501, '2025-06-01', 'cambio de aceite y filtros, diagnostico de motor', 120.00),
(502, '2025-05-30', 'reparación de la suspensión ', 250.50),
(503, '2025-05-28', 'revisión del sistema de frenos ', 80.00),
(504, '2025-05-25', 'solución de avería eléctrica ', 180.00);

-- --------------------------------------------------------

--
-- Table structure for table `servició_mecánico`
--

CREATE TABLE `servició_mecánico` (
  `id_servició` int(11) NOT NULL,
  `id_mecánico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servició_mecánico`
--

INSERT INTO `servició_mecánico` (`id_servició`, `id_mecánico`) VALUES
(501, 101),
(501, 102),
(502, 103),
(502, 104),
(503, 105),
(504, 102),
(504, 104);

-- --------------------------------------------------------

--
-- Table structure for table `servició_repuesta`
--

CREATE TABLE `servició_repuesta` (
  `id_servició` int(11) NOT NULL,
  `cantidad_usada` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servició_repuesta`
--

INSERT INTO `servició_repuesta` (`id_servició`, `cantidad_usada`, `id_repuesto`) VALUES
(501, 2, 202),
(502, 1, 201),
(503, 2, 203),
(503, 1, 204),
(504, 3, 203);

-- --------------------------------------------------------

--
-- Table structure for table `servició_vehículo`
--

CREATE TABLE `servició_vehículo` (
  `id_servició` int(11) NOT NULL,
  `id_vehículo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servició_vehículo`
--

INSERT INTO `servició_vehículo` (`id_servició`, `id_vehículo`) VALUES
(501, 301),
(502, 302),
(503, 303),
(504, 304);

-- --------------------------------------------------------

--
-- Table structure for table `vehículo`
--

CREATE TABLE `vehículo` (
  `id_vehículo` int(11) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(40) NOT NULL,
  `año` year(4) NOT NULL,
  `patente` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehículo`
--

INSERT INTO `vehículo` (`id_vehículo`, `marca`, `modelo`, `año`, `patente`) VALUES
(301, 'seat', 'Leon', '2020', '1234abc'),
(302, 'Renault', 'clio', '2017', '5678def'),
(303, ' opel', ' corsa', '2021', '9012ghi'),
(304, 'Peugeot', '308', '2019', '3456jkl'),
(305, 'Volkswagen', 'golf', '2015', 'ef456gh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `cliente_vehículo`
--
ALTER TABLE `cliente_vehículo`
  ADD PRIMARY KEY (`id_cliente`,`id_vehículo`),
  ADD KEY `id_vehículo` (`id_vehículo`);

--
-- Indexes for table `mecánico`
--
ALTER TABLE `mecánico`
  ADD PRIMARY KEY (`id_mecánico`);

--
-- Indexes for table `repuesto`
--
ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`id_repuesto`);

--
-- Indexes for table `servició`
--
ALTER TABLE `servició`
  ADD PRIMARY KEY (`id_servició`) USING BTREE;

--
-- Indexes for table `servició_mecánico`
--
ALTER TABLE `servició_mecánico`
  ADD PRIMARY KEY (`id_servició`,`id_mecánico`),
  ADD KEY `id_mecánico` (`id_mecánico`);

--
-- Indexes for table `servició_repuesta`
--
ALTER TABLE `servició_repuesta`
  ADD PRIMARY KEY (`id_servició`,`id_repuesto`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indexes for table `servició_vehículo`
--
ALTER TABLE `servició_vehículo`
  ADD PRIMARY KEY (`id_servició`,`id_vehículo`),
  ADD KEY `id_vehículo` (`id_vehículo`);

--
-- Indexes for table `vehículo`
--
ALTER TABLE `vehículo`
  ADD PRIMARY KEY (`id_vehículo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT for table `mecánico`
--
ALTER TABLE `mecánico`
  MODIFY `id_mecánico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `repuesto`
--
ALTER TABLE `repuesto`
  MODIFY `id_repuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `vehículo`
--
ALTER TABLE `vehículo`
  MODIFY `id_vehículo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cliente_vehículo`
--
ALTER TABLE `cliente_vehículo`
  ADD CONSTRAINT `cliente_vehículo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `cliente_vehículo_ibfk_2` FOREIGN KEY (`id_vehículo`) REFERENCES `vehículo` (`id_vehículo`);

--
-- Constraints for table `servició`
--
ALTER TABLE `servició`
  ADD CONSTRAINT `servició_ibfk_1` FOREIGN KEY (`id_servició`) REFERENCES `servició_mecánico` (`id_servició`),
  ADD CONSTRAINT `servició_ibfk_2` FOREIGN KEY (`id_servició`) REFERENCES `servició_repuesta` (`id_servició`);

--
-- Constraints for table `servició_mecánico`
--
ALTER TABLE `servició_mecánico`
  ADD CONSTRAINT `servició_mecánico_ibfk_1` FOREIGN KEY (`id_mecánico`) REFERENCES `mecánico` (`id_mecánico`);

--
-- Constraints for table `servició_repuesta`
--
ALTER TABLE `servició_repuesta`
  ADD CONSTRAINT `servició_repuesta_ibfk_1` FOREIGN KEY (`id_repuesto`) REFERENCES `repuesto` (`id_repuesto`);

--
-- Constraints for table `servició_vehículo`
--
ALTER TABLE `servició_vehículo`
  ADD CONSTRAINT `servició_vehículo_ibfk_1` FOREIGN KEY (`id_servició`) REFERENCES `servició` (`id_servició`),
  ADD CONSTRAINT `servició_vehículo_ibfk_2` FOREIGN KEY (`id_vehículo`) REFERENCES `vehículo` (`id_vehículo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
