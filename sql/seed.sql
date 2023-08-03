BEGIN TRANSACTION;
INSERT INTO "language" ("id","name")
    VALUES
        (1,'amari');
INSERT INTO "feature" ("id","name")
    VALUES
        (1,'Gender'),
        (2,'Number');
INSERT INTO "feature_possible_values" ("id","feature_id","value")
    VALUES
        (1,1,'Masc'),
        (2,1,'Fem'),
        (3,1,'Neut'),
        (4,2,'Sing'),
        (5,2,'Plur');
INSERT INTO "feature_lang_implementation" ("id","lang_id","feature_val_id")
    VALUES
        (1,1,1),
        (2,1,2);
INSERT INTO "pos" ("id","name")
    VALUES
        (0,'VERB'),
        (1,'NOUN'),
        (2,'ADJ'),
        (3,'ADV');

INSERT INTO "pos_feature_map" ("lang_id","pos_id","feat_id")
    VALUES
        (1,1,1),
        (1,1,2);
INSERT INTO "lexeme" ("id","lang_id","pos_id","lemma")
    VALUES
        (1,1,1,'lama');
COMMIT;

