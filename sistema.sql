-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 28-11-2023 a las 17:07:11
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
(1, 'Sistemas Free', '98745698', 'ana.info1999@gamil.com', 'Trujillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_permisos`
--

CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id` int(11) NOT NULL,
  `laboratorio` varchar(100) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `laboratorios`
--

INSERT INTO `laboratorios` (`id`, `laboratorio`, `direccion`) VALUES
(1, 'SKINHEALTH', 'Cra. 63 #N 98B-06, Bogotá');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'configuración'),
(2, 'usuarios'),
(3, 'clientes'),
(4, 'productos'),
(5, 'ventas'),
(6, 'nueva_venta'),
(7, 'tipos'),
(8, 'presentacion'),
(9, 'laboratorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nombre_corto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`id`, `nombre`, `nombre_corto`) VALUES
(1, 'Dermoabrasivos', 'LFUCASA'),
(2, 'Despigmentantes y aclarantes', 'LFUCASA'),
(3, 'Limpieza y exfoliacion', 'LFU (C-C)'),
(4, 'Tonico vitalizante ', 'LFU (C-C)'),
(5, 'Antienvejecimiento', 'LFUCASA'),
(6, 'Liposomas-hidratacion-nutricion', 'LFU (C-C)'),
(7, 'Cuidado de ojos', 'LFUCASA'),
(8, 'Proteccion solar', 'LFUCASA'),
(9, 'Proteccion solar color', 'LFUCASA'),
(10, 'Complementarios', 'LFCU (C-C)'),
(11, 'Mascarillas naturales', 'LFUCABINA'),
(12, 'Mascarillas astringentes', 'LFUCABINA'),
(13, 'Hidratacion manos y cuerpo', 'LCUCASA'),
(14, 'Bioseguridad', 'LCUCASA'),
(15, 'Lipo-reduccion', 'LCUCABINA'),
(16, 'Reafirmante', 'LCUCABINA'),
(17, 'Kit busto reafirmante ', 'LCUCABINA'),
(18, 'Celulitis-estrias-exfoliante', 'LCUCABINA'),
(19, 'Aceites para masajes', 'LCUCABINA'),
(20, 'Terapia te verde', 'LS'),
(21, 'terapia sedution', 'LS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codproducto` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int(11) NOT NULL,
  `id_lab` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `vencimiento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`, `id_lab`, `id_presentacion`, `id_tipo`, `vencimiento`) VALUES
