-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-11-2025 a las 03:42:55
-- Versión del servidor: 8.0.44-0ubuntu0.24.04.1
-- Versión de PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamento`
--

CREATE TABLE `Departamento` (
  `departamento_id` int NOT NULL,
  `nombre` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ubicacion` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetalleProyecto`
--

CREATE TABLE `DetalleProyecto` (
  `detalle_proyecto_id` int NOT NULL,
  `empleado_id` varchar(254) COLLATE utf8mb4_spanish_ci NOT NULL,
  `proyecto_id` int NOT NULL,
  `fecha_asignacion` datetime DEFAULT NULL,
  `rol_en_proyecto` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `horas_asignadas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `empleado_id` varchar(254) COLLATE utf8mb4_spanish_ci NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `departamento_id` int NOT NULL,
  `rol_id` int NOT NULL,
  `nombre` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `apellido` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `direccion` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `telefono` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proyecto`
--

CREATE TABLE `Proyecto` (
  `proyecto_id` int NOT NULL,
  `nombre_proyecto` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_termino` datetime DEFAULT NULL,
  `descripcion` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `estado` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RegistroTiempo`
--

CREATE TABLE `RegistroTiempo` (
  `registro_id` int NOT NULL,
  `empleado_id` varchar(254) COLLATE utf8mb4_spanish_ci NOT NULL,
  `proyecto_id` int NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `horas_trabajo` float DEFAULT NULL,
  `descripcion` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rol`
--

CREATE TABLE `Rol` (
  `rol_id` int NOT NULL,
  `nombre` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `descripcion` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `usuario_id` int NOT NULL,
  `nombre_usuario` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `hash_password` varchar(254) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_ultimo_acceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Departamento`
--
ALTER TABLE `Departamento`
  ADD PRIMARY KEY (`departamento_id`);

--
-- Indices de la tabla `DetalleProyecto`
--
ALTER TABLE `DetalleProyecto`
  ADD PRIMARY KEY (`detalle_proyecto_id`),
  ADD KEY `FK_Detalle_Proyecto` (`proyecto_id`),
  ADD KEY `FK_Detalle_Empleado` (`empleado_id`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`empleado_id`),
  ADD KEY `FK_Empleado_Usuario` (`usuario_id`),
  ADD KEY `FK_Empleado_Rol` (`rol_id`),
  ADD KEY `FK_Empleado_Depto` (`departamento_id`);

--
-- Indices de la tabla `Proyecto`
--
ALTER TABLE `Proyecto`
  ADD PRIMARY KEY (`proyecto_id`);

--
-- Indices de la tabla `RegistroTiempo`
--
ALTER TABLE `RegistroTiempo`
  ADD PRIMARY KEY (`registro_id`),
  ADD KEY `FK_Registro_Empleado` (`empleado_id`),
  ADD KEY `FK_Registro_Proyecto` (`proyecto_id`);

--
-- Indices de la tabla `Rol`
--
ALTER TABLE `Rol`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `DetalleProyecto`
--
ALTER TABLE `DetalleProyecto`
  ADD CONSTRAINT `FK_Detalle_Empleado` FOREIGN KEY (`empleado_id`) REFERENCES `Empleado` (`empleado_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_Detalle_Proyecto` FOREIGN KEY (`proyecto_id`) REFERENCES `Proyecto` (`proyecto_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD CONSTRAINT `FK_Empleado_Depto` FOREIGN KEY (`departamento_id`) REFERENCES `Departamento` (`departamento_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_Empleado_Rol` FOREIGN KEY (`rol_id`) REFERENCES `Rol` (`rol_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_Empleado_Usuario` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `RegistroTiempo`
--
ALTER TABLE `RegistroTiempo`
  ADD CONSTRAINT `FK_Registro_Empleado` FOREIGN KEY (`empleado_id`) REFERENCES `Empleado` (`empleado_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_Registro_Proyecto` FOREIGN KEY (`proyecto_id`) REFERENCES `Proyecto` (`proyecto_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
