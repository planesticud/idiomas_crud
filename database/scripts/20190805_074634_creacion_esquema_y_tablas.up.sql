-- object: idiomas | type: SCHEMA --
-- DROP SCHEMA IF EXISTS idiomas CASCADE;
CREATE SCHEMA idiomas;
-- ddl-end --
COMMENT ON SCHEMA idiomas IS 'Esquema para el módulo de idiomas';
-- ddl-end --

SET search_path TO pg_catalog,public,idiomas;
-- ddl-end --

-- object: idiomas.clasificacion_nivel_idioma | type: TABLE --
-- DROP TABLE IF EXISTS idiomas.clasificacion_nivel_idioma CASCADE;
CREATE TABLE idiomas.clasificacion_nivel_idioma (
	id serial NOT NULL,
	nombre character varying(50) NOT NULL,
	descripcion character varying(250),
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL,
	numero_orden numeric(5,2),
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_clasificacion_nivel_idioma PRIMARY KEY (id),
	CONSTRAINT unique_nombre_clasificacion_nivel_idioma UNIQUE (nombre)

);
-- ddl-end --
COMMENT ON TABLE idiomas.clasificacion_nivel_idioma IS 'Tabla paramétrica con los niveles de idiomas existentes en la clasificación del Marco Común Europeo de Referencia para las lenguas (MCERL)';
-- ddl-end --
COMMENT ON COLUMN idiomas.clasificacion_nivel_idioma.id IS 'Identificador de la tabla clasificacion_nivel_idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.clasificacion_nivel_idioma.nombre IS 'Campo obligatorio de la tabla que indica el nombre del parametro.';
-- ddl-end --
COMMENT ON COLUMN idiomas.clasificacion_nivel_idioma.descripcion IS 'Descripción opcional del parámetro.';
-- ddl-end --
COMMENT ON COLUMN idiomas.clasificacion_nivel_idioma.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere';
-- ddl-end --
COMMENT ON COLUMN idiomas.clasificacion_nivel_idioma.activo IS 'Campo de tipo boolean que inidica si el parametro esta activo';
-- ddl-end --
COMMENT ON COLUMN idiomas.clasificacion_nivel_idioma.numero_orden IS 'En dado caso que se necesite establecer un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.';
-- ddl-end --
COMMENT ON COLUMN idiomas.clasificacion_nivel_idioma.fecha_creacion IS 'Fecha de creación del registro';
-- ddl-end --
COMMENT ON COLUMN idiomas.clasificacion_nivel_idioma.fecha_modificacion IS 'Fecha de la última modificación del registro';
-- ddl-end --
COMMENT ON CONSTRAINT pk_clasificacion_nivel_idioma ON idiomas.clasificacion_nivel_idioma  IS 'Llave primaria de la tabla clasificacion_nivel_idioma';
-- ddl-end --
COMMENT ON CONSTRAINT unique_nombre_clasificacion_nivel_idioma ON idiomas.clasificacion_nivel_idioma  IS 'Restricción para que no se repita el nombre de los niveles de idiomas';
-- ddl-end --

