select * from Usuarios;

insert into Usuarios(Nom_Usr, Correo_Usr, Contra_Usr, Edad_Usr) values 
('Kit', 'kit@gmail.com', '1234', 17),
('Juan', 'lol@gmail.com', '2345', 19),
('Iker', 'iker@gmail.com', '12345', 18);

insert into Producto(Nom_Prod,Fecha_Prod,Precio_Prod,Materia_Prod,Desc_Prod, Nom_Vend) values 
	("Regla T", '22-11-05 15:09:25', 150, "Dibujo técnico", "Regla de 90 cm en buenas condiciones", "Kit"),
	("Regla T", '22-10-05 14:05:29', 150, "Dibujo técnico", "Regla de 90 cm en buenas condiciones", "Iker"),
	("Regla T", '22-10-05 10:05:24', 150, "Dibujo técnico", "Regla de 90 cm en buenas condiciones", "Juan"),
	("Cables de 15 cm", '22-12-05 09:29:20', 50, "Sistemas digitales", "5 cables cortados de 15 cm sin usar", "Juan"),
	("USB de 64 GB", '22-09-05 03:05:12', 200, "Programación", "USB de 64 GB semi-usado", "Iker"),
    ("USB de 64 GB", '22-09-05 03:05:12', 200, "Programación", "USB de 64 GB semi-usado", "Kit");
    
insert into Vendedores(ID_Usr, Nom_Vend) values 
	(1, "Kit"),
	(2, "Juan"),
	(3, "Iker");
    
insert into Producto_Vendedores(ID_Usr, ID_Prod) values 
	(1,1),
	(2,2),
	(3,3),
	(3,4),
	(2,5);


insert into Posts(Tit_Post, Cont_Post, Fecha_Post) values("Post", "Albion Online es un mmorpg no lineal, en el que escribes tu propia historia sin limitarte a seguir un camino prefijado. Explora un amplio mundo abierto con 5 biomas únicos, todo cuánto hagas tendrá su repercusión en el mundo, con la economía orientada al jugador de Albion, los jugadores crean prácticamente todo el equipo a partir de los recursos que consiguen, el equipo que llevas define quién eres, cambia de arma y armadura para pasar de caballero a mago, o juega como una mezcla de ambas clases. Aventúrate en el mundo abierto frente a los habitantes y las criaturas de Albion, inicia expediciones o adéntrate en mazmorras en las que encontrarás enemigos aún más difíciles, enfréntate a otros jugadores en encuentros en el mundo abierto, lucha por los territorios o por ciudades enteras en batallas tácticas, relájate en tu isla privada, donde podrás construir un hogar, cultivar cosechas y criar animales, únete a un gremio, todo es mejor cuando se trabaja en grupo. Adéntrate ya en el mundo de Albion y escribe tu propia historia.", '2022-11-10');
insert into Posts(Tit_Post, Cont_Post, Fecha_Post) values("Nya", "Albion Online es un mmorpg no lineal, en el que escribes tu propia historia sin limitarte a seguir un camino prefijado. Explora un amplio mundo abierto con 5 biomas únicos, todo cuánto hagas tendrá su repercusión en el mundo, con la economía orientada al jugador de Albion, los jugadores crean prácticamente todo el equipo a partir de los recursos que consiguen, el equipo que llevas define quién eres, cambia de arma y armadura para pasar de caballero a mago, o juega como una mezcla de ambas clases. Aventúrate en el mundo abierto frente a los habitantes y las criaturas de Albion, inicia expediciones o adéntrate en mazmorras en las que encontrarás enemigos aún más difíciles, enfréntate a otros jugadores en encuentros en el mundo abierto, lucha por los territorios o por ciudades enteras en batallas tácticas, relájate en tu isla privada, donde podrás construir un hogar, cultivar cosechas y criar animales, únete a un gremio, todo es mejor cuando se trabaja en grupo. Adéntrate ya en el mundo de Albion y escribe tu propia historia.", '2022-11-10');
insert into Posts(Tit_Post, Cont_Post, Fecha_Post) values("LoL", "Hola, Gamer, juguemos League of Legends. ¿Qué te parece si lo descargamos en este preciso momento y descubrimos juntos como se juega?. Es fácil de aprender, funciona de esta manera: 2 equipos de 5 jugadores deben destruir la base enemiga combatiendo en un mapa lleno de objetivos y monstruos. Supongamos que de entre los mas de 100 campeones. Elijes a Garen, te gusta Garen, es fácil matar a tus enemigos con Garen. Al principio no necesitas ser experto por qué el juego te posiciona con otros jugadores de tu mismo nivel, esto significa que podrás mejorar con solo jugar y divertirte. No hay nada como ganar en League of Legends al lado de 4 nuevos aliados... ¿Hermoso, verdad? Pero piensa que jugar con un grupo de amigos que ya conoces podría ser igual de divertido: Tú podrías ser el tanque, tus amigos pueden ser soportes, arqueros, asesinos o incluso magos, hay muchos roles para escoger según la estrategia que quieras que siga tu campeón durante la partida y con el tiempo comienzas a dominar otros campeones, como Lux con sus poderosos hechizos, a Darius con quien probablemente consigas tu primer Pentakill o Teemo la tierna encarnación de toda la maldad del universo, ya te gustan estos campeones, cada uno con su estilo de juego, aprenderas mas sobre las historias únicas de cada uno y verás como su origen se conecta con sus poderes, hay todo un universo por explorar. Después conocerás otra característica del juego: Las partidas clasificatorias, en las que tus resultados determinan tu posición en un sistema de ligas y divisiones, podrías jugar esto para siempre, pero tómalo con calma y solo diviértete, por que LoL te ofrece un sinfín de experiencias incluso sin competir por un puntaje, por qué esto es League of Legends: Es dinámico, intuitivo y siempre diverso. Cuanto más juegas más te enamoras del juego y después de cada partida no evitaras volver a jugar. Todo eso y más te espera si descargas League oof Legends: Tú decides.", "2022-11-24");

