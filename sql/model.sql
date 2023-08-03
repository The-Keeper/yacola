-- sqlite-compatible

CREATE TABLE language (
	id INTEGER PRIMARY KEY ASC,
	name TEXT
);

CREATE TABLE feature (
	id INTEGER PRIMARY KEY ASC,
	name TEXT
);

CREATE TABLE feature_possible_values (
	id INTEGER PRIMARY KEY ASC,
  	feature_id INTEGER ,
	value TEXT,
  	FOREIGN KEY(feature_id) REFERENCES feature(id)
);


CREATE TABLE feature_lang_implementation (
	id INTEGER PRIMARY KEY ASC,
	lang_id INTEGER,
	feature_val_id INTEGER,
	FOREIGN KEY(lang_id) REFERENCES language(id),
  	FOREIGN KEY(feature_val_id) REFERENCES feature_possible_values(id)
);

CREATE TABLE pos (
	id INTEGER PRIMARY KEY ASC,
	name TEXT
);

CREATE TABLE pos_feature_map (
	lang_id INTEGER,
	pos_id INTEGER,
    feat_id INTEGER,
  	FOREIGN KEY(lang_id) REFERENCES language(id),
  	FOREIGN KEY(pos_id) REFERENCES pos(id),
    FOREIGN KEY(feat_id) REFERENCES feature(id),
    PRIMARY KEY (lang_id, pos_id, feat_id)
);

CREATE TABLE lexeme (
	id INTEGER PRIMARY KEY ASC,
	lang_id INTEGER,
	pos_id INTEGER,
	lemma  TEXT,
	FOREIGN KEY(lang_id) REFERENCES language(id),
  	FOREIGN KEY(pos_id) REFERENCES pos(id)
);