-- object: idiomas.conocimiento_idioma | type: TABLE --
-- DROP TABLE IF EXISTS idiomas.conocimiento_idioma CASCADE;
CREATE TABLE idiomas.conocimiento_idioma (
	id serial NOT NULL,
	persona_id integer NOT NULL,
	nivel_lee_id integer,
	nivel_escribe_id integer,
	nivel_escucha_id integer,
	nivel_habla_id integer,
	nativo boolean NOT NULL,
	activo boolean NOT NULL,
	clasificacion_nivel_idioma_id integer,
	idioma_id integer NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_conocimiento_idioma PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE idiomas.conocimiento_idioma IS 'Tabla que almacena los conocimientos en idiomas que tiene una persona';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.id IS 'Identificador de la tabla conocimiento_idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.persona_id IS 'Referencia a la tabla ente';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.nivel_lee_id IS 'Nivel de lectura que tiene la persona sobre el idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.nivel_escribe_id IS 'Nivel de escritura que tiene la persona sobre el idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.nivel_escucha_id IS 'Nivel de escucha que tiene la persona sobre el idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.nivel_habla_id IS 'Nivel de habla que tiene la persona sobre el idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.nativo IS 'Indica si es el idioma nativo de la persona';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.activo IS 'Indica el estado del registro';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.fecha_creacion IS 'Fecha de creación del registro';
-- ddl-end --
COMMENT ON COLUMN idiomas.conocimiento_idioma.fecha_modificacion IS 'Fecha de la última modificación del registro';
-- ddl-end --
COMMENT ON CONSTRAINT pk_conocimiento_idioma ON idiomas.conocimiento_idioma  IS 'Llave primaria de la tabla conocimiento_idioma';
-- ddl-end --

-- object: idiomas.idioma | type: TABLE --
-- DROP TABLE IF EXISTS idiomas.idioma CASCADE;
CREATE TABLE idiomas.idioma (
	id serial NOT NULL,
	nombre character varying(50) NOT NULL,
	descripcion character varying(250),
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL,
	numero_orden numeric(5,2),
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_idioma PRIMARY KEY (id),
	CONSTRAINT unique_nombre_idioma UNIQUE (nombre)

);
-- ddl-end --
COMMENT ON TABLE idiomas.idioma IS 'Tabla paramétrica de los idiomas';
-- ddl-end --
COMMENT ON COLUMN idiomas.idioma.id IS 'Identificador de la tabla idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.idioma.nombre IS 'Campo obligatorio de la tabla que indica el nombre del parámetro.';
-- ddl-end --
COMMENT ON COLUMN idiomas.idioma.descripcion IS 'Descripción opcional del parámetro.';
-- ddl-end --
COMMENT ON COLUMN idiomas.idioma.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere';
-- ddl-end --
COMMENT ON COLUMN idiomas.idioma.activo IS 'Campo de tipo boolean que inidica si el parametro esta activo';
-- ddl-end --
COMMENT ON COLUMN idiomas.idioma.numero_orden IS 'En dado caso que se necesite establecer un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.';
-- ddl-end --
COMMENT ON COLUMN idiomas.idioma.fecha_creacion IS 'Fecha de creación del registro';
-- ddl-end --
COMMENT ON COLUMN idiomas.idioma.fecha_modificacion IS 'Fecha de la última modificación del registro';
-- ddl-end --
COMMENT ON CONSTRAINT pk_idioma ON idiomas.idioma  IS 'Llave primaria de la tabla idioma';
-- ddl-end --
COMMENT ON CONSTRAINT unique_nombre_idioma ON idiomas.idioma  IS 'Restricción para que no se repita el nombre del idioma';
-- ddl-end --

-- object: idiomas.soporte_conocimiento_idioma | type: TABLE --
-- DROP TABLE IF EXISTS idiomas.soporte_conocimiento_idioma CASCADE;
CREATE TABLE idiomas.soporte_conocimiento_idioma (
	id serial NOT NULL,
	institucion_id integer NOT NULL,
	documento_id integer NOT NULL,
	descripcion character varying(250),
	activo boolean NOT NULL,
	conocimiento_idioma_id integer NOT NULL,
	fecha_creacion timestamp NOT NULL DEFAULT now(),
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_soporte_conocimiento_idioma PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE idiomas.soporte_conocimiento_idioma IS 'Almacena los documentos que certifican el nivel que tiene la persona sobre el idoma';
-- ddl-end --
COMMENT ON COLUMN idiomas.soporte_conocimiento_idioma.id IS 'Identificador de la tabla soporte_conocimiento_idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.soporte_conocimiento_idioma.institucion_id IS 'Institución que certifica el nivel del idioma. Referencia a la tabla organizacion';
-- ddl-end --
COMMENT ON COLUMN idiomas.soporte_conocimiento_idioma.documento_id IS 'Identificador de la tabla documento';
-- ddl-end --
COMMENT ON COLUMN idiomas.soporte_conocimiento_idioma.descripcion IS 'Descripción del soporte que certifica el nivel del idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.soporte_conocimiento_idioma.activo IS 'Indica el estado del registro';
-- ddl-end --
COMMENT ON COLUMN idiomas.soporte_conocimiento_idioma.fecha_creacion IS 'Fecha de creación del registro';
-- ddl-end --
COMMENT ON COLUMN idiomas.soporte_conocimiento_idioma.fecha_modificacion IS 'Fecha de la última modificación del registro';
-- ddl-end --
COMMENT ON CONSTRAINT pk_soporte_conocimiento_idioma ON idiomas.soporte_conocimiento_idioma  IS 'Llave primaria de la tabla soporte_conocimiento_idioma';
-- ddl-end --

-- object: idiomas.valor_nivel_idioma | type: TABLE --
-- DROP TABLE IF EXISTS idiomas.valor_nivel_idioma CASCADE;
CREATE TABLE idiomas.valor_nivel_idioma (
	id serial NOT NULL,
	nombre character varying(50) NOT NULL,
	descripcion character varying(250),
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL,
	numero_orden numeric(5,2),
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_valor_nivel_idioma PRIMARY KEY (id),
	CONSTRAINT unique_nombre_valor_nivel_idioma UNIQUE (nombre)

);
-- ddl-end --
COMMENT ON TABLE idiomas.valor_nivel_idioma IS 'Tabla paramétrica que almacena los posibles valores para los niveles de lectura, escritura, escucha y habla de un idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.valor_nivel_idioma.id IS 'Identificador de la tabla valor_nivel_idioma';
-- ddl-end --
COMMENT ON COLUMN idiomas.valor_nivel_idioma.nombre IS 'Campo obligatorio de la tabla que indica el nombre del parámetro.';
-- ddl-end --
COMMENT ON COLUMN idiomas.valor_nivel_idioma.descripcion IS 'Descripción opcional del parámetro.';
-- ddl-end --
COMMENT ON COLUMN idiomas.valor_nivel_idioma.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere';
-- ddl-end --
COMMENT ON COLUMN idiomas.valor_nivel_idioma.activo IS 'Campo de tipo boolean que inidica si el parametro esta activo';
-- ddl-end --
COMMENT ON COLUMN idiomas.valor_nivel_idioma.numero_orden IS 'En dado caso que se necesite establecer un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.';
-- ddl-end --
COMMENT ON COLUMN idiomas.valor_nivel_idioma.fecha_creacion IS 'Fecha de creación del registro';
-- ddl-end --
COMMENT ON COLUMN idiomas.valor_nivel_idioma.fecha_modificacion IS 'Fecha de la última modificación del registro';
-- ddl-end --
COMMENT ON CONSTRAINT pk_valor_nivel_idioma ON idiomas.valor_nivel_idioma  IS 'Llave primaria de la tabla valor_nivel_idioma';
-- ddl-end --
COMMENT ON CONSTRAINT unique_nombre_valor_nivel_idioma ON idiomas.valor_nivel_idioma  IS 'Restricción para que no se repita el nombre del valor del nivel';
-- ddl-end --

-- object: fk_soporte_conocimiento_idioma_conocimiento_idioma | type: CONSTRAINT --
-- ALTER TABLE idiomas.soporte_conocimiento_idioma DROP CONSTRAINT IF EXISTS fk_soporte_conocimiento_idioma_conocimiento_idioma CASCADE;
ALTER TABLE idiomas.soporte_conocimiento_idioma ADD CONSTRAINT fk_soporte_conocimiento_idioma_conocimiento_idioma FOREIGN KEY (conocimiento_idioma_id)
REFERENCES idiomas.conocimiento_idioma (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_conocimiento_idioma_idioma | type: CONSTRAINT --
-- ALTER TABLE idiomas.conocimiento_idioma DROP CONSTRAINT IF EXISTS fk_conocimiento_idioma_idioma CASCADE;
ALTER TABLE idiomas.conocimiento_idioma ADD CONSTRAINT fk_conocimiento_idioma_idioma FOREIGN KEY (idioma_id)
REFERENCES idiomas.idioma (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_conocimiento_idioma_clasificacion_nivel_idioma | type: CONSTRAINT --
-- ALTER TABLE idiomas.conocimiento_idioma DROP CONSTRAINT IF EXISTS fk_conocimiento_idioma_clasificacion_nivel_idioma CASCADE;
ALTER TABLE idiomas.conocimiento_idioma ADD CONSTRAINT fk_conocimiento_idioma_clasificacion_nivel_idioma FOREIGN KEY (clasificacion_nivel_idioma_id)
REFERENCES idiomas.clasificacion_nivel_idioma (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_nivel_escribe_valor_nivel | type: CONSTRAINT --
-- ALTER TABLE idiomas.conocimiento_idioma DROP CONSTRAINT IF EXISTS fk_nivel_escribe_valor_nivel CASCADE;
ALTER TABLE idiomas.conocimiento_idioma ADD CONSTRAINT fk_nivel_escribe_valor_nivel FOREIGN KEY (nivel_escribe_id)
REFERENCES idiomas.valor_nivel_idioma (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nivel_escucha_valor_nivel | type: CONSTRAINT --
-- ALTER TABLE idiomas.conocimiento_idioma DROP CONSTRAINT IF EXISTS fk_nivel_escucha_valor_nivel CASCADE;
ALTER TABLE idiomas.conocimiento_idioma ADD CONSTRAINT fk_nivel_escucha_valor_nivel FOREIGN KEY (nivel_escucha_id)
REFERENCES idiomas.valor_nivel_idioma (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nivel_habla_valor_nivel | type: CONSTRAINT --
-- ALTER TABLE idiomas.conocimiento_idioma DROP CONSTRAINT IF EXISTS fk_nivel_habla_valor_nivel CASCADE;
ALTER TABLE idiomas.conocimiento_idioma ADD CONSTRAINT fk_nivel_habla_valor_nivel FOREIGN KEY (nivel_habla_id)
REFERENCES idiomas.valor_nivel_idioma (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nivel_lee_valor_nivel | type: CONSTRAINT --
-- ALTER TABLE idiomas.conocimiento_idioma DROP CONSTRAINT IF EXISTS fk_nivel_lee_valor_nivel CASCADE;
ALTER TABLE idiomas.conocimiento_idioma ADD CONSTRAINT fk_nivel_lee_valor_nivel FOREIGN KEY (nivel_lee_id)
REFERENCES idiomas.valor_nivel_idioma (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --