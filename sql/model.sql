-- postgresql 15.1

CREATE DATABASE yacola;
CREATE SCHEMA langdoc;
ALTER SCHEMA langdoc OWNER TO postgres;
SET search_path TO pg_catalog,public,langdoc;

CREATE TABLE langdoc.language (
	id serial NOT NULL,
	CONSTRAINT language_pk PRIMARY KEY (id)
);
ALTER TABLE langdoc.language OWNER TO postgres;


CREATE TABLE langdoc.lexeme (
	id serial NOT NULL,
	CONSTRAINT lexeme_pk PRIMARY KEY (id)
);
ALTER TABLE langdoc.lexeme OWNER TO postgres;


CREATE TABLE langdoc.feature (
	id serial NOT NULL,
	CONSTRAINT feature_pk PRIMARY KEY (id)
);
ALTER TABLE langdoc.feature OWNER TO postgres;


CREATE TABLE langdoc.feature_possible_values (
	id serial,
	value text,
	feature_id integer

);
ALTER TABLE langdoc.feature_possible_values OWNER TO postgres;
ALTER TABLE langdoc.feature_possible_values ADD CONSTRAINT feature FOREIGN KEY (feature_id)
REFERENCES langdoc.feature (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;


CREATE TABLE langdoc.feature_lang_implementation (
	id serial,
	lang_id serial,
	feature_val serial
);
ALTER TABLE langdoc.feature_lang_implementation ADD CONSTRAINT feat_val FOREIGN KEY (feature_val)
REFERENCES langdoc.feature_possible_values (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE langdoc.feature_lang_implementation ADD CONSTRAINT lang FOREIGN KEY (lang_id)
REFERENCES langdoc.language (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE langdoc.feature_lang_implementation OWNER TO postgres;

CREATE TABLE langdoc.pos (
	id serial,
	pos_id serial

);
ALTER TABLE langdoc.pos OWNER TO postgres;