insert into Post_Usuario values(1,1), (2,2);
insert into Post_Usuario values (3, 3);


select* from Usuarios where Correo_Usr='kit@gmail.com' and Contra_Usr = '1234';
select * from Producto where ID_Prod = 1;
select v.* from Vendedores v inner join Producto_Vendedores p on v.ID_Usr = p.ID_Usr where p.ID_Prod = 1;
select * from Vendedores;
select * from Producto_Vendedores;
select distinct p.*, q.*, r.Nom_Vend from Producto p, Producto_Vendedores q, Vendedores r where	p.ID_Prod = q.ID_Prod and q.ID_Usr = r.ID_Usr order by Fecha_Prod;
select p.*, r.* from ((Producto_Vendedores q inner join Producto p on p.ID_Prod = q.ID_Prod) inner join Vendedores r on q.ID_Usr = r.ID_Usr) where p.ID_Prod = 1;

select distinct p.*, q.*, r.Nom_Usr from Posts p, Post_Usuario q, Usuarios r where p.ID_Posts = q.ID_Posts and q.ID_Usr = r.ID_Usr order by Fecha_Post desc;

select distinct p.*, r.ID_Usr,Nom_Usr from Posts p, Post_Usuario q, Usuarios r where p.ID_Posts = q.ID_Posts and q.ID_Usr = r.ID_Usr;
select distinct p.*,q.*, r.ID_Usr,Nom_Usr from Posts p, Post_Usuario q, Usuarios r where p.ID_Posts = q.ID_Posts and q.ID_Usr = r.ID_Usr;
select * from Post_Usuario;
select * from Posts;
select distinct p.*, r.ID_Usr,Nom_Usr from Posts p, Post_Usuario q, Usuarios r where p.ID_Posts = q.ID_Posts and q.ID_Usr = r.ID_Usr and r.ID_Usr = 1;


select * from Pedido;