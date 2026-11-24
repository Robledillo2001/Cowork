-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2026 a las 20:04:48
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cowork`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichajes`
--

CREATE TABLE `fichajes` (
  `id` int(11) NOT NULL,
  `id_trabajador` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `tipo` enum('entrada','salida') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fichajes`
--

INSERT INTO `fichajes` (`id`, `id_trabajador`, `fecha_hora`, `tipo`) VALUES
(1, 3, '2025-04-22 10:25:50', 'entrada'),
(2, 3, '2025-04-22 10:26:12', 'salida'),
(3, 4, '2025-04-22 14:49:28', 'entrada'),
(4, 4, '2025-04-22 14:49:31', 'salida'),
(5, 5, '2025-04-24 17:51:38', 'entrada'),
(6, 5, '2025-04-24 17:51:45', 'salida'),
(7, 5, '2025-04-24 18:07:22', 'salida'),
(8, 6, '2025-05-01 17:14:59', 'entrada'),
(9, 6, '2025-05-01 17:15:06', 'salida'),
(10, 7, '2025-05-02 02:40:04', 'entrada'),
(11, 7, '2025-05-02 02:40:06', 'salida'),
(12, 8, '2025-05-05 12:44:33', 'entrada'),
(13, 8, '2025-05-05 12:44:36', 'salida'),
(14, 6, '2025-05-27 10:49:49', 'entrada'),
(15, 6, '2025-05-27 10:49:54', 'salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `ID` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `TITULO` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `FECHA` datetime DEFAULT current_timestamp(),
  `ESTADO` varchar(20) DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`ID`, `ID_USUARIO`, `TITULO`, `DESCRIPCION`, `FECHA`, `ESTADO`) VALUES
(1, 1, 'Comprar hielos para los roncolas', 'Se han acabado los hielos; ahora como me tomo los roncolas, espero que se repongan rapido que me muero', '2025-05-05 14:16:19', 'completada'),
(2, 3, 'Multiples fallos en el servidor', 'No he podido acceder al servidor desde el apagon de la semana pasada y estamos hartos de que no se haya arreglado ya que todas las tareas estan alli espero que obtengamos una respuesta rapido un saludo', '2025-05-05 14:19:23', 'Pendiente'),
(3, 3, 'Comida echandose a perder', 'La comida sobra y se esta poniendo mala necesitamos hacer algo porque nos llega un olor rancio y no hemos visto hasta ratas\r\nMe gustaria que se solucionase cuanto antes\r\nUn saludo Mariano', '2025-05-05 18:17:41', 'Pendiente'),
(19, 3, 'lavarmos el coche', 'dfsdjvbfsdfbfgjksd', '2025-05-05 19:17:36', 'completada'),
(22, 8, 'Donde estan los tralaleros', 'No encuentro la tarea de los tralareritos y no se las indicaciones de la tarea, espero que se contacte pronto para poder empezarla cuanto antes ya que es muy importante.\r\nSaludos Granero', '2025-05-12 14:10:37', 'completada'),
(23, 8, 'No me salen las tareas en pdf', 'Al descargar mis tareas correspondientes no se me descarga el archivo y no se que hacer. Si se puede arreglar o corregir ese fallo lo agradecedia mucho para tenerlas a mano\r\nUn saludo', '2025-05-20 10:42:53', 'Pendiente'),
(24, 11, 'No me salen las tareas en pdf', 'Al descargar mis tareas correspondientes no se me descarga el archivo y no se que hacer. Si se puede arreglar o corregir ese fallo lo agradecedia mucho para tenerlas a mano Un saludo', '2025-05-20 12:18:06', 'Pendiente'),
(25, 6, 'Reporte Xd', 'dfugsdfjsvhsfkksdlfndskjvbsdvsvrfdsfsdf', '2025-05-27 10:50:31', 'Pendiente'),
(26, 14, 'PHP', 'PHP', '2025-05-27 10:53:00', 'completada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `id_trabajador` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('pendiente','en_proceso','completada') DEFAULT 'pendiente',
  `fecha_asignacion` datetime DEFAULT current_timestamp(),
  `fecha_entrega` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `id_trabajador`, `titulo`, `descripcion`, `estado`, `fecha_asignacion`, `fecha_entrega`) VALUES
(5, 3, 'Organizar Archivos Alagarte', 'dfjklsdbnfjdsfjlnsdfjnsfv', 'completada', '2025-04-28 00:00:00', '2025-05-09 00:00:00'),
(6, 4, 'Empaquetar Comida', 'Guardar comida para el apagon del proximo mes', 'pendiente', '2025-04-29 00:00:00', '2025-05-02 00:00:00'),
(7, 5, 'Reinstalar Windows', 'Reinstalar Windows en todos los PC del Departamento de Finanzas', 'completada', '2025-04-29 00:00:00', '2025-05-04 00:00:00'),
(8, 3, 'Reparar Servidor', 'Reparar el Servidor por la incapacidad de conectarse al El', 'en_proceso', '2025-04-29 00:00:00', '2025-05-10 00:00:00'),
(11, 6, 'ZZZZZZZ', 'Prueba pa ver si funciona la cookie de tareas', 'completada', '2025-05-01 00:00:00', '2025-05-04 00:00:00'),
(13, 7, 'Cobrar millones de China', 'Irse a china a ganr dinero fichar por el robalona y volverse a china planazo', 'en_proceso', '2025-05-05 00:00:00', '2025-05-06 00:00:00'),
(14, 6, 'lplplpl', 'lplplplplplp', 'completada', '2025-05-05 00:00:00', '2025-05-24 00:00:00'),
(15, 7, 'ñpñp', '0000', 'en_proceso', '2025-05-06 00:00:00', '2025-05-16 00:00:00'),
(16, 5, 'Reponer vasos', 'Reponer los vasos de agua', 'en_proceso', '2025-05-07 00:00:00', '2025-05-09 00:00:00'),
(17, 5, 'Reponer vasos', 'Reponer los vasos de agua', 'en_proceso', '2025-05-07 00:00:00', '2025-05-09 00:00:00'),
(18, 3, 'Arreglar el Fallo de los PDF', 'Esteban acaba de mandar un reporte de los PDF no se descargan y es un problema soluciona lo cuanto antes', 'pendiente', '2025-05-20 00:00:00', '2025-05-22 00:00:00'),
(19, 5, '0000', '00000', 'en_proceso', '2025-05-26 00:00:00', '2025-05-29 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `NOMBRE_USUARIO` varchar(50) NOT NULL,
  `NOMBRE_COMPLETO` varchar(100) NOT NULL,
  `DNI` varchar(20) NOT NULL,
  `CONTRASEÑA` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `img_usuario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `NOMBRE_USUARIO`, `NOMBRE_COMPLETO`, `DNI`, `CONTRASEÑA`, `rol`, `correo`, `img_usuario`) VALUES
