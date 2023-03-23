-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: contucarga-new
-- Generation Time: 2023-02-06 12:08:51.5470
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `blog_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `author` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `codigos_arancelarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_hts` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compania_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigos_arancelarios_compania_id_foreign` (`compania_id`),
  CONSTRAINT `codigos_arancelarios_compania_id_foreign` FOREIGN KEY (`compania_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `employee_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `consulta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor_de_producto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `llegada_de_mercancia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_de_producto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_de_entidad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_adicional` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int unsigned DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `company_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contact_form` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `servicio_de_interes` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `company_id` int unsigned DEFAULT NULL,
  `fecha_contacto` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `contact_form_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `cotizacion` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo_de_servicio` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `tipo_de_operacion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `modalidad_de_transporte` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `informacion_adicional` varchar(255) DEFAULT NULL,
  `equipo_especial` varchar(255) DEFAULT NULL,
  `unidad_peso` varchar(255) DEFAULT NULL,
  `tipomercanciaproducto` varchar(255) DEFAULT NULL,
  `zona_destino` varchar(255) DEFAULT NULL,
  `zona_origen` varchar(255) DEFAULT NULL,
  `veh_tipo` varchar(255) DEFAULT NULL,
  `reqerimiento_especial` varchar(255) DEFAULT NULL,
  `valor_mercancia` varchar(255) DEFAULT NULL,
  `peso_total` varchar(255) DEFAULT NULL,
  `fecha_entrega` varchar(255) DEFAULT NULL,
  `ciudad_destino` varchar(255) DEFAULT NULL,
  `pais_destino` varchar(255) DEFAULT NULL,
  `fecha_recogida` varchar(255) DEFAULT NULL,
  `ciudad_origen` varchar(255) DEFAULT NULL,
  `pais_origen` varchar(255) DEFAULT NULL,
  `altura` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `anchura` varchar(255) DEFAULT NULL,
  `veh_ano` varchar(255) DEFAULT NULL,
  `veh_modelo` varchar(255) DEFAULT NULL,
  `veh_fabricante` varchar(255) DEFAULT NULL,
  `modalidad_de_embarque` varchar(255) DEFAULT NULL,
  `fecha_solicitud` time DEFAULT NULL,
  `company_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `tipo_de_contenedor` varchar(255) DEFAULT NULL,
  `cantidad_de_contenedores` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Recibida',
  `fecha_de_respuesta` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1208 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `cotizacion de servicios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo_de_servicio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_de_operacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `email_newsletter_subscription` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `embarques` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `numero_referencia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_de_transporte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empresa_de_transporte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referencia_de_transportista` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigos_arancelarios` text COLLATE utf8mb4_unicode_ci,
  `numero_de_factura` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_del_proveedor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `factura_imagen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conocimiento_de_embarque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conocimiento_de_embarque_imagen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `renuncia_de_mercancia_imagen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `articulos_importados_son_alimentos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_sencamer_imagen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificado_de_origen_imagen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licencia_de_importacion_imagen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen_notificacion_de_llegada_de_mercancia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `factura_comercial_fecha_creacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `factura_comercial_nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compania` int unsigned DEFAULT NULL,
  `codigos_arancelarios_descripcion` text COLLATE utf8mb4_unicode_ci,
  `conocimiento_de_embarque_nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conocimiento_de_embarque_fecha_de_creacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `renuncia_de_mercancia_nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `renuncia_de_mercancia_fecha_creacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_sencamer_fecha_reacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_sencamer_nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificado_de_origen_nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificado_de_origen_fecha_creacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licencia_de_importacion_nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licencia_de_importacion_fecha_creacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_sanitario_imagen_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_sanitario_fecha_creacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_sanitario_nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificado_sanitario_fecha_creacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificado_sanitario_imagen_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificado_sanitario_nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_creacion_embarque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conocimiento_de_embarque_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_de_llegada` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `embarques_compania_foreign` (`compania`),
  CONSTRAINT `embarques_compania_foreign` FOREIGN KEY (`compania`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(50) DEFAULT NULL,
  `description` text,
  `category` varchar(12) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `landing_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tags` int unsigned DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `landing_pages_meta_tags_foreign` (`meta_tags`),
  CONSTRAINT `landing_pages_meta_tags_foreign` FOREIGN KEY (`meta_tags`) REFERENCES `meta_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `meta_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `proveedores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `company_id` int unsigned DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `wappler_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch` int DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `wappler_migrations_lock` (
  `index` int unsigned NOT NULL AUTO_INCREMENT,
  `is_locked` int DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog_posts` (`id`, `img`, `title`, `path`, `meta`, `body`, `author`, `date`, `keywords`, `twitter_card`) VALUES
(1, '/img/vessel-side', 'Cómo reducir el coste de las importaciones a Venezuela', 'como-reducir-el-coste-de-las-importaciones-a-venezuela', 'Para los empresarios que buscan importar productos a Venezuela, hay algunas cosas que pueden ayudar a reducir los costos. ¡Descubre cuáles son en nuestro blog!', '<h1>C&oacute;mo reducir el coste de las importaciones a Venezuela</h1>\n<p>Para los empresarios que buscan importar bienes a Venezuela, hay algunas cosas que deben tener en cuenta para reducir los costos. En primer lugar, es importante ser consciente del coste de hacer negocios en el pa&iacute;s. Seg&uacute;n el Banco Mundial, el coste de las importaciones en Venezuela es superior a la media regional. Esto se debe a una serie de factores, como los elevados aranceles, la falta de transparencia de la normativa y la ineficacia de las instalaciones portuarias. En segundo lugar, es importante trabajar con un socio de confianza que pueda ayudarle a navegar por el complicado proceso de importaci&oacute;n. Y en tercer lugar, es importante tener un claro conocimiento del potencial de mercado de su producto en Venezuela. Si tiene en cuenta estos factores, podr&aacute; reducir el coste de la importaci&oacute;n a Venezuela y maximizar sus posibilidades de &eacute;xito.</p>\n<h2>El costo de hacer negocios en Venezuela</h2>\n<p>El coste de hacer negocios en Venezuela es elevado debido a una serie de factores, como los elevados aranceles, las regulaciones poco transparentes y las ineficientes instalaciones portuarias. Estos factores dificultan a los empresarios la importaci&oacute;n de mercanc&iacute;as al pa&iacute;s. Sin embargo, si se trabaja con un socio fiable y se tiene un claro conocimiento del potencial de mercado de su producto, se puede reducir el coste de la importaci&oacute;n a Venezuela.</p>\n<h2>Aranceles elevados</h2>\n<p>Uno de los principales factores que contribuyen al alto coste de la importaci&oacute;n a Venezuela son los elevados aranceles. Las mercanc&iacute;as importadas en el pa&iacute;s est&aacute;n sujetas a una serie de impuestos y tasas, incluyendo un arancel de importaci&oacute;n, el impuesto sobre el valor a&ntilde;adido (IVA) y los derechos de aduana. La carga combinada de estos impuestos y tasas puede alcanzar el 50% del valor de las mercanc&iacute;as importadas. Para los empresarios que deseen importar mercanc&iacute;as a Venezuela, es importante tener en cuenta estos elevados aranceles en sus costes.</p>\n<p>Venezuela tiene unos aranceles muy elevados para la importaci&oacute;n de productos. Seg&uacute;n el Banco Mundial, los aranceles medios en Venezuela son del 17,5%, mientras que la media regional es del 9,7%. Esto significa que los empresarios tienen que pagar un impuesto mucho m&aacute;s alto por sus productos cuando los importan a Venezuela.</p>\n<h2>Regulaciones no transparentes</h2>\n<p>Otro factor que contribuye al alto coste de las importaciones en Venezuela es la falta de transparencia de las normativas. El gobierno venezolano ha puesto en marcha una serie de regulaciones que dificultan a los empresarios la comprensi&oacute;n de los requisitos para la importaci&oacute;n de bienes en el pa&iacute;s. Como resultado, los empresarios a menudo tienen que incurrir en costes adicionales para cumplir con estas regulaciones. Por ejemplo, es posible que tengan que contratar a consultores o abogados para que les ayuden a desenvolverse en el complicado proceso de importaci&oacute;n. Estos costes adicionales pueden acumularse r&aacute;pidamente y encarecer a&uacute;n m&aacute;s la importaci&oacute;n de mercanc&iacute;as a Venezuela.</p>\n<h2>Instalaciones portuarias ineficientes</h2>\n<p>Otro factor que contribuye al elevado coste de las importaciones en Venezuela es la ineficacia de las instalaciones portuarias. Las instalaciones portuarias en Venezuela no son capaces de manejar eficientemente el volumen de importaciones que llegan al pa&iacute;s. Como resultado, los retrasos son comunes y las empresas a menudo tienen que incurrir en costes adicionales para conseguir que sus mercanc&iacute;as pasen por la aduana. Adem&aacute;s, las empresas pueden tener que pagar tasas de almacenamiento si sus mercanc&iacute;as permanecen retenidas en el puerto durante un largo periodo de tiempo. Estos costes adicionales pueden acumularse r&aacute;pidamente y encarecer a&uacute;n m&aacute;s la importaci&oacute;n de mercanc&iacute;as a Venezuela</p>\n<p>Los empresarios que deseen importar mercanc&iacute;as a Venezuela deben ser conscientes del alto coste de hacer negocios en el pa&iacute;s. Entre los altos aranceles, las regulaciones no transparentes, y las instalaciones portuarias ineficientes, hay una serie de cosas que contribuyen a los altos costos de importaci&oacute;n a este pa&iacute;s, y es importante saber c&oacute;mo mitigar estos costos para que el negocio sea exitoso.</p>\n<h2>&iquest;Qu&eacute; hacer para mitigar los costos de importar a Venezuela?</h2>\n<p>Como importador, hay algunas maneras de reducir el coste de la importaci&oacute;n de mercanc&iacute;as a Venezuela.</p>\n<ul>\n<li>Negociar mejores condiciones con sus proveedores, como plazos de pago m&aacute;s largos o descuentos por volumen.</li>\n<li>Buscar proveedores que est&eacute;n situados m&aacute;s cerca de Venezuela. Esto puede ayudar a reducir los costes de transporte.</li>\n<li>Consolidar sus env&iacute;os. Esto significa que usted env&iacute;a varios productos en un solo contenedor, lo que puede ahorrar en los costes de env&iacute;o.</li>\n<li>Reducir los costes es elegir un m&eacute;todo de env&iacute;o menos caro, como el transporte mar&iacute;timo en lugar del a&eacute;reo.</li>\n<li>Aprovechar las iniciativas del gobierno que est&aacute;n dise&ntilde;adas para ayudar a reducir el coste de las importaciones. Investigando y aprovechando todos los recursos disponibles, puede hacer que la importaci&oacute;n a Venezuela sea m&aacute;s asequible.</li>\n<li>Trabaja con un socio fiable y se tiene un claro conocimiento del potencial de mercado de su producto, es posible reducir estos costos.</li>\n<li>Conocer el potencial del mercado para el producto tambi&eacute;n es importante, ya que permite a las empresas establecer un plan para vender el producto a un precio que cubra los costos de importaci&oacute;n.</li>\n</ul>\n<p>En general, los altos costes de importaci&oacute;n en Venezuela ponen a las empresas en desventaja respecto a sus competidores en otros pa&iacute;ses. Sin embargo, si se trabaja con un socio fiable y se tiene un claro conocimiento del potencial de mercado de su producto, es posible reducir estos costos y tener &eacute;xito en el mercado venezolano.</p>\n<p>En Contucarga, nos dedicamos a proporcionar a nuestros clientes una asesor&iacute;a log&iacute;stica integral para ayudarlos a optimizar sus operaciones y alcanzar sus objetivos comerciales. Si desea obtener m&aacute;s informaci&oacute;n sobre nuestros servicios, no dude en ponerse en contacto con nosotros hoy mismo. &iexcl;Estaremos encantados de responder a todas sus preguntas!</p>\n<p>&nbsp;</p>', 'Juan P. Ravelo', '2022-10-05', 'comercio internacional, logística, importación, exportación, almacenamiento', NULL),
(2, '/img/container-crane.jpg', '¿Qué es un agente de aduanas y cómo puede ayudarme? ', 'que-es-un-agente-de-aduanas-y-como-puede-ayudarme', 'Un agente de aduanas es un profesional que puede ayudarle a cumplir con la normativa de comercio internacional. Conozca más sobre lo que hacen y cómo pueden ayudar a su negocio a crecer.', '<h1>&iquest;Qu&eacute; es un agente de aduanas y c&oacute;mo puede ayudarme?</h1>\n<p>Un agente de aduanas es un profesional autorizado por el gobierno para ayudar a los importadores y exportadores a cumplir con las regulaciones del comercio internacional. Los agentes de aduanas desempe&ntilde;an un papel vital en el comercio mundial al garantizar que los env&iacute;os est&eacute;n debidamente documentados y clasificados, y que se paguen todos los derechos e impuestos aplicables. Adem&aacute;s de su conocimiento de la normativa comercial internacional, los agentes de aduanas tambi&eacute;n tienen acceso a una red de contactos en el sector que pueden ayudar a facilitar el movimiento de mercanc&iacute;as a trav&eacute;s de las fronteras.</p>\n<p>Si se dedica al comercio internacional o est&aacute; pensando en ampliar su negocio a los mercados extranjeros, trabajar con un agente de aduanas es una decisi&oacute;n inteligente. Un buen agente de aduanas le ahorrar&aacute; tiempo y dinero al encargarse del papeleo y la log&iacute;stica asociados a la importaci&oacute;n y exportaci&oacute;n de mercanc&iacute;as. Tambi&eacute;n puede proporcionarle una valiosa informaci&oacute;n sobre los mercados extranjeros y ofrecerle orientaci&oacute;n sobre c&oacute;mo navegar por el a menudo complejo mundo del comercio internacional</p>\n<h2>&iquest;Qu&eacute; hace un agente de aduanas?</h2>\n<p>Los agentes de aduanas suelen prestar los siguientes servicios a sus clientes</p>\n<ol>\n<li>Realizaci&oacute;n de revisiones de conformidad de las exportaciones para garantizar que los env&iacute;os est&eacute;n correctamente documentados y clasificados</li>\n<li>Presentaci&oacute;n de declaraciones de importaci&oacute;n/exportaci&oacute;n ante los organismos gubernamentales</li>\n<li>Tramitar los pagos de derechos, impuestos y otras tasas</li>\n<li>Organizar el transporte de las mercanc&iacute;as importadas desde el puerto de entrada hasta el almac&eacute;n del consignatario</li>\n<li>Proporcionar orientaci&oacute;n sobre la clasificaci&oacute;n arancelaria, la determinaci&oacute;n del pa&iacute;s de origen y diversos requisitos de permisos</li>\n<li>Seguimiento de los env&iacute;os a trav&eacute;s del proceso de importaci&oacute;n/exportaci&oacute;n para garantizar la entrega a tiempo</li>\n<li>Abogar en nombre de los clientes ante los organismos gubernamentales</li>\n</ol>\n<p>Los agentes de aduanas tambi&eacute;n mantienen relaciones con transitarios, transportistas y otros proveedores de servicios para facilitar el movimiento de mercanc&iacute;as a trav&eacute;s de las fronteras. Adem&aacute;s, a menudo ofrecen servicios de valor a&ntilde;adido, como la b&uacute;squeda de productos, el estudio de mercado y el almacenamiento/distribuci&oacute;n</p>\n<h2>&iquest;C&oacute;mo elegir un agente de aduanas?</h2>\n<p>A la hora de seleccionar un agente de aduanas, es importante elegir a alguien que tenga experiencia en la gesti&oacute;n de env&iacute;os similares a los suyos en cuanto a tipo de producto, valor, pa&iacute;s de destino, etc. Tambi&eacute;n debe tener en cuenta factores como su reputaci&oacute;n en el sector, su historial de servicio al cliente y su capacidad para cumplir los plazos. Una vez que haya reducido sus opciones, aseg&uacute;rese de obtener presupuestos de varios agentes para poder comparar los precios y los servicios ofrecidos. A la hora de elegir un agente de aduanas, lo m&aacute;s barato no siempre es lo mejor; es importante tener en cuenta la calidad del servicio al tomar la decisi&oacute;n</p>\n<p>Un agente de aduanas puede ahorrarle tiempo y dinero al encargarse del papeleo y la log&iacute;stica asociados a la importaci&oacute;n y exportaci&oacute;n de mercanc&iacute;as. Tambi&eacute;n puede proporcionarle una valiosa informaci&oacute;n sobre los mercados extranjeros y ofrecerle orientaci&oacute;n sobre c&oacute;mo navegar por el a menudo complejo mundo del comercio internacional. Si se dedica al comercio internacional o est&aacute; pensando en ampliar su negocio a los mercados extranjeros, trabajar con un agente de aduanas es una decisi&oacute;n inteligente.</p>\n<p>Si est&aacute; buscando un servicio profesional de agenciamiento aduanal, no dude en contactar con nosotros. Nuestros agentes est&aacute;n altamente cualificados y cuentan con una gran experiencia en el sector. No importa si sus env&iacute;os son grandes o peque&ntilde;os, locales o internacionales, podemos ayudarle a gestionarlos de forma eficiente y segura. P&oacute;ngase en contacto con nosotros para obtener m&aacute;s informaci&oacute;n sobre nuestros servicios y un presupuesto personalizado.</p>\n<p>&nbsp;</p>', 'Juan P. Ravelo', '2022-09-28', 'comercio internacional, logística, importación, exportación, almacenamiento', NULL),
(3, '/img/containers-pile', 'Cómo la logística puede hacer o deshacer el comercio internacional', 'como-la-logistica-puede-hacer-o-deshacer-el-comercio-internacional', 'Si usted está en el negocio de la importación o exportación de mercancías, entonces usted sabe que la logística puede hacer o romper su operación. Una estrategia logística eficiente y eficaz es esencial para que las mercancías lleguen al mercado a tiempo y dentro del presupuesto. En esta entrada del blog, examinaremos el papel de las aduanas en la logística de importación y exportación, así como los factores clave a tener en cuenta al planificar sus estrategias de logística.', '<h1>C&oacute;mo la log&iacute;stica puede hacer o deshacer el comercio internacional</h1>\n<p>Si usted est&aacute; en el negocio de la importaci&oacute;n o exportaci&oacute;n de mercanc&iacute;as, entonces usted sabe que la log&iacute;stica puede hacer o romper su operaci&oacute;n. Una estrategia log&iacute;stica eficiente y eficaz es esencial para llevar las mercanc&iacute;as al mercado a tiempo y dentro del presupuesto. En esta entrada del blog, examinaremos el papel de la log&iacute;stica en el comercio internacional y algunas de las formas en que puede optimizar su propia estrategia log&iacute;stica.</p>\n<p>En el contexto del comercio internacional la log&iacute;stica se ocupa de todos los pasos necesarios para transportar mercanc&iacute;as desde su origen hasta su destino final. Esto incluye el embalaje, el almacenamiento, el transporte, la manipulaci&oacute;n de carga, la documentaci&oacute;n y mucho m&aacute;s. Una estrategia log&iacute;stica eficiente es esencial para el &eacute;xito del comercio internacional.</p>\n<p>Existen muchos desaf&iacute;os a los que se enfrenta un operador de comercio internacional al tratar de coordinar una estrategia log&iacute;stica eficaz. Estos desaf&iacute;os pueden incluir:</p>\n<h2>La necesidad de transportar mercanc&iacute;as a trav&eacute;s de fronteras nacionales, lo que significa que se deben cumplir con los requisitos aduaneros y de exportaci&oacute;n / importaci&oacute;n de cada pa&iacute;s.</h2>\n<p>La econom&iacute;a global ha creado la necesidad de transportar mercanc&iacute;as a trav&eacute;s de las fronteras nacionales. Para facilitar este comercio, es esencial que se cumplan los requisitos aduaneros y de exportaci&oacute;n/importaci&oacute;n de cada pa&iacute;s. La normativa aduanera var&iacute;a de un pa&iacute;s a otro, y es importante conocer los requisitos del pa&iacute;s de destino antes de enviar las mercanc&iacute;as. Adem&aacute;s, todos los env&iacute;os deben estar debidamente etiquetados y se debe presentar la documentaci&oacute;n para poder pasar la aduana. El incumplimiento de estos requisitos puede acarrear retrasos, multas e incluso la incautaci&oacute;n de las mercanc&iacute;as. La necesidad de transportar mercanc&iacute;as a trav&eacute;s de las fronteras nacionales es una realidad de la econom&iacute;a global, y es esencial asegurarse de que todos los env&iacute;os cumplen con la normativa aduanera.</p>\n<h2>La necesidad de coordinar los horarios de transporte con los horarios de producci&oacute;n y venta, lo que puede ser un desaf&iacute;o cuando se trata de mercanc&iacute;as perecederos o con fecha de caducidad.</h2>\n<p>Cuando las empresas transportan productos perecederos o sensibles al tiempo, es necesario coordinar los horarios de transporte con los de producci&oacute;n y venta. Esto puede suponer un reto, ya que el calendario de transporte debe coincidir con el momento en que se necesitan las mercanc&iacute;as. Si el programa de transporte no se coordina correctamente, es posible que la mercanc&iacute;a no se entregue a tiempo o que llegue estropeada. Hay algunas formas de superar este reto. En primer lugar, las empresas pueden trabajar con proveedores de transporte que tengan experiencia en el transporte de productos perecederos. En segundo lugar, las empresas pueden introducir flexibilidad en sus programas de producci&oacute;n y venta. Y en tercer lugar, las empresas pueden utilizar la tecnolog&iacute;a para rastrear el paradero de sus mercanc&iacute;as y controlar las condiciones durante el transporte. Con estas medidas, las empresas pueden garantizar que sus productos perecederos lleguen frescos y a tiempo.</p>\n<h2>La necesidad de mantener el seguimiento de las mercanc&iacute;as a medida que avanzan a trav&eacute;s de la cadena de suministro, lo que puede ser un reto cuando se trata con proveedores y transportistas internacionales.</h2>\n<p>Las cadenas de suministro internacionales pueden ser complejas y dif&iacute;ciles de gestionar. A menudo intervienen muchos proveedores y transportistas diferentes, y cada etapa del proceso puede tener lugar en un pa&iacute;s distinto. Esto puede dificultar el seguimiento de las mercanc&iacute;as a lo largo de la cadena de suministro. Sin embargo, hay algunas medidas que las empresas pueden tomar para simplificar el proceso y reducir el riesgo de p&eacute;rdida o da&ntilde;o de las mercanc&iacute;as. En primer lugar, deben definir claramente las funciones y responsabilidades de cada proveedor y transportista. En segundo lugar, deben crear itinerarios detallados que incluyan informaci&oacute;n sobre las horas de llegada y salida previstas, as&iacute; como la informaci&oacute;n de contacto de cada parte implicada. Por &uacute;ltimo, deben hacer un seguimiento de las mercanc&iacute;as mediante soluciones digitales de rastreo que les permitan ver d&oacute;nde se encuentran las mercanc&iacute;as en todo momento. Con estas medidas, las empresas pueden aumentar la visibilidad de sus cadenas de suministro y garantizar que las mercanc&iacute;as se entregan de forma segura y puntual.</p>\n<h2>La necesidad de coordinar el almacenamiento y manipulaci&oacute;n de carga en diferentes ubicaciones geogr&aacute;ficas.</h2>\n<p>El almacenamiento y la manipulaci&oacute;n de la carga desempe&ntilde;an un papel importante en la cadena de suministro de cualquier organizaci&oacute;n. Para optimizar las operaciones, es esencial coordinar estas actividades en diferentes ubicaciones geogr&aacute;ficas. Esto puede ser un reto debido a las diferentes zonas horarias, las condiciones clim&aacute;ticas y la infraestructura de cada lugar. Sin embargo, hay algunos consejos que pueden ayudar a que el proceso se desarrolle sin problemas. En primer lugar, es importante comunicar claramente las expectativas y los plazos de cada equipo. A continuaci&oacute;n, es &uacute;til establecer pr&aacute;cticas comunes de etiquetado y seguimiento de los env&iacute;os. Por &uacute;ltimo, es crucial disponer de un sistema s&oacute;lido para supervisar e informar de los progresos. Siguiendo estos pasos, las organizaciones pueden asegurarse de que sus operaciones de almacenamiento y manipulaci&oacute;n de la carga est&aacute;n coordinadas y son eficientes.</p>\n<h2>La necesidad de minimizar los costos log&iacute;sticos sin sacrificar la calidad del servicio.</h2>\n<p>En el mundo empresarial, el tiempo es oro. Por eso, una log&iacute;stica eficaz es esencial para mantener los costes bajos y garantizar que los productos y servicios se entreguen a tiempo y en buenas condiciones. Al mismo tiempo, las empresas deben tener cuidado de no sacrificar la calidad en su b&uacute;squeda de la eficiencia. Para lograr el equilibrio adecuado, las empresas deben considerar cuidadosamente sus necesidades log&iacute;sticas y hacer uso de las &uacute;ltimas tecnolog&iacute;as y las mejores pr&aacute;cticas. Al adoptar un enfoque proactivo de la log&iacute;stica, las empresas pueden minimizar los costes sin sacrificar la calidad del servicio. Como resultado, podr&aacute;n competir mejor en el mercado y mejorar sus resultados.</p>\n<h2>El costo del transporte internacional, que puede ser muy alto si no se planifica cuidadosamente.</h2>\n<p>Planificar cuidadosamente su transporte internacional puede ayudarle a evitar costosos errores. Una forma de no salirse del presupuesto es recurrir a un transitario. Un transitario es una empresa especializada en el transporte internacional de mercanc&iacute;as. Pueden ayudarle a elegir el m&eacute;todo de env&iacute;o y la ruta m&aacute;s rentables, y tambi&eacute;n se encargar&aacute;n del papeleo necesario para el despacho de aduanas. Adem&aacute;s, es importante tener en cuenta el tipo de contenedor que necesitar&aacute;. Dependiendo del tama&ntilde;o y el peso de su env&iacute;o, puede ahorrar dinero utilizando una opci&oacute;n menos costosa, como el servicio LCL (carga inferior a un contenedor). Por &uacute;ltimo, aseg&uacute;rese de obtener varios presupuestos de diferentes proveedores de transporte antes de tomar su decisi&oacute;n final. Si se toma el tiempo necesario para comparar los costes, podr&aacute; asegurarse de obtener el mejor precio posible para su env&iacute;o internacional.</p>\n<p>Hay muchas formas en que puede optimizar su estrategia log&iacute;stica para minimizar los costos y maximizar la eficiencia. Algunas de estas formas son:</p>\n<h2>Identificar y seleccionar los modos de transporte m&aacute;s adecuados para sus mercanc&iacute;as.</h2>\n<ol>\n<li>Encontrar y utilizar las rutas de transporte m&aacute;s econ&oacute;micas y eficientes.</li>\n<li>Coordinar el transporte con otros proveedores de servicios, como agentes aduaneros o compa&ntilde;&iacute;as de seguros, para minimizar los costos y la complejidad.</li>\n<li>Invertir en tecnolog&iacute;a log&iacute;stica, como sistemas de seguimiento y gesti&oacute;n de inventario, para mejorar la eficiencia y el control.</li>\n</ol>\n<p>La log&iacute;stica es una parte importante y complicada del comercio internacional, pero con la planificaci&oacute;n adecuada y la inversi&oacute;n en las herramientas necesarias, puede asegurarse de que su estrategia log&iacute;stica sea eficiente y eficaz.</p>\n<p>Para tener &eacute;xito en el comercio internacional, es esencial que se cuente con una estrategia log&iacute;stica eficiente y eficaz. En <a href=\"http://www.contucarga.com/\">Contucarga</a>, nos dedicamos a proporcionar a nuestros clientes una asesor&iacute;a log&iacute;stica integral para ayudarlos a optimizar sus operaciones y alcanzar sus objetivos comerciales. Si desea obtener m&aacute;s informaci&oacute;n sobre nuestros servicios, no dude en ponerse en contacto con nosotros hoy mismo. &iexcl;Estaremos encantados de responder a todas sus preguntas!</p>', 'Antonio Ravelo', '2022-09-21', 'comercio internacional, logística, importación, exportación, almacenamiento, Requisitos Aduaneros, Transporte de Productos Perecederos, Seguimiento de la Cadena de Suministro', NULL),
(4, '/img/loading-docks', 'Servicios aduaneros y logísticos: Una alianza estratégica cargada de múltiples beneficios', 'servicios-aduaneros-y-logisticos-una-alianza-estrategica-cargada-de-multiples-beneficios', 'Si es usted importador o exportador, los agentes de aduanas pueden desempeñar un papel fundamental para que su negocio sea más eficaz. He aquí cuatro de las muchas maneras en que lo hacen.', '<h1>Servicios aduaneros y log&iacute;sticos: una alianza estrat&eacute;gica cargada de m&uacute;ltiples beneficios</h1>\n<p>Los empresarios que desean importar o exportar sus productos tienen mucho que considerar. Hay cuotas, aranceles, derechos y el cumplimiento de la normativa, por no hablar de la propia log&iacute;stica de llevar el producto de un lugar a otro. Puede ser una tarea desalentadora, pero por suerte hay servicios de aduanas y log&iacute;stica que pueden ayudar. De hecho, los servicios aduaneros y log&iacute;sticos suelen aprovecharse mejor cuando trabajan juntos en una alianza estrat&eacute;gica. He aqu&iacute; algunas de las muchas ventajas que puede aportar una alianza de este tipo.</p>\n<h2>Mejora de la gesti&oacute;n del tiempo</h2>\n<p>Una de las mayores ventajas de utilizar tanto los servicios aduaneros como los log&iacute;sticos es la mejora de la gesti&oacute;n del tiempo. Cuando los expertos se encargan del papeleo y del proceso de env&iacute;o en s&iacute;, usted puede liberar su propio tiempo para centrarse en otros aspectos de su negocio. Esto es especialmente beneficioso para los empresarios que acaban de empezar y llevan muchos sombreros. Una mejor gesti&oacute;n del tiempo puede conducir a una mayor eficiencia y productividad en otras &aacute;reas de su negocio</p>\n<h2>Mayor precisi&oacute;n operativa</h2>\n<p>Otro beneficio importante es el aumento de la precisi&oacute;n. Cuando trabaja con servicios de aduanas y log&iacute;stica, puede estar seguro de que todo el papeleo se completar&aacute; correctamente y a tiempo. Esto es crucial porque incluso un error en los documentos de importaci&oacute;n/exportaci&oacute;n puede dar lugar a retrasos o sanciones. Los profesionales que trabajan en los servicios de aduanas y log&iacute;stica tienen la experiencia y los conocimientos necesarios para garantizar que todo se haga correctamente a la primera</p>\n<h2>Ahorro de costos log&iacute;sticos</h2>\n<p>Trabajar con servicios aduaneros y log&iacute;sticos tambi&eacute;n puede suponer un ahorro de costes. Estos servicios suelen tener relaciones establecidas con aerol&iacute;neas, transportistas, empresas de transporte por carretera, etc., lo que significa que normalmente pueden obtener mejores tarifas que los particulares que no trabajan con ellos. Adem&aacute;s, los servicios de aduanas y log&iacute;stica pueden ayudarle a aprovechar las bonificaciones o programas especiales que puedan estar disponibles (por ejemplo, la clasificaci&oacute;n arancelaria)</p>\n<h2>Reducci&oacute;n de riesgos operativos y financieros</h2>\n<p>Al trabajar con profesionales de servicios aduaneros y log&iacute;stica, tambi&eacute;n puede beneficiarse de una mayor protecci&oacute;n contra los riesgos. Esto se debe a que est&aacute;n familiarizados con el proceso y saben c&oacute;mo minimizar o evitar los problemas. En general, tienen acceso a una red de contactos mucho m&aacute;s amplia que la suya propia, lo que significa que pueden obtener la informaci&oacute;n y el asesoramiento necesarios para garantizar el &eacute;xito del env&iacute;o.</p>\n<h2>Tranquilidad</h2>\n<p>Por &uacute;ltimo, pero no por ello menos importante, es la tranquilidad que ofrecen los servicios de aduanas y log&iacute;stica. Como ya se ha mencionado, el env&iacute;o de productos a otro pa&iacute;s puede ser un proceso estresante y abrumador. Sin embargo, si conf&iacute;a en profesionales para manejar el proceso en su nombre, podr&aacute; disfrutar de un mayor nivel de tranquilidad. Esto le permite centrarse en lo que realmente importa: hacer crecer su negocio.</p>\n<p>Utilizar los servicios aduaneros y log&iacute;sticos para importar o exportar productos tiene muchas ventajas. Estos servicios pueden ahorrarle tiempo, dinero y dolores de cabeza al encargarse de todo el papeleo y los detalles relacionados con el env&iacute;o de sus mercanc&iacute;as. Cuando trabaja con <a href=\"http://www.contucarga.com/\">Contucarga</a>, puede estar seguro de que sus productos llegar&aacute;n a su destino de forma segura y a tiempo, siempre. &iexcl;P&oacute;ngase en contacto con nosotros hoy para aprender m&aacute;s acerca de c&oacute;mo podemos ayudar a su negocio a tener &eacute;xito!</p>', 'Antonio Ravelo', '2022-09-15', 'comercio internacional, logística, importación, exportación, almacenamiento', NULL),
(5, '/img/container-yard-perspective', '8 factores que influyen en el aumento de los gastos aduaneros en Venezuela', '8-factores-que-influyen-el-aumento-de-las-tasas-aduaneras-venezuela', 'Si está haciendo negocios en Venezuela, es importante que conozcas la normativa aduanera del país. Los cambios recientes han dado lugar a un aumento de las tasas aduaneras, que pueden mermar sus beneficios si no tiene cuidado. En este blog, echaremos un vistazo a 8 de los principales factores que influyen en el aumento de las tasas aduaneras en Venezuela. ¡No se lo pierdas!', '<h1>8 factores que influyen en el aumento de los gastos aduaneros en Venezuela</h1>\n<p>Si est&aacute; haciendo negocios en Venezuela, es importante estar al tanto de las regulaciones aduaneras del pa&iacute;s. Los cambios recientes han dado lugar a un aumento de los gastos de aduana, lo que puede mermar sus beneficios si no tiene cuidado. En este blog, echaremos un vistazo a cuatro de los factores m&aacute;s importantes que influyen en el aumento de los gastos aduaneros en Venezuela.</p>\n<h2>1. La devaluaci&oacute;n del bol&iacute;var</h2>\n<p>Para entender los efectos de la actual crisis sobre las importaciones y exportaciones venezolanas, debemos primero observar el valor del bol&iacute;var venezolano. El bol&iacute;var ha ido perdiendo valor desde hace a&ntilde;os, y actualmente vale menos de una d&eacute;cima parte de un d&oacute;lar estadounidense. Esto ha hecho que los productos importados sean mucho m&aacute;s caros, ya que deben pagarse en d&oacute;lares estadounidenses.</p>\n<h2>2. La escasez de divisas</h2>\n<p>La escasez de divisas es otro problema que afecta negativamente las importaciones y exportaciones en Venezuela. Debido a la devaluaci&oacute;n del bol&iacute;var, muchas empresas han dejado de importar productos para evitar perder dinero. Esto ha llevado a una disminuci&oacute;n de la oferta de productos en el pa&iacute;s, lo que a su vez ha encarecido los precios.</p>\n<h2>3. Los controles cambiarios</h2>\n<p>Desde 2003, el gobierno venezolano ha implementado diversos controles cambiarios con el objetivo de regular el flujo de divisas. Estos controles han restringido la cantidad de d&oacute;lares que las empresas pueden adquirir, lo que ha aumentado significativamente los costes de importaci&oacute;n.</p>\n<h2>4. La tasa de inflaci&oacute;n</h2>\n<p>La inflaci&oacute;n es un problema generalizado en Venezuela, y se ha agravado en los &uacute;ltimos a&ntilde;os debido a la crisis econ&oacute;mica. Seg&uacute;n datos del Banco Central de Venezuela, la tasa de inflaci&oacute;n alcanz&oacute; el 1.37 millones por ciento en 2018. Esto significa que los productos importados se han encarecido significativamente, ya que el valor del bol&iacute;var se ha reducido dr&aacute;sticamente.</p>\n<h2>5. Las sanciones de Estados Unidos a Venezuela</h2>\n<p>En 2017, Estados Unidos impuso sanciones a Venezuela. Estas sanciones han tenido un impacto significativo en las importaciones y exportaciones de Venezuela, ya que han bloqueado el acceso a divisas y ha restringido el comercio con otros pa&iacute;ses.</p>\n<h2>6. El aumento de los precios mundiales del petroleo</h2>\n<p>Venezuela es un pa&iacute;s altamente dependiente del petr&oacute;leo, y el aumento de los precios mundiales ha tenido un impacto significativo en la econom&iacute;a venezolana. Esto se debe a que Venezuela tiene pocas exportaciones no petroleras, por lo que el aumento de los precios internacionales del petr&oacute;leo ha encarecido significativamente las importaciones.</p>\n<h2>7. El control de los funcionarios de aduanas</h2>\n<p>Los funcionarios de aduanas se han vuelto mucho m&aacute;s estrictos en sus inspecciones de las mercanc&iacute;as importadas. Ahora es m&aacute;s probable que confisquen los env&iacute;os que consideren ilegales o de contrabando. Esto ha provocado un aumento de los costes para las empresas, ya que ahora deben tener en cuenta la posibilidad de que sus mercanc&iacute;as sean confiscadas</p>\n<h2>8. Los nuevos aranceles y tasas a las mercanc&iacute;as importadas</h2>\n<p>El gobierno venezolano ha aplicado recientemente nuevos aranceles y tasas impositivas a los productos importados en un esfuerzo por aumentar los ingresos. Estos pueden oscilar entre el 5 y el 30% del valor del env&iacute;o, dependiendo del tipo de bienes que se importen. Se trata de un gasto importante que debe tenerse en cuenta en el coste de hacer negocios en Venezuela</p>\n<p>Las empresas deben tener en cuenta estos factores a la hora de planificar sus env&iacute;os hacia y desde Venezuela. Si desea evitar aumentos significativos en sus gastos aduaneros, es importante estar al tanto de los factores mencionados anteriormente. Mantenerse informado le ayudar&aacute; a tomar las medidas necesarias para minimizar los costes y maximizar los beneficios de sus operaciones comerciales en Venezuela.</p>\n<p>Si est&aacute; buscando ayuda para importar a Venezuela. Nuestra empresa ofrece servicios de agente de aduanas confiables y eficientes, que le ayudar&aacute;n a navegar por el complejo proceso de importaci&oacute;n y optimizar los costos de importaci&oacute;n asociados a sus operaciones de comercio internacional. Contamos con una amplia experiencia en el mercado y un historial impecable de servicio al cliente. <a href=\"http://www.contucarga.com/consulta\">P&oacute;ngase en contacto con nosotros hoy mismo</a> para obtener m&aacute;s informaci&oacute;n.</p>', 'Mario Fernandez', '2022-09-08', 'comercio internacional, logística, importación, exportación, almacenamiento', NULL),
(6, '/img/logistic-yard', 'Consideraciones importantes para importar a Venezuela', 'consideraciones-importantes-para-importar-a-venezuela', 'Si estás buscando importar productos a Venezuela, es importante que conozcas el clima político y económico actual. Esta entrada del blog repasa los aspectos básicos que debe conocer antes de iniciar el proceso.', '<h1>Consideraciones importantes para importar a Venezuela</h1>\n<p>Si est&aacute; pensando en importar a Venezuela, hay algunas cosas que debe saber. El pa&iacute;s ha pasado por mucha agitaci&oacute;n pol&iacute;tica y econ&oacute;mica en los &uacute;ltimos a&ntilde;os, lo que ha hecho que la importaci&oacute;n de bienes sea dif&iacute;cil y a menudo impredecible. En este art&iacute;culo, repasaremos algunas de las consideraciones importantes que debe tener en cuenta antes de iniciar el proceso de importaci&oacute;n.</p>\n<h1>Compruebe si el producto que desea importar est&aacute; sujeto a alg&uacute;n requisito de licencia o registro con el gobierno venezolano</h1>\n<p>Antes de importar cualquier producto a Venezuela, es importante comprobar si est&aacute; sujeto a alg&uacute;n requisito de licencia o registro con el gobierno venezolano. Muchos productos est&aacute;n sujetos a este tipo de requisitos, y no importarlos podr&iacute;a resultar en multas o incluso en la confiscaci&oacute;n del producto. Por lo tanto, es importante que investigue si el producto que desea importar est&aacute; sujeto a alguna regulaci&oacute;n espec&iacute;fica.</p>\n<h2>Aseg&uacute;rese de que su producto cumple todas las normas de calidad y seguridad exigidas por la legislaci&oacute;n venezolana</h2>\n<p>En Venezuela, se exigen normas de calidad y seguridad para todos los productos importados. Aseg&uacute;rese de que su producto cumple con estas normas antes de importarlo a Venezuela, ya que no cumplirlas podr&iacute;a resultar en multas o incluso en la confiscaci&oacute;n del producto. Adem&aacute;s, es importante tener en cuenta que la legislaci&oacute;n venezolana est&aacute; sujeta a cambios, por lo que es importante mantenerse al d&iacute;a con los &uacute;ltimos requisitos.</p>\n<h2>Conseguir un seguro de carga para proteger su producto</h2>\n<p>Al importar un producto a Venezuela, es importante tener en cuenta que puede ser da&ntilde;ado o robado durante el env&iacute;o. Por lo tanto, es importante asegurar su producto con un seguro de carga adecuado. El costo del seguro de carga var&iacute;a dependiendo del valor de su producto, por lo que es importante obtener una cotizaci&oacute;n antes de iniciar el proceso de importaci&oacute;n.</p>\n<h2>Determine si tendr&aacute; que pagar derechos de aduana u otros impuestos sobre sus productos importados</h2>\n<p>En Venezuela, se aplican derechos de aduana y otros impuestos a los productos importados. Aseg&uacute;rese de estar al tanto de todos los derechos de aduana u otros impuestos aplicables a sus productos, ya que no pagar estos podr&iacute;a resultar en multas o incluso en la confiscaci&oacute;n de sus productos. Adem&aacute;s, es importante tener en cuenta que los derechos de aduana u otros impuestos aplicables pueden cambiar con frecuencia, por lo que es importante mantenerse al d&iacute;a con los &uacute;ltimos requisitos antes de iniciar el proceso de importaci&oacute;n.</p>\n<p>Consulte con un profesional de comercio internacional para obtener asesor&iacute;a sobre el proceso de importaci&oacute;n a Venezuela</p>\n<p>Antes de iniciar el proceso de importaci&oacute;n a Venezuela, es importante consultar con un profesional de comercio internacional para obtener asesor&iacute;a sobre el mismo. Un profesional de comercio internacional le ayudar&aacute; a comprender mejor el proceso de importaci&oacute;n y le dar&aacute; consejos &uacute;tiles para garantizar el &eacute;xito de su importaci&oacute;n.</p>\n<h2>Elija una empresa de transporte fiable que tenga experiencia en la importaci&oacute;n a Venezuela</h2>\n<p>Al elegir una empresa de transporte para importar sus productos a Venezuela, es importante que elija una empresa fiable y experimentada. Una empresa de transporte experimentada le ayudar&aacute; a evitar problemas y le garantizar&aacute; que sus productos lleguen a Venezuela de manera segura y oportuna. Adem&aacute;s, es importante tener en cuenta que el costo del transporte var&iacute;a dependiendo de la empresa de transporte que elija, por lo que es importante obtener una cotizaci&oacute;n antes de iniciar el proceso de importaci&oacute;n.</p>\n<h2>Mantenga toda la documentaci&oacute;n relacionada con su env&iacute;o en orden y f&aacute;cilmente disponible en caso de retrasos o problemas en la aduana</h2>\n<p>Cuando se importan productos a Venezuela, es importante mantener toda la documentaci&oacute;n relacionada con el env&iacute;o en orden. Esta documentaci&oacute;n incluye el manifiesto de carga, la factura de venta y el certificado de origen. Mantener esta documentaci&oacute;n en orden le ayudar&aacute; a evitar problemas y retrasos en el proceso de importaci&oacute;n, y le permitir&aacute; recuperar sus productos en caso de que sean retenidos en la aduana.</p>\n<p>Importar a Venezuela puede ser un proceso complicado y a menudo imprevisible, pero no tiene por qu&eacute; ser abrumador. Si se toma el tiempo necesario para investigar, elegir cuidadosamente el m&eacute;todo de env&iacute;o y encontrar un socio fiable que le ayude a navegar por el proceso, puede asegurarse de que su env&iacute;o llegue a salvo y a tiempo.</p>\n<p>Si est&aacute; buscando ayuda para importar a Venezuela, no busque m&aacute;s. Nuestra empresa ofrece servicios de agente de aduanas confiables y eficientes, que le ayudar&aacute;n a navegar por el complejo proceso de importaci&oacute;n. Contamos con una amplia experiencia en el mercado y un historial impecable de servicio al cliente. <a href=\"http://www.contucarga.com/consulta\">P&oacute;ngase en contacto con nosotros</a> hoy mismo para obtener m&aacute;s informaci&oacute;n.</p>', 'Mario Fernandez', '2022-08-25', 'importar a Venezuela, importación a Venezuela, clima político Venezuela, económico Venezuela, agente de aduanas, importación, exportación, almacenamiento, comercio exterior', NULL);

INSERT INTO `cars` (`id`, `make`, `model`, `year`) VALUES
(1, 'Isuzu', 'Hombre Space', '1998'),
(2, 'Buick', 'Terraza', '2007'),
(3, 'Mazda', 'Miata MX-5', '1997'),
(4, 'Ford', 'Escort', '1993'),
(5, 'Kia', 'Sedona', '2006'),
(6, 'Acura', 'TL', '2009'),
(7, 'Dodge', 'Stealth', '1994'),
(8, 'GMC', 'Yukon XL', '2006'),
(9, 'Acura', 'RL', '2011'),
(10, 'Toyota', 'Prius', '2007'),
(11, 'Mazda', 'RX-8', '2004'),
(12, 'Dodge', 'Omni', '1978'),
(13, 'Chevrolet', 'Malibu', '2000'),
(14, 'Toyota', 'Tacoma Xtra', '1998'),
(15, 'Mitsubishi', 'Pajero', '1986'),
(16, 'Oldsmobile', 'Silhouette', '2001'),
(17, 'Kia', 'Optima', '2012'),
(18, 'Chevrolet', 'Lumina', '1999'),
(19, 'Nissan', 'Versa', '2008'),
(20, 'Lexus', 'RX', '2011');

INSERT INTO `codigos_arancelarios` (`id`, `codigo_hts`, `descripcion`, `numero_sku`, `compania_id`) VALUES
(5, '876543', 'Uso emrpesarial', '9900877', 9),
(27, '8765432', 'Description', 'SKU', 13),
(28, '765432', 'test', 'uytrew', 44),
(39, '1234567', 'Shoes', '6543', 48);

INSERT INTO `companies` (`id`, `name`, `employee_number`, `website`, `address`, `city`, `country`, `industry`) VALUES
(9, 'acme', NULL, 'http://jprh.website/', NULL, NULL, NULL, NULL),
(10, 'jpco', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'jpinc', NULL, 'wwww.jpinc.com', NULL, 'Miami', 'United States', 'ropa'),
(44, 'Contu', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'ACAMS', NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'RCI', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'JPR', NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'jpo', NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'fg', NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'd', NULL, NULL, NULL, NULL, NULL, NULL),
(51, 're', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `consulta` (`id`, `valor_de_producto`, `llegada_de_mercancia`, `tipo_de_producto`, `tipo_de_entidad`, `info_adicional`, `user_id`, `fecha_solicitud`, `company_id`) VALUES
(2, 'Menor a 5.000 USD', 'Ya está aquí', 'Maquinaria y Equipo Industrial', 'Soy particular y estoy considerando comercializar este tipo de productos o insumos', 'hablandito', 27, '2022-10-21 02:58:24', 9),
(3, 'Mayor a 50.000 50.001 a 500.000 USD', 'Aún no lo se', 'Juguetes', 'Soy particular y me dedico a comercializar este tipo de productos o insumos', 'Hola Abu ', 59, '2022-11-04 01:21:40', NULL);

INSERT INTO `contact_form` (`id`, `servicio_de_interes`, `user_id`, `company_id`, `fecha_contacto`) VALUES
(8, 'agenciamiento de aduanas importación', NULL, NULL, NULL),
(9, 'agenciamiento de aduanas importación', NULL, NULL, NULL),
(14, 'agenciamiento de aduanas importación', NULL, NULL, NULL),
(17, 'flete internacional', NULL, NULL, NULL),
(18, 'flete internacional', NULL, NULL, NULL),
(22, 'agenciamiento de aduanas importación', 27, 13, '2022-10-21 10:44:53');

INSERT INTO `cotizacion` (`id`, `tipo_de_servicio`, `tipo_de_operacion`, `modalidad_de_transporte`, `informacion_adicional`, `equipo_especial`, `unidad_peso`, `tipomercanciaproducto`, `zona_destino`, `zona_origen`, `veh_tipo`, `reqerimiento_especial`, `valor_mercancia`, `peso_total`, `fecha_entrega`, `ciudad_destino`, `pais_destino`, `fecha_recogida`, `ciudad_origen`, `pais_origen`, `altura`, `longitud`, `anchura`, `veh_ano`, `veh_modelo`, `veh_fabricante`, `modalidad_de_embarque`, `fecha_solicitud`, `company_id`, `user_id`, `tipo_de_contenedor`, `cantidad_de_contenedores`, `status`, `fecha_de_respuesta`) VALUES
(1192, 'poliza de seguros', NULL, 'maritimo', '', 'No', 'Kg', 'Ropa, suministros médicos', 'Puerto', 'Zona Residencial', 'Particular', 'Material quimico', '7', '4', '2022-12-16', 'caracas', 'vzla', '2022-12-08', 'Miami', 'United States', '', '', '', '', '', '', '', '21:01:40', 44, 27, 'Contenedor 20” – Carga Seco', NULL, 'enviada', NULL),
(1193, 'Asesoria de proyectos', 'exportacion', 'terrestre', '', 'Si', 'Kg', 'Ropa, suministros médicos', 'Zona Residencial', 'Zona Residencial', 'Particular', 'inbond', '50000', '20000', '2022-12-22', 'caracas', 'vzla', '2022-12-08', 'Miami', 'United States', '30', '20', '10', '', '', '', 'contenedor', '21:05:45', 45, 27, 'Contenedor 20” – Carga Seco', NULL, 'enviada', NULL),
(1197, 'flete de transporte', 'importacion', 'maritimo', 'Please', 'Si', 'Libras', 'Ropa, suministros médicos', 'Zona Comercial', 'Zona Residencial', '', 'Material quimico', '20000', '200', '2023-01-27', 'caracas', 'Venezuela', '2023-01-26', 'Miami', 'United States', '', '', '', '', '', '', 'contenedor', '15:42:20', 44, 62, 'Contenedor 20” – Flat Rack', '1-5 contenedores', 'enviada', NULL),
(1199, 'poliza de seguros', 'importacion', 'terrestre', 'Testing', 'Si', 'Kg', 'Productos alimenticios, bebidas', 'Zona Comercial', 'Zona Residencial', 'Particular', 'inbond', '45000', '1334', '2023-01-26', 'caracas', 'Venezuela', '2023-01-25', 'Miami', 'United States', '50', '10', '12', '1900', 'Corolla', 'Toyota', 'carga suelta', '15:53:04', 45, 63, 'Contenedor 20” – Carga Seco', '1-5 contenedores', 'recibida', NULL),
(1200, 'poliza de seguros', 'otro', 'maritimo', 'test', 'No', 'Kg', 'Ropa, suministros médicos', 'Zona Residencial', 'Zona Residencial', 'Particular', 'inbond', '12', '12', '2023-01-27', 'caracas', 'Venezuela', '2023-01-25', 'Miami', 'United States', '', '', '', '1900', 'Corolla', 'Toyota', 'contenedor', '15:59:10', 47, 27, 'Contenedor 20” – Carga Seco', '1-5 contenedores', 'recibida', NULL);

INSERT INTO `cotizacion de servicios` (`id`, `tipo_de_servicio`, `tipo_de_operacion`) VALUES
(1, '', NULL);

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'ZW', 'Zimbabwe'),
(2, 'ZM', 'Zambia'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British Indian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'CV', 'Cape Verde'),
(42, 'KY', 'Cayman Islands'),
(43, 'CF', 'Central African Republic'),
(44, 'TD', 'Chad'),
(45, 'CL', 'Chile'),
(46, 'CN', 'China'),
(47, 'CX', 'Christmas Island'),
(48, 'CC', 'Cocos (Keeling) Islands'),
(49, 'CO', 'Colombia'),
(50, 'KM', 'Comoros'),
(51, 'CD', 'Democratic Republic of the Congo'),
(52, 'CG', 'Republic of Congo'),
(53, 'CK', 'Cook Islands'),
(54, 'CR', 'Costa Rica'),
(55, 'HR', 'Croatia (Hrvatska)'),
(56, 'CU', 'Cuba'),
(57, 'CY', 'Cyprus'),
(58, 'CZ', 'Czech Republic'),
(59, 'DK', 'Denmark'),
(60, 'DJ', 'Djibouti'),
(61, 'DM', 'Dominica'),
(62, 'DO', 'Dominican Republic'),
(63, 'TP', 'East Timor'),
(64, 'EC', 'Ecuador'),
(65, 'EG', 'Egypt'),
(66, 'SV', 'El Salvador'),
(67, 'GQ', 'Equatorial Guinea'),
(68, 'ER', 'Eritrea'),
(69, 'EE', 'Estonia'),
(70, 'ET', 'Ethiopia'),
(71, 'FK', 'Falkland Islands (Malvinas)'),
(72, 'FO', 'Faroe Islands'),
(73, 'FJ', 'Fiji'),
(74, 'FI', 'Finland'),
(75, 'FR', 'France'),
(76, 'FX', 'France, Metropolitan'),
(77, 'GF', 'French Guiana'),
(78, 'PF', 'French Polynesia'),
(79, 'TF', 'French Southern Territories'),
(80, 'GA', 'Gabon'),
(81, 'GM', 'Gambia'),
(82, 'GE', 'Georgia'),
(83, 'DE', 'Germany'),
(84, 'GH', 'Ghana'),
(85, 'GI', 'Gibraltar'),
(86, 'GK', 'Guernsey'),
(87, 'GR', 'Greece'),
(88, 'GL', 'Greenland'),
(89, 'GD', 'Grenada'),
(90, 'GP', 'Guadeloupe'),
(91, 'GU', 'Guam'),
(92, 'GT', 'Guatemala'),
(93, 'GN', 'Guinea'),
(94, 'GW', 'Guinea-Bissau'),
(95, 'GY', 'Guyana'),
(96, 'HT', 'Haiti'),
(97, 'HM', 'Heard and Mc Donald Islands'),
(98, 'HN', 'Honduras'),
(99, 'HK', 'Hong Kong'),
(100, 'HU', 'Hungary'),
(101, 'IS', 'Iceland'),
(102, 'IN', 'India'),
(103, 'IM', 'Isle of Man'),
(104, 'ID', 'Indonesia'),
(105, 'IR', 'Iran (Islamic Republic of)'),
(106, 'IQ', 'Iraq'),
(107, 'IE', 'Ireland'),
(108, 'IL', 'Israel'),
(109, 'IT', 'Italy'),
(110, 'CI', 'Ivory Coast'),
(111, 'JE', 'Jersey'),
(112, 'JM', 'Jamaica'),
(113, 'JP', 'Japan'),
(114, 'JO', 'Jordan'),
(115, 'KZ', 'Kazakhstan'),
(116, 'KE', 'Kenya'),
(117, 'KI', 'Kiribati'),
(118, 'KP', 'Korea, Democratic People\'s Republic of'),
(119, 'KR', 'Korea, Republic of'),
(120, 'XK', 'Kosovo'),
(121, 'KW', 'Kuwait'),
(122, 'KG', 'Kyrgyzstan'),
(123, 'LA', 'Lao People\'s Democratic Republic'),
(124, 'LV', 'Latvia'),
(125, 'LB', 'Lebanon'),
(126, 'LS', 'Lesotho'),
(127, 'LR', 'Liberia'),
(128, 'LY', 'Libyan Arab Jamahiriya'),
(129, 'LI', 'Liechtenstein'),
(130, 'LT', 'Lithuania'),
(131, 'LU', 'Luxembourg'),
(132, 'MO', 'Macau'),
(133, 'MK', 'North Macedonia'),
(134, 'MG', 'Madagascar'),
(135, 'MW', 'Malawi'),
(136, 'MY', 'Malaysia'),
(137, 'MV', 'Maldives'),
(138, 'ML', 'Mali'),
(139, 'MT', 'Malta'),
(140, 'MH', 'Marshall Islands'),
(141, 'MQ', 'Martinique'),
(142, 'MR', 'Mauritania'),
(143, 'MU', 'Mauritius'),
(144, 'TY', 'Mayotte'),
(145, 'MX', 'Mexico'),
(146, 'FM', 'Micronesia, Federated States of'),
(147, 'MD', 'Moldova, Republic of'),
(148, 'MC', 'Monaco'),
(149, 'MN', 'Mongolia'),
(150, 'ME', 'Montenegro'),
(151, 'MS', 'Montserrat'),
(152, 'MA', 'Morocco'),
(153, 'MZ', 'Mozambique'),
(154, 'MM', 'Myanmar'),
(155, 'NA', 'Namibia'),
(156, 'NR', 'Nauru'),
(157, 'NP', 'Nepal'),
(158, 'NL', 'Netherlands'),
(159, 'AN', 'Netherlands Antilles'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'MP', 'Northern Mariana Islands'),
(168, 'NO', 'Norway'),
(169, 'OM', 'Oman'),
(170, 'PK', 'Pakistan'),
(171, 'PW', 'Palau'),
(172, 'PS', 'Palestine'),
(173, 'PA', 'Panama'),
(174, 'PG', 'Papua New Guinea'),
(175, 'PY', 'Paraguay'),
(176, 'PE', 'Peru'),
(177, 'PH', 'Philippines'),
(178, 'PN', 'Pitcairn'),
(179, 'PL', 'Poland'),
(180, 'PT', 'Portugal'),
(181, 'PR', 'Puerto Rico'),
(182, 'QA', 'Qatar'),
(183, 'RE', 'Reunion'),
(184, 'RO', 'Romania'),
(185, 'RU', 'Russian Federation'),
(186, 'RW', 'Rwanda'),
(187, 'KN', 'Saint Kitts and Nevis'),
(188, 'LC', 'Saint Lucia'),
(189, 'VC', 'Saint Vincent and the Grenadines'),
(190, 'WS', 'Samoa'),
(191, 'SM', 'San Marino'),
(192, 'ST', 'Sao Tome and Principe'),
(193, 'SA', 'Saudi Arabia'),
(194, 'SN', 'Senegal'),
(195, 'RS', 'Serbia'),
(196, 'SC', 'Seychelles'),
(197, 'SL', 'Sierra Leone'),
(198, 'SG', 'Singapore'),
(199, 'SK', 'Slovakia'),
(200, 'SI', 'Slovenia'),
(201, 'SB', 'Solomon Islands'),
(202, 'SO', 'Somalia'),
(203, 'ZA', 'South Africa'),
(204, 'GS', 'South Georgia South Sandwich Islands'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'SH', 'St. Helena'),
(209, 'PM', 'St. Pierre and Miquelon'),
(210, 'SD', 'Sudan'),
(211, 'SR', 'Suriname'),
(212, 'SJ', 'Svalbard and Jan Mayen Islands'),
(213, 'SZ', 'Swaziland'),
(214, 'SE', 'Sweden'),
(215, 'CH', 'Switzerland'),
(216, 'SY', 'Syrian Arab Republic'),
(217, 'TW', 'Taiwan'),
(218, 'TJ', 'Tajikistan'),
(219, 'TZ', 'Tanzania, United Republic of'),
(220, 'TH', 'Thailand'),
(221, 'TG', 'Togo'),
(222, 'TK', 'Tokelau'),
(223, 'TO', 'Tonga'),
(224, 'TT', 'Trinidad and Tobago'),
(225, 'TN', 'Tunisia'),
(226, 'TR', 'Turkey'),
(227, 'TM', 'Turkmenistan'),
(228, 'TC', 'Turks and Caicos Islands'),
(229, 'TV', 'Tuvalu'),
(230, 'UG', 'Uganda'),
(231, 'UA', 'Ukraine'),
(232, 'AE', 'United Arab Emirates'),
(233, 'GB', 'United Kingdom'),
(234, 'US', 'United States'),
(235, 'UM', 'United States minor outlying islands'),
(236, 'UY', 'Uruguay'),
(237, 'UZ', 'Uzbekistan'),
(238, 'VU', 'Vanuatu'),
(239, 'VA', 'Vatican City State'),
(240, 'VE', 'Venezuela'),
(241, 'VN', 'Vietnam'),
(242, 'VG', 'Virgin Islands (British)'),
(243, 'VI', 'Virgin Islands (U.S.)'),
(244, 'WF', 'Wallis and Futuna Islands'),
(245, 'EH', 'Western Sahara'),
(246, 'YE', 'Yemen');

INSERT INTO `documents` (`id`, `url`, `name`, `created`) VALUES
(2, '/assets/documents/Burger-King_Logo.png', 'Burger-King_Logo.png', '2022-11-02 21:24:25'),
(22, '/assets/documents/JimLee.jpg', 'JimLee.jpg', '2023-01-23 15:21:29'),
(25, '/assets/documents/Treas.jpg', 'Treas.jpg', '2023-01-23 15:33:06');

INSERT INTO `email_newsletter_subscription` (`id`, `email`) VALUES
(3, 'juanpabloravelo@gmail.com'),
(5, 'antonioravelo@contucarga.com'),
(6, 'fayw8367@gmail.com'),
(7, 'fayw8367@gmail.com'),
(8, 'ackermanyat08@gmail.com'),
(9, 'ackermanyat08@gmail.com'),
(10, 'vernonellis50@gmail.com'),
(12, 'vernonellis50@gmail.com'),
(39, 'jravelo@acams.org');

INSERT INTO `embarques` (`id`, `numero_referencia`, `tipo_de_transporte`, `empresa_de_transporte`, `referencia_de_transportista`, `codigos_arancelarios`, `numero_de_factura`, `nombre_del_proveedor`, `factura_imagen_url`, `conocimiento_de_embarque`, `conocimiento_de_embarque_imagen_url`, `renuncia_de_mercancia_imagen_url`, `articulos_importados_son_alimentos`, `registro_sencamer_imagen_url`, `certificado_de_origen_imagen_url`, `licencia_de_importacion_imagen_url`, `imagen_notificacion_de_llegada_de_mercancia`, `factura_comercial_fecha_creacion`, `factura_comercial_nombre_archivo`, `compania`, `codigos_arancelarios_descripcion`, `conocimiento_de_embarque_nombre_archivo`, `conocimiento_de_embarque_fecha_de_creacion`, `renuncia_de_mercancia_nombre_archivo`, `renuncia_de_mercancia_fecha_creacion`, `registro_sencamer_fecha_reacion`, `registro_sencamer_nombre_archivo`, `certificado_de_origen_nombre_archivo`, `certificado_de_origen_fecha_creacion`, `licencia_de_importacion_nombre_archivo`, `licencia_de_importacion_fecha_creacion`, `registro_sanitario_imagen_url`, `registro_sanitario_fecha_creacion`, `registro_sanitario_nombre_archivo`, `certificado_sanitario_fecha_creacion`, `certificado_sanitario_imagen_url`, `certificado_sanitario_nombre_archivo`, `Fecha_creacion_embarque`, `conocimiento_de_embarque_type`, `Estado`, `fecha_de_llegada`) VALUES
(12, '7654321', 'equipaje', 'fsgdfsd', 'dasfsda', '87654321,876543', '', '', '/assets/documents/documentos_de_embarques/Treas5bb0bfaf-fb03-4959-a816-5ddca6813d8c.jpg', '', '/assets/documents/documentos_de_embarques/Treas5bb0bfaf-fb03-4959-a816-5ddca6813d8c.jpg', '/assets/documents/documentos_de_embarques/Treas5bb0bfaf-fb03-4959-a816-5ddca6813d8c.jpg', 'Si', '/assets/documents/documentos_de_embarques/Treas5bb0bfaf-fb03-4959-a816-5ddca6813d8c.jpg', '/assets/documents/documentos_de_embarques/Treas5bb0bfaf-fb03-4959-a816-5ddca6813d8c.jpg', '/assets/documents/documentos_de_embarques/Treas5bb0bfaf-fb03-4959-a816-5ddca6813d8c.jpg', '', '2023-01-19 20:39:02', NULL, 9, '23123 87654321,Uso emrpesarial 876543', NULL, '2023-01-19 20:39:02', NULL, '2023-01-19 20:39:02', '2023-01-19 20:39:02', NULL, NULL, '2023-01-19 20:39:02', NULL, '2023-01-19 20:39:02', NULL, '2023-01-19 20:39:02', NULL, '2023-01-19 20:39:02', NULL, NULL, '2023-01-19 20:39:02', NULL, 'En proceso', NULL),
(13, '', NULL, '', '', '765432,8765432,87654321', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-23 20:22:50', NULL, 9, 'test 765432,Description 8765432,23123 87654321', NULL, '2023-01-23 20:22:50', NULL, '2023-01-23 20:22:50', '2023-01-23 20:22:50', NULL, NULL, '2023-01-23 20:22:50', NULL, '2023-01-23 20:22:50', NULL, '2023-01-23 20:22:50', NULL, '2023-01-23 20:22:50', NULL, NULL, '2023-01-23 20:22:50', NULL, 'Activo', '');

INSERT INTO `images` (`id`, `image`, `description`, `category`, `author`, `date`) VALUES
(1, '/assets/img/food-1.jpg', 'Food photo 1', 'food', 'Lily Banse', '2018-04-01'),
(2, '/assets/img/nature-2.jpg', 'Nature photo 2', 'nature', 'Winn Pellew', '2018-07-20'),
(3, '/assets/img/wildlife-3.jpg', 'Wildlife photo 3', 'wildlife', 'Kalila Moffat', '2019-07-21'),
(4, '/assets/img/architecture-1.jpg', 'Architecture photo 1', 'architecture', 'Patrick Tomasso', '2016-06-30'),
(5, '/assets/img/food-2.jpg', 'Food photo 2', 'food', 'Eiliv-Sonas Aceron', '2017-06-25'),
(6, '/assets/img/wildlife-4.jpg', 'Wildlife photo 4', 'wildlife', 'Filippo Hannum', '2015-03-11'),
(7, '/assets/img/food-3.jpg', 'Food photo 3', 'food', 'Ringo Crockett', '2018-08-14'),
(8, '/assets/img/nature-3.jpg', 'Nature photo 3', 'nature', 'Ulla McGivena', '2017-05-21'),
(9, '/assets/img/architecture-2.jpg', 'Architecture photo 2', 'architecture', 'Liam Pozz', '2015-04-11'),
(10, '/assets/img/nature-4.jpg', 'Nature photo 4', 'nature', 'Dulci Morrott', '2017-12-03'),
(11, '/assets/img/architecture-3.jpg', 'Architecture photo 3', 'architecture', 'Joel Filipe', '2019-06-24'),
(12, '/assets/img/fineart-1.jpg', 'Fine Art photo 1', 'fine art', 'Jue Huang', '2015-11-27'),
(13, '/assets/img/food-4.jpg', 'Food photo 4', 'food', 'Felice Summerside', '2015-08-17'),
(14, '/assets/img/food-5.jpg', 'Food photo 5', 'food', 'Thomasin Osment', '2017-09-23'),
(15, '/assets/img/nature-1.jpg', 'Nature photo 1', 'nature', 'Brian Krahl', '2018-02-07'),
(16, '/assets/img/wildlife-1.jpg', 'Wildlife photo 1', 'wildlife', 'Rakel Lumox', '2018-05-26'),
(17, '/assets/img/fineart-2.jpg', 'Fine Art photo 2', 'fine art', 'Raychan Jones', '2019-03-14'),
(18, '/assets/img/architecture-4.jpg', 'Architecture photo 4', 'architecture', 'Claudio Testa', '2015-01-04'),
(19, '/assets/img/wildlife-2.jpg', 'Wildlife photo 2', 'wildlife', 'Timmie Middlebrook', '2018-10-03'),
(20, '/assets/img/fineart-3.jpg', 'Fine Art photo 3', 'fine art', 'Federico Passi', '2015-11-14');

INSERT INTO `landing_pages` (`id`, `name`, `favicon`, `meta_tags`, `path`) VALUES
(1, 'home', '', 3, '/'),
(2, 'consulta', NULL, 1, '/consulta'),
(3, 'blog', NULL, 2, '/blog');

INSERT INTO `meta_tags` (`id`, `title`, `url`, `description`, `keywords`, `image`, `icon`, `twitter_card`) VALUES
(1, 'Consulta Logística Contucarga', '/consulta', 'Reciba ayuda personalizada de especialistas en aduanas y logística.', 'consultoria logística, importación, exportación, comercio exterior, logística', '/img/contucarga-logo.png', NULL, '/img/contucarga-logo.png'),
(2, 'Blog Contucarga', '/blog', 'Manténgase actualizada con la información más actualizado y relevante en logística y comercio exterior', 'actualidad logística, importación, exportación, comercio exterior, logística', '/img/contenedor', NULL, '/img/chuttersnap-kyCNGGKCvyw-unsplash.jpg'),
(3, 'Contucarga', '/', 'Agencia de aduanas con más de 40 años de experiencia ayudando a importadores y exportadores a optimizar sus procesos logísticos', 'consultoria logística, importación, exportación, comercio exterior, logística, seguro de carga', '/img/contucarga-logo.png', NULL, '/img/contucarga-logo.png'),
(4, 'Cómo reducir el coste de las importaciones a Venezuela', '/blog/como-reducir-el-coste-de-las-importaciones-a-venezuela', 'Para los empresarios que buscan importar productos a Venezuela, hay algunas cosas que pueden ayudar a reducir los costos. ¡Descubre cuáles son en nuestro blog!', 'comercio internacional, logística, importación, exportación, almacenamiento', '/img/vessel-side', NULL, '/img/vessel-side'),
(5, '¿Qué es un agente de aduanas y cómo puede ayudarme? ', '/blog/que-es-un-agente-de-aduanas-y-como-puede-ayudarme', 'Un agente de aduanas es un profesional que puede ayudarle a cumplir con la normativa de comercio internacional. Conozca más sobre lo que hacen y cómo pueden ayudar a su negocio a crecer.', 'comercio internacional, logística, importación, exportación, almacenamiento', '/img/container-crane.jpg', NULL, '/img/container-crane.jpg'),
(6, 'Cómo la logística puede hacer o deshacer el comercio internacional', '/blog/como-la-logistica-puede-hacer-o-deshacer-el-comercio-internacional', 'En este artículo, examinaremos el papel de las aduanas en la logística de importación y exportación, así como los factores clave a tener en cuenta al planificar sus estrategias de logística.', 'comercio internacional, logística, importación, exportación, almacenamiento', '/img/containers-pile', NULL, '/img/containers-pile'),
(9, 'Servicios aduaneros y logísticos: Una alianza estratégica cargada de múltiples beneficios', 'blog/servicios-aduaneros-y-logisticos-una-alianza-estrategica-cargada-de-multiples-beneficios', 'Si es usted importador o exportador, los agentes de aduanas pueden desempeñar un papel fundamental para que su negocio sea más eficaz. He aquí cuatro de las muchas maneras en que lo hacen.', 'comercio internacional, logística, importación, exportación, almacenamiento', '/img/loading-docks', NULL, '/img/loading-docks'),
(10, '8 factores que influyen en el aumento de los gastos aduaneros en Venezuela', '/blog/8-factores-que-influyen-el-aumento-de-las-tasas-aduaneras-venezuela', 'Si está haciendo negocios en Venezuela, es importante que conozcas la normativa aduanera del país. Los cambios recientes han dado lugar a un aumento de las tasas aduaneras, que pueden mermar sus beneficios si no tiene cuidado. ', 'comercio internacional, logística, importación, exportación, almacenamiento', '/img/container-yard-perspective', NULL, '/img/container-yard-perspective'),
(11, 'Consideraciones importantes para importar a Venezuela', '/blog/consideraciones-importantes-para-importar-a-venezuela', 'Si estás buscando importar productos a Venezuela, es importante que conozcas el clima político y económico actual. Esta entrada del blog repasa los aspectos básicos que debe conocer antes de iniciar el proceso.', 'importar a Venezuela, importación a Venezuela, clima político Venezuela, económico Venezuela, agente de aduanas, importación, exportación, almacenamiento, comercio exterior', '/img/logistic-yard', NULL, '/img/logistic-yard');

INSERT INTO `proveedores` (`id`, `nombre`, `direccion`, `ciudad`, `estado`, `pais`, `codigo_postal`, `telefono`, `fax`, `email`, `website`) VALUES
(1, 'Bruno Ravelo', '1715', 'Miami', 'Fl', 'United States', '33135', '17866024069', '33133456', 'juanpabloravelo@gmail.com', 'www.contucarga.com'),
(4, 'Pepe', '151 SE 1st street75 NE 18TH ST', 'MIAMI', 'Dade', 'United States', '33132', '7866024069', '', 'juanpabloravelo@gmail.com', 'http://venturebase.us/'),
(5, 'Antonio', 'Avenida Habana', 'La Guaira', 'Vargas', 'Venezuela', '998', '4166216750', '', 'antonioravelo@contucarga.com', 'www.antonioravelo.com');

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `company_id`, `avatar`, `country`, `phone`) VALUES
(27, 'Juan', 'Ravelo', NULL, 'juanpabloravelo@gmail.com', 9, NULL, NULL, NULL),
(28, 'jp', NULL, NULL, 'jp@gmail.com', 10, NULL, NULL, NULL),
(59, 'Bruno', 'Mate', NULL, 'brunoymate@gmail.com', NULL, NULL, NULL, NULL),
(60, 'Doreen', NULL, NULL, 'doreen@rci.co', 46, NULL, NULL, NULL),
(61, 'Juan Pablo Ravelo', 'Juan Pablo Ravelo', NULL, 'jravelo@acams.org', NULL, NULL, NULL, NULL),
(62, 'Juan Ravelo', 'Juan Ravelo', NULL, 'contu@gmail.com', NULL, NULL, NULL, NULL),
(63, 'Juan Ravelo', 'Juan Ravelo', NULL, 'acams@gmail.com', NULL, NULL, NULL, NULL);

INSERT INTO `wappler_migrations` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '20221102205554_documents-table.js', 1, '2022-11-02 16:55:54'),
(2, '20221102205611_path field-doc table.js', 2, '2022-11-02 16:56:12'),
(3, '20221102205837_name field - doc table.js', 3, '2022-11-02 16:58:38'),
(4, '20221102210059_created field - documents table.js', 4, '2022-11-02 17:01:00'),
(5, '20230110200356_tabla de embarques.js', 5, '2023-01-10 15:03:57'),
(6, '20230110215158_tabala codigos arancelarios.js', 6, '2023-01-10 16:51:58'),
(7, '20230111134130_edit tabla embarque.js', 7, '2023-01-11 08:41:31'),
(8, '20230111140608_codigos - companias.js', 8, '2023-01-11 09:06:09'),
(9, '20230118163032_codigos comanies.js', 9, '2023-01-18 11:30:33'),
(10, '20230118165422_delete codigos por compania table.js', 10, '2023-01-18 11:54:23'),
(11, '20230118165526_multireference.js', 11, '2023-01-18 11:55:26'),
(12, '20230118165622_sd.js', 12, '2023-01-18 11:56:23'),
(13, '20230118165634_cid.js', 13, '2023-01-18 11:56:34'),
(14, '20230118165923_deelete.js', 14, '2023-01-18 11:59:23'),
(15, '20230118170155_delete extra table.js', 15, '2023-01-18 12:01:55'),
(16, '20230118170339_delete extra table.js', 16, '2023-01-18 12:03:40'),
(17, '20230118170609_delete join table.js', 17, '2023-01-18 12:06:10'),
(18, '20230118170645_compania reference.js', 18, '2023-01-18 12:06:46'),
(19, '20230118200151_tabla embarques.js', 19, '2023-01-18 15:01:52'),
(20, '20230118200643_codigos text.js', 20, '2023-01-18 15:06:43'),
(21, '20230118201645_codigos arancelarios field.js', 21, '2023-01-18 15:16:46'),
(22, '20230118202659_fields archivos imagenes documentos .js', 22, '2023-01-18 15:26:59'),
(23, '20230118203136_certificados imagenes documentos fields.js', 23, '2023-01-18 15:31:37'),
(24, '20230118212358_boolean alimentos.js', 24, '2023-01-18 16:23:59'),
(25, '20230118215651_con embarque string.js', 25, '2023-01-18 16:56:52'),
(26, '20230118233230_fecha creacion.js', 26, '2023-01-18 18:32:30'),
(27, '20230119145347_type field.js', 27, '2023-01-19 09:53:47'),
(28, '20230119160332_status.js', 28, '2023-01-19 11:03:33'),
(29, '20230119161600_Estado.js', 29, '2023-01-19 11:16:00'),
(30, '20230120034709_fecha de llegada.js', 30, '2023-01-19 22:47:10'),
(31, '20230120145318_tabla proveedore.js', 31, '2023-01-20 09:53:18'),
(32, '20230123164218_cantidad de contenedores field on cotizacion table.js', 32, '2023-01-23 11:42:18'),
(33, '20230123221018_seo table.js', 33, '2023-01-23 17:10:19'),
(34, '20230125152227_test table.js', 34, '2023-01-25 10:22:27'),
(35, '20230125152318_delete.js', 35, '2023-01-25 10:23:19'),
(36, '20230125152447_test.js', 36, '2023-01-25 10:24:47'),
(37, '20230125152506_delet.js', 37, '2023-01-25 10:25:07'),
(38, '20230125164708_staus.js', 38, '2023-01-25 11:47:09'),
(39, '20230125164736_fecha respuesta.js', 39, '2023-01-25 11:47:36'),
(40, '20230125165528_status string.js', 40, '2023-01-25 11:55:29'),
(41, '20230125165602_double quote.js', 41, '2023-01-25 11:56:02'),
(42, '20230125173523_asd.js', 42, '2023-01-25 12:35:23'),
(43, '20230126172927_lps table.js', 43, '2023-01-26 12:29:28'),
(44, '20230126173751_delete seo table.js', 44, '2023-01-26 12:37:52'),
(45, '20230126174958_lp id.js', 45, '2023-01-26 12:49:59'),
(46, '20230126182454_meta extra fields.js', 46, '2023-01-26 13:24:55'),
(47, '20230126182744_delete extra meta fields.js', 47, '2023-01-26 13:27:45'),
(48, '20230126215109_dlt.js', 48, '2023-01-26 16:51:10'),
(49, '20230126215140_meta t link to lp page.js', 49, '2023-01-26 16:51:41'),
(50, '20230127011136_path.js', 50, '2023-01-26 20:11:36');

INSERT INTO `wappler_migrations_lock` (`index`, `is_locked`) VALUES
(1, 0);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;