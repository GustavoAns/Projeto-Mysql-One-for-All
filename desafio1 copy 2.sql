DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE usuarios (
    `usuario_id` INT NOT NULL,
    `usuario` VARCHAR(40) NOT NULL,
    `idade` INT NOT NULL,
    PRIMARY KEY (usuario_id)
) engine = InnoDB;

CREATE TABLE artistas (
    `artista_id` INT NOT NULL,
    `artista_nome` VARCHAR(40) NOT NULL,
    PRIMARY KEY (artista_id)
) engine = InnoDB;

CREATE TABLE follows (
    `follow_id` INT NOT NULL,
    `usuario_id` INT NOT NULL,
    `artista_id` INT NOT NULL,
    PRIMARY KEY (follow_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE albums (
    `album_id` INT NOT NULL,
    `album_nome` VARCHAR(40) NOT NULL,
    `artista_id` INT NOT NULL,
    `ano_lancamento` INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE musicas (
    `musica_id` INT NOT NULL,
    `album_id` INT NOT NULL,
    `musica` VARCHAR(40) NOT NULL,
    `duracao_segundos` INT NOT NULL,
    PRIMARY KEY (musica_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

CREATE TABLE historicos (
    `hist_id` INT NOT NULL,
    `usuario_id` INT NOT NULL,
    `musica_id` INT NOT NULL,
    `data_reproducao` DATETIME NOT NULL,
    PRIMARY KEY (hist_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (musica_id) REFERENCES musicas(musica_id)
) engine = InnoDB;

CREATE TABLE planos (
    `plano_id` INT NOT NULL,
    `plano` VARCHAR(20) NOT NULL,
    `valor_plano` DECIMAL(20, 2) NOT NULL,
    PRIMARY KEY (plano_id)
) engine = InnoDB;

CREATE TABLE assinaturas (
    `assinatura_id` INT NOT NULL,
    `usuario_id` INT NOT NULL,
    `plano_id` INT NOT NULL,
    `data_assinatura` DATETIME NOT NULL,
    PRIMARY KEY (assinatura_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

INSERT INTO usuarios (usuario_id, usuario, idade) VALUES
    (1, 'Thati', 23), 
    (2, 'Cintia', 35), 
    (3, 'Bill', 20), 
    (4, 'Roger', 45), 
    (5, 'Norman', 58), 
    (6, 'Patrick', 33), 
    (7, 'Vivian', 26), 
    (8, 'Carol', 19), 
    (9, 'Angelina', 42), 
    (10, 'Paul', 46);

INSERT INTO artistas (artista_id, artista_nome) VALUES
    (1, 'Walter Phoenix'), 
    (2, 'Peter Strong'), 
    (3, 'Lance Day'), 
    (4, 'Freedie Shannon'), 
    (5, 'Tyler Isle'), 
    (6, 'Fog');

INSERT INTO follows (follow_id, usuario_id, artista_id) VALUES
    (1, 1, 1), 
    (2, 1, 4), 
    (3, 1, 3), 
    (4, 2, 1), 
    (5, 2, 3), 
    (6, 3, 1), 
    (7, 3, 3), 
    (8, 4, 4), 
    (9, 5, 5), 
    (10, 5, 6),
    (11, 6, 1),
    (12, 6, 3),
    (13, 6, 6),
    (14, 7, 2),
    (15, 7, 5),
    (16, 8, 1),
    (17, 8, 5),
    (18, 9, 3),
    (19, 9, 4),
    (20, 9, 6),
    (21, 10, 2),
    (22, 10, 3);

INSERT INTO albums (album_id, album_nome, artista_id, ano_lancamento) VALUES
    (1, 'Envious', 1, 1990), 
    (2, 'Exuberant', 1, 1993), 
    (3, 'Hallowed Steam', 2, 1995), 
    (4, 'Incandescent', 3, 1998), 
    (5, 'Temporary Culture', 4, 2001), 
    (6, 'Library of libertye', 4, 2003), 
    (7, 'Chained Down', 5, 2007), 
    (8, 'Cabinet of fools', 5, 2012), 
    (9, 'No guarantees', 5, 2015), 
    (10, 'Apparatus', 6, 2015);

INSERT INTO musicas (musica_id, album_id, musica, duracao_segundos) VALUES
    (1,1,'Soul For Us',200),
    (2,1,'Reflections Of Magic',163),
    (3,1,'Dance With Her Own',116),
    (4,2,'Troubles Of My Inner Fire',203),
    (5,2,'Time Fireworks',152),
    (6,3,'Magic Circus',105),
    (7,3,'Honey, So Do I',207),
    (8,3,'Sweetie, Lets Go Wild',139),
    (9,3,'She Knows',244),
    (10,4,'Fantasy For Me',100),
    (11,4,'Celebration Of More',146),
    (12,4,'Rock His Everything',223),
    (13,4,'Home Forever',231),
    (14,4,'Diamond Power',241),
    (15,4,"Let's Be Silly",132),
    (16,5,'Thang Of Thunder',240),
    (17,5,'Words Of Her Life',185),
    (18,5,'Without My Streets',176),
    (19,6,'Need Of The Evening',190),
    (20,6,'History Of My Roses',222),
    (21,6,'Without My Love',111),
    (22,6,'Walking And Game',123),
    (23,6,'Young And Father',197),
    (24,7,'Finding My Traditions',179),
    (25,7,'Walking And Man',229),
    (26,7,'Hard And Time',135),
    (27,7,"Honey, I'm A Lone Wolf",150),
    (28,8,'She Thinks I Wont Stay Tonight',166),
    (29,8,'He Heard Youre Bad For Me',154),
    (30,8,'He Hopes We Cant Stay',210),
    (31,8,'I Know I Know',117),
    (32,9,'Hes Walking Away',159),
    (33,9,'Hes Trouble',138),
    (34,9,'I Heard I Want To Bo Alone',120),
    (35,9,'I Ride Alone',151),
    (36,10,'Honey',79),
    (37,10,'You Cheated On Me',95),
    (38,10,'Wouldnt It Be Nice',213),
    (39,10,'Baby',136),
    (40,10,'You Make Me Feel So..',83);

INSERT INTO historicos (hist_id, usuario_id, musica_id, data_reproducao) VALUES
    (1,1,36,'2020-02-28 10:45:55'),
    (2,1,25,'2020-05-02 05:30:35'),
    (3,1,23,'2020-03-06 11:22:33'),
    (4,1,14,'2020-08-05 08:05:17'),
    (5,1,15,'2020-09-14 16:32:22'),
    (6,2,34,'2020-01-02 07:40:33'),
    (7,2,24,'2020-05-16 06:16:22'),
    (8,2,21,'2020-10-09 12:27:48'),
    (9,2,39,'2020-09-21 13:14:46'),
    (10,3,6,'2020-11-13 16:55:13'),
    (11,3,3,'2020-12-05 18:38:30'),
    (12,3,26,'2020-07-30 10:00:00'),
    (13,4,2,'2021-08-15 17:10:10'),
    (14,4,35,'2021-07-10 15:20:30'),
    (15,4,27,'2021-01-09 01:44:33'),
    (16,5,7,'2020-07-03 19:33:28'),
    (17,5,12,'2017-02-24 21:14:22'),
    (18,5,14,'2020-08-06 15:23:43'),
    (19,5,1,'2020-11-10 13:52:27'),
    (20,6,38,'2019-02-07 20:33:48'),
    (21,6,29,'2017-01-24 00:31:17'),
    (22,6,30,'2017-10-12 12:35:20'),
    (23,6,22,'2018-05-29 14:56:41'),
    (24,7,5,'2018-05-09 22:30:49'),
    (25,7,4,'2020-07-27 12:52:58'),
    (26,7,11,'2018-01-16 18:40:43'),
    (27,8,39,'2018-03-21 16:56:40'),
    (28,8,40,'2020-10-18 13:38:05'),
    (29,8,32,'2019-05-25 08:14:03'),
    (30,8,33,'2021-08-15 21:37:09'),
    (31,9,16,'2021-05-24 17:23:45'),
    (32,9,17,'2018-12-07 22:48:52'),
    (33,9,8,'2021-03-14 06:14:26'),
    (34,9,9,'2020-04-01 03:36:00'),
    (35,10,20,'2017-02-06 08:21:34'),
    (36,10,21,'2017-12-04 05:33:43'),
    (37,10,12,'2017-07-27 05:24:49'),
    (38,10,13,'2017-12-25 01:03:57');

INSERT INTO planos (plano_id, plano, valor_plano) VALUE
    (1, 'gratuito', 0), 
    (2, 'familiar', 7.99), 
    (3, 'universitário', 5.99), 
    (4, 'pessoal', 6.99);

INSERT INTO assinaturas (assinatura_id, usuario_id, plano_id, data_assinatura) VALUE
    (1, 1, 1,'2019-10-20 00:00:00'), 
    (2, 2, 2,'2017-12-30 00:00:00'),
    (3, 3, 3,'2019-06-05 00:00:00'), 
    (4, 4, 4,'2020-05-13 00:00:00'), 
    (5, 5, 4,'2017-02-17 00:00:00'), 
    (6, 6, 2,'2017-01-06 00:00:00'), 
    (7, 7, 3,'2018-01-05 00:00:00'), 
    (8, 8, 3,'2018-02-14 00:00:00'), 
    (9, 9, 2,'2018-04-29 00:00:00'), 
    (10, 10, 2,'2017-01-17 00:00:00');
