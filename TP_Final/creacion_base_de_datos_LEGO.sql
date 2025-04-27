-- Creacion de la base de datos

create database lego_database;

-- Creacion de las tablas

create table inventory_parts (
    inventory_id INTEGER,
    part_num VARCHAR(50),
    color_id INTEGER,
    is_spare VARCHAR(50),
    quantity INTEGER
);

create table inventory_sets (
    inventory_id INTEGER,
    set_num VARCHAR(50),
    quantity INTEGER
);

create table parts (
    part_num VARCHAR(50),
    name VARCHAR(128),
    part_cat_id INTEGER
);

create table colors (
    id INTEGER,
    name VARCHAR(50),
    rgb VARCHAR(50),
    is_trans VARCHAR(50)
);

create table inventories (
    id INTEGER,
    version INTEGER,
    set_num VARCHAR(50)
);

create table part_categories (
    id INTEGER,
    name VARCHAR(50)
);

create table sets (
    set_num VARCHAR(50),
    name VARCHAR(512),
    year INTEGER,
    theme_id INTEGER,
    num_parts INTEGER
);

create table themes (
    id INTEGER,
    name VARCHAR(50),
    parent_id INTEGER
);

-- Definicion de las Primary Keys

ALTER TABLE public.colors
ADD CONSTRAINT colors_pkey PRIMARY KEY (id);

ALTER TABLE public.inventories
ADD CONSTRAINT inventories_pkey PRIMARY KEY (id);

ALTER TABLE public.inventory_parts
ADD CONSTRAINT inventory_parts_pkey PRIMARY KEY (inventory_id, part_num, color_id, is_spare);

ALTER TABLE public.inventory_sets
ADD CONSTRAINT inventory_sets_pkey PRIMARY KEY (inventory_id, set_num);

ALTER TABLE public.part_categories 
ADD CONSTRAINT part_categories_pkey PRIMARY KEY (id);

ALTER TABLE public.parts
ADD CONSTRAINT parts_pkey PRIMARY KEY (part_num);

ALTER TABLE public.sets
ADD CONSTRAINT sets_pkey PRIMARY KEY (set_num);

ALTER TABLE public.themes
ADD CONSTRAINT themes_pkey PRIMARY KEY (id);

-- Definicion de las Foreign Keys

ALTER TABLE public.inventories
ADD CONSTRAINT inventories_set_num_fkey FOREIGN KEY (set_num)
REFERENCES public.sets (set_num)
ON DELETE CASCADE;

ALTER TABLE public.inventory_parts 
ADD CONSTRAINT inventory_parts_inventory_id_fkey FOREIGN KEY (inventory_id)
REFERENCES public.inventories (id)
ON DELETE CASCADE;

ALTER TABLE public.inventory_parts
ADD CONSTRAINT inventory_parts_part_num_fkey FOREIGN KEY (part_num)
REFERENCES public.parts (part_num)
ON DELETE CASCADE;

ALTER TABLE public.inventory_parts
ADD CONSTRAINT inventory_parts_color_id_fkey FOREIGN KEY (color_id)
REFERENCES public.colors (id)
ON DELETE CASCADE;

ALTER TABLE public.inventory_sets
ADD CONSTRAINT inventory_sets_inventory_id_fkey FOREIGN KEY (inventory_id)
REFERENCES public.inventories (id)
ON DELETE CASCADE;

ALTER TABLE public.inventory_sets
ADD CONSTRAINT inventory_sets_set_num_fkey FOREIGN KEY (set_num)
REFERENCES public.sets (set_num)
ON DELETE CASCADE;

ALTER TABLE public.sets
ADD CONSTRAINT sets_theme_id_fkey FOREIGN KEY (theme_id)
REFERENCES public.themes (id)
ON DELETE CASCADE;

ALTER TABLE public.parts
ADD CONSTRAINT parts_part_cat_id_fkey FOREIGN KEY (part_cat_id)
REFERENCES public.part_categories (id)
ON DELETE CASCADE;

-- Agregamos placeholders para los orphan registers de la tabla "parts"

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('19807', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('2476', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('2495c01', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('3010pb036u', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('3650', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('3680c02', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('4285', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('4502w', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('4738ac01', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('48002', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('52345', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('60364pr0003', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('6932', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('7049', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('70973c01', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('92355', 'Unknown Part', NULL);

INSERT INTO parts (part_num, name, part_cat_id)
VALUES ('rb00164', 'Unknown Part', NULL);