(1, 'AGC', 'ACIDO GLICOLICO CREMA 10%       X30g', 134.90, 200, 1, 1, 1, ''),
(2, 'AGG', 'ACIDO GLICOLICO GEL  7%       X30g', 122.60, 200, 1, 1, 1, ''),
(3, 'AGL', 'ACIDO GLICOLICO LOCION  10%    X30g', 137.90, 200, 1, 1, 1, ''),
(4, 'AGHK', 'GEL DESPIGMENTANTE        X30g', 183.80, 200, 1, 2, 1, ''),
(5, 'AKG', 'ACIDO KOJICO GEL 3%         X30g', 155.90, 200, 1, 2, 1, ''),
(6, 'VC30', 'GEL CON VITAMINA C  10%       X30g', 159.90, 200, 1, 2, 1, ''),
(7, 'MAN10', 'MANDELICO GEL LIPOSOMA  10%     X30g', 113.30, 200, 1, 2, 1, ''),
(8, 'AHA10', 'SUERO ACLARADOR 10%     X30g', 147.70, 200, 1, 2, 1, ''),
(9, 'AL150', 'ACIDO LACTICO LIMPIADOR    X150g', 94.90, 200, 1, 3, 1, ''),
(10, 'GE125', 'GEL ESPUMOSO FACIAL     X125g', 119.90, 200, 1, 3, 1, ''),
(11, 'GL100', 'GEL LIMPIADOR      X100g', 89.90, 200, 1, 3, 1, ''),
(12, 'LL150', 'LECHE LIMPIADORA     X150g', 89.70, 200, 1, 3, 1, ''),
(13, 'GD100', 'GEL LIMPIADOR EXFOLIANTE FACIAL   X100g', 96.80, 200, 1, 3, 1, ''),
(14, 'ATN120', 'AGUA VITALIZANTE NATURAL     X120g', 77.30, 200, 1, 4, 1, ''),
(15, 'ATR120', 'AGUA VITALIZANTE ROSADA     X120g', 77.30, 200, 1, 4, 1, ''),
(16, 'ATV120', 'AGUA VITALIZANTE VERDE     X120g', 77.30, 200, 1, 4, 1, ''),
(17, 'CEQ10', 'SUERO ANTIOXIDANTE SERUM LIPOSOME X30g', 157.90, 200, 1, 5, 1, ''),
(18, 'RQ50', 'GEL REAFIRMANTE Q10 LIPOSOMADO   X50g', 189.30, 200, 1, 5, 1, ''),
(19, 'GA50', 'GEL ANTIEDAD    X50g', 119.90, 200, 1, 5, 1, ''),
(20, 'BA150', 'BALSAMO AFTERSHAVE INHIBIDOR DE VELLO   X150g', 105.40, 200, 1, 6, 1, ''),
(21, 'BL30', 'GEL BIOCOLAGENO !!! LIPOSOMA   X30g', 169.90, 200, 1, 6, 1, ''),
(22, 'CN50', 'CREMA NUTRITIVA AMINO REPAIR COMPLEX   X50g', 132.40, 200, 1, 6, 1, ''),
(23, 'GH100', 'GEL HIDRATANTE CON ALOE    X100g', 98.70, 200, 1, 6, 1, ''),
(24, 'HF50', 'LOCION HIDRATANTE  FACIAL LIPOSOMADA   X50g', 166.70, 200, 1, 6, 1, ''),
(25, 'SH50', 'SUERO HIDRATANTE AMINO ACID COMPLEX   X50g', 162.80, 200, 1, 6, 1, ''),
(26, 'CO30', 'GEL CONTORNO DE OJOS     X30g', 166.60, 200, 1, 7, 1, ''),
(27, 'DO125', 'DEMAQUILLANTE DE OJOS   X125g', 84.10, 200, 1, 7, 1, ''),
(28, 'DO250', 'DEMAQUILLANTE DE OJOS     X250g', 126.90, 200, 1, 7, 1, ''),
(29, 'PT60', 'PANTALLA SOLAR GEL   X60g', 146.90, 200, 1, 8, 1, ''),
(30, 'PT100', 'PANTALLA SOLAR GEL      X100g', 196.20, 200, 1, 8, 1, ''),
(31, 'PT150', 'PANTALLA SOLAR GEL     X150g', 249.90, 200, 1, 8, 1, ''),
(32, 'PTC60', 'PANTALLA SOLAR GEL      X60g', 159.90, 200, 1, 9, 1, ''),
(33, 'PTC150', 'PANTALLA SOLAR GEL    X150g', 269.90, 200, 1, 9, 1, ''),
(34, 'CC60', 'CREMA DERMOREPARADORA     X60g', 123.70, 200, 1, 10, 1, ''),
(35, 'PS30', 'GEL PIEL DE SEDA      X30g', 154.70, 200, 1, 10, 1, ''),
(36, 'PR30', 'REFINADOR DE POROS   X30g', 125.90, 200, 1, 10, 1, ''),
(37, 'LHT150', 'LECHE HIDROREPARADORA TE VERDE   X150g', 95.40, 200, 1, 13, 3, ''),
(38, 'LHS150', 'LECHE HIDROREPARADORA SEDUTION   X150g', 95.40, 200, 1, 13, 3, ''),
(39, 'CL150', 'CUIDADO INTIMO   X150g', 68.40, 200, 1, 10, 3, ''),
(40, 'GN150', 'GEL ANTICELULITICO   X150g', 114.90, 200, 1, 10, 3, ''),
(41, 'GS150', 'GEL ANTIESTRIAS    X150g', 102.90, 200, 1, 10, 3, ''),
(42, 'GLD100', 'GEL LIMPIADOR EXFOLIANTE CORPORAL  X100g', 89.90, 200, 1, 10, 3, ''),
(43, 'GL300', 'GEL FRIO PARA MASAJES      X300g', 61.10, 200, 1, 10, 3, ''),
(44, 'SA300', 'GEL CALIENTE PARA MASAJES    X300g', 57.90, 200, 1, 10, 3, ''),
(45, 'GZ100', 'GEL ANTIBACTERIAL    X100g', 17.60, 200, 1, 14, 3, ''),
(46, 'GZ150', 'GEL ANTIBACTERIAL    X150g', 22.10, 200, 1, 14, 3, ''),
(47, 'AL500', 'ACIDO LACTICO LIMPIADOR     X500g', 101.90, 200, 1, 3, 2, ''),
(48, 'GE500', 'GEL ESPUMOSO FACIAL   X500g', 105.90, 200, 1, 3, 2, ''),
(49, 'GL500', 'GEL LIMPIADOR    X500g', 83.80, 200, 1, 3, 2, ''),
(50, 'LL500', 'LECHE LIMPIADORA    X500g', 83.90, 200, 1, 3, 2, ''),
(51, 'GD500', 'GEL LIMPIADOR EXFOLIANTE FACIAL    X500g', 102.70, 200, 1, 3, 2, ''),
(52, 'MD300', 'MASCARILLA NATURAL MANZANILLA   X300g', 66.90, 200, 1, 11, 2, ''),
(53, 'MF300', 'MASCARILLA NATURAL FRESA   X300g', 59.60, 200, 1, 11, 2, ''),
(54, 'MP300', 'MASCARILLA NATURAL PAPAYA    X300g', 66.90, 200, 1, 11, 2, ''),
(55, 'MV300', 'MASCARILLA NATURAL ALOE VERA   X300g', 66.90, 200, 1, 11, 2, ''),
(56, 'MA300', 'MASCARILLA ASTRINGENTE NATURAL  X300g', 65.40, 200, 1, 12, 2, ''),
(57, 'MAH300', 'MASCARILLA ASTRINGENTE HERBAL   X300g', 65.40, 200, 1, 12, 2, ''),
(58, 'BA500', 'BALSAMO  AFTERSHAVEINHIBIDOR DE VELLO  X500g', 86.90, 200, 1, 6, 2, ''),
(59, 'BL150', 'GEL BIOCOLAGENO !!! LIPOSOMA  X150', 189.90, 200, 1, 6, 2, ''),
(60, 'CN150', 'CREMA NUTRITIVA AMINO REPAIR COMPLEX   X150g', 139.60, 200, 1, 6, 2, ''),
(61, 'GH500', 'GEL HIDRATANTE CON ALOE    X500g', 91.90, 200, 1, 6, 2, ''),
(62, 'HF150', 'LOCION HIDRATANTE FACIAL LIPOSOMADA  X150g', 168.60, 200, 1, 6, 2, ''),
(63, 'CEQ150', 'SUERO ANTIOXIDANTE SERUM LIPOSOME  X150g', 156.60, 200, 1, 6, 2, ''),
(64, 'SH150', 'SUERO HIDRATANTE AMINO ACID COMPLEX   X150g', 154.60, 200, 1, 6, 2, ''),
(65, 'RQ150', 'GEL REAFIRMANTE Q10 LIPOSOMADO   X150g', 174.70, 200, 1, 6, 2, ''),
(66, 'ATN300', 'AGUA VITALIZANTE NATURAL   X300g', 77.90, 200, 1, 4, 2, ''),
(67, 'ATR300', 'AGUA VITALIZANTE ROSADA   X300g', 77.90, 200, 1, 4, 2, ''),
(68, 'ATV300', 'AGUA VITALIZANTE VERDE   X300g', 77.90, 200, 1, 4, 2, ''),
(69, 'CC120', 'CREMA DERMOREPARADORA   X120g', 123.80, 200, 1, 10, 2, ''),
(70, 'MPN250', 'MASCARILLA PLASTICA NATURAL  X250g', 67.20, 200, 1, 10, 2, ''),
(71, 'GI500', 'GEL FRION PARA MASAJES    X500g', 62.40, 200, 1, 15, 4, ''),
(72, 'SA500', 'GEL CALIENTE PARA MASAJES   X500g', 52.90, 200, 1, 15, 4, ''),
(73, 'GF500', 'GEL FRIO REAFIRMANTE    X500g', 67.20, 200, 1, 16, 4, ''),
(74, 'HV500', 'LOCION HIPOTERMICA DE VENDAS   X500g', 42.50, 200, 1, 16, 4, ''),
(75, 'LB500', 'LOCION HIPOTERMICA BUSTO   X500g', 79.90, 200, 1, 17, 4, ''),
(76, 'RB500', 'GEL REAFIRMANTE BUSTO   X500g', 87.70, 200, 1, 17, 4, ''),
(77, 'MB500', 'MASCARILLA CRIOGENICA BUSTO   X500g', 79.80, 200, 1, 17, 4, ''),
(78, 'CB120', 'CREMA REPARADORA BUSTO    X120', 59.90, 200, 1, 17, 4, ''),
(79, 'GN500', 'GEL ANTICELULITICO   X500g', 133.90, 200, 1, 18, 4, ''),
(80, 'GS500', 'GEL ANTIESTRIAS   X500g', 85.80, 200, 1, 18, 4, ''),
(81, 'GLD500', 'GEL LIMPIADOR EXFOLIANTE CORPORAL   X500g', 102.50, 200, 1, 18, 4, ''),
(82, 'AA500', 'ACEITE PARA MASAJES DE ALMENDRAS   X500g', 69.60, 200, 1, 19, 4, ''),
(83, 'AN500', 'ACEITES PARA MASAJES DE NARANJA   X500g', 69.60, 200, 1, 19, 4, ''),
(84, 'AMT500', 'ACEITE PARA MASAJES DE TE VERDE  X500g', 69.60, 200, 1, 19, 4, ''),
(85, 'AMS500', 'ACEITES PARA MASAJES DE SEDUTION  X500g', 69.60, 200, 1, 19, 4, ''),
(86, 'AMY500', 'ACEITE PARA MASAJES DE MARACUYA   X500g ', 69.60, 200, 1, 19, 4, ''),
(87, 'AMK500', 'ACEITES PARA MASAJES DE COCO  X500g', 69.60, 200, 1, 19, 4, ''),
(88, 'AMD500', 'ACEITES PARA MASAJES DE DURAZNO X500g', 69.60, 200, 1, 19, 4, ''),
(89, 'AA4000', 'ACEITE PARA MASAJES DE ALMENDRAS X4000g', 179.90, 200, 1, 19, 4, ''),
(90, 'AN4000', 'ACEITES PARA MASAJES DE NARANJA X4000g', 179.90, 200, 1, 19, 4, ''),
(91, 'AMT4000', 'ACEITE PARA MASAJES DE TE VERDE X4000g', 179.90, 200, 1, 19, 4, ''),
(92, 'AMS4000', 'ACEITES PARA MASAJES DE SEDUTION X4000g', 179.90, 200, 1, 19, 4, ''),
(93, 'AMY4000', '	ACEITE PARA MASAJES DE MARACUYA X4000g', 179.90, 200, 1, 19, 4, ''),
(94, 'AMK4000', 'ACEITES PARA MASAJES DE COCO X4000g', 179.90, 200, 1, 19, 4, ''),
(95, 'AMD4000', 'ACEITES PARA MASAJES DE DURAZNO X4000g', 179.90, 200, 1, 19, 4, ''),
(96, 'AQ4000A', 'GEL CONDUCTOR AZUL   X4000g', 63.70, 200, 1, 10, 4, ''),
(97, 'AQ4000T', 'GEL CONDUCTOR TRANSPARENTE   X4000g', 63.90, 200, 1, 10, 4, ''),
(98, 'CI500', 'CUIDADO INTIMO   X500g', 80.90, 200, 1, 10, 4, ''),
(99, 'GLT500', 'GEL LIMPIADOR EXFOLIANTE TE VERDE  X500g', 102.50, 200, 1, 20, 5, ''),
(100, 'MRT500', 'MASCARILLA CORPORAL ARCILLA TE VERDE   X500g', 93.90, 200, 1, 20, 5, ''),
(101, 'LHT500', 'LECHE HIDROREPARADORA TE VERDE   X500g', 107.40, 200, 1, 20, 5, ''),
(102, 'MNT500', 'MASCARILLA NATURAL TE VERDE   500g', 61.30, 200, 1, 20, 5, ''),
(103, 'GLS500', 'GEL LIMPIADOR EXFOLIANTE SEDUTION   X500g', 102.50, 200, 1, 21, 5, ''),
(104, 'MRS500', 'MASCARILLA CORPORAL ARCILLA SEDUCTION  X500g', 93.50, 200, 1, 21, 5, ''),
(105, 'LHS500', 'LECHE HIDROREPARADORA SEDUCTION   X500g', 107.40, 200, 1, 21, 5, ''),
(106, 'MNS300', 'MASCARILLA NATURAL SEDUCTION   X300g', 61.30, 200, 1, 21, 5, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `tipo`) VALUES
(1, 'LINEA FACIAL USO EN CASA'),
(2, 'LINEA FACIAL USO CABINA'),
(3, 'LINEA CORPORAL USO EN CASA'),
(4, 'LINEA CORPORAL USO EN CABINA'),
(5, 'LINEA SPA 500');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`) VALUES
(1, 'Sistemas Free', 'ana.info1999@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(9, 'Maria Sanchez', 'maria@gmail.com', 'maria', '263bce650e68ab4e23f28263760b9fa5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_permiso` (`id_permiso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD CONSTRAINT `detalle_permisos_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_permisos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_temp_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