(1, 'RubLRR01', 'Ruben Lopez-Reina Robledillo', '04639172A', '$2y$10$StehpBcas2FH2Jwv14meJeXQiJNRFayV8zf2o42suDq3XTc6ErMqG', 'admin', 'lopezreinarobledilloruben@gmail.com', 'imagenes/img_681a62adf1f5f7.26356052.jpg'),
(2, 'DavFP02', 'David Palacios Fernandez', '12345678D', '$2y$10$soVw3iE0iV4C2l4g4TpEQe70tksi4R7PXB3VHj97STO1gyiYxrxcW', 'admin', 'correo@correo.es', 'imagenes/img_680ad49ab70c89.97037628.jpg'),
(3, 'MarDz07', 'Mariano Diaz', '456789123F', '$2y$10$6a0msRGbYfJdWa7aoyH7KuDqiGztqpWjIkjUXeODCkKhaZqhL4zMS', 'usuario', 'rl4845011@gmail.com', 'imagenes/img_682c3dce8a2e68.08562421.jpg'),
(4, 'Brath19', 'Martin Braithwaite', '19097799F', '$2y$10$7uAZyfmlTmL.XR8ewMcSSOMy519qXwyveE8afIT9MsQseTXZ2H8jW', 'usuario', 'BRTH@gmail.es', 'imagenes/img_68349cff5ca1c5.69897118.jpg'),
(5, 'dnigza33', 'Dani Güiza', '3333333D', '$2y$10$ro4/vt2y8wIi2ZHrYtpkCehwqtUUwcpfwveo1PD0buU7KBxnORPOy', 'usuario', 'dnigza33@gmail.com', 'imagenes/guiza.jpg'),
(6, 'DiosBordalas', 'Bordalas Jimenez', '6767676767H', '$2y$10$SwDZE0rZoFD/SRc./wm2xO31VYoXwTkxUWQfsHoTLIxFcCvzuu9W2', 'usuario', 'bordaneta69@gmail.es', 'imagenes/img_6818f6ff5f6399.93470234.jpg'),
(7, 'paulinho45', 'José Paulo Bezerra Maciel Júnior', '4545454567K', '$2y$10$fQKGzzq4RpKhLBMmwE/7Pey4NY5Lti8/d3fqlCcaaEFqWCnXqKPNm', 'usuario', 'PAULINHO@GMAIL.BR', 'imagenes/img_6814145bbfa5e8.17490871.jpg'),
(8, 'Graneros99', 'Esteban Granero', '45454545L', '$2y$10$KI198uIfeBHVopBlfyUvfeyN6QFRtQwvN8YDMMNicYsxTZq7XZMy6', 'usuario', 'usuario@klkl.es', 'imagenes/granero.jpg'),
(11, 'JohnDoe', 'JOHN DOE', '12345678O', '$2y$10$C/s/MWne0gJMHtdIDGj/4OpC8/9SIZvXdLEUitt.u9vjm6M03eGOC', 'admin', 'johndoe@nose.com', ''),
(13, 'Isiplz49', 'Isaac Palazón Camacho', '3542523452345F', '$2y$10$QA4zn1WYZJvZUa8sV9Zm8O/evT7BeyVg4Ny8vYvussIt6VpyhAoqu', 'usuario', 'isidoroplz@hotmail.com', 'imagenes/img_68349ec11d22b3.12509225.jpg'),
(14, 'Carlos', 'Carlos PHP', '23231313P', '$2y$10$51LqG8EWeKbGktM0iGiO4.4zJrkxYP1m7abst/PsazeEy0eGcx.Oi', 'admin', 'Carlos.valera@cifpcuenca.es', ''),
(15, 'Gonsa90', 'Antonio Gonzalez', '56745435J', '$2y$10$m3sETx1hp1yMGeKnEjJj2O2VETk3Lrvyy4cWsXSVSAQ1.4bJ6V1r.', 'usuario', 'dfhjsdhjds@ghh.es', 'imagenes/img_68357e793b5075.05339706.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fichajes`
--
ALTER TABLE `fichajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_trabajador` (`id_trabajador`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_trabajador` (`id_trabajador`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NOMBRE_USUARIO` (`NOMBRE_USUARIO`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fichajes`
--
ALTER TABLE `fichajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fichajes`
--
ALTER TABLE `fichajes`
  ADD CONSTRAINT `fichajes_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `usuarios` (`ID`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID`);

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `usuarios` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
