drop database if exists RB;
create database RB;
use RB;

create table Usuarios(
	ID_Usr int not null auto_increment,
    Nom_Usr varchar(20),
    Correo_Usr varchar(40),
    Contra_Usr varchar(45),
    Edad_Usr int,
    Img_Usr varchar(100),
    primary key (ID_Usr)
);

create table Producto(
	ID_Prod int not null auto_increment,
    Nom_Prod varchar(40),
    Fecha_Prod date,
    Precio_Prod int,
    Materia_Prod varchar(30),
    Desc_Prod varchar(200),
    Img_Prod varchar(100),
    Nom_Vend varchar (20),
    primary key (ID_Prod)
);

create table Vendedores(
	ID_Usr int not null auto_increment,
    Nom_Vend varchar(40),
    primary key (ID_Usr),
    foreign key (ID_Usr) references Usuarios(ID_Usr) on update cascade on delete cascade
);

create table Producto_Vendedores(
	ID_Usr int not null,
    ID_Prod int not null,
    primary key (ID_Prod),
    foreign key (ID_Usr) references Usuarios(ID_Usr) on update cascade on delete cascade,
    foreign key (ID_Prod) references Producto(ID_Prod) on update cascade on delete cascade
);

create table Pedido(
	ID_Ped int not null auto_increment,
    Lugar_Ped varchar(130),
    Cont_Ped varchar(200),
    Total_Ped float,
    Fecha_Ped date,
    primary key (ID_Ped)
);

create table Vendedor(
	ID_Ped int not null auto_increment,
    Ident_Vend varchar(100),
    foreign key (ID_Ped) references Pedido(ID_Ped) on update cascade on delete cascade
);

create table Comprador(
	ID_Ped int not null,
    Ident_Cl varchar(100),
    foreign key (ID_Ped) references Pedido(ID_Ped) on update cascade on delete cascade
);

create table Producto_Pedido(
	ID_Ped int not null,
    ID_Prod int not null,
    foreign key (ID_Ped) references Pedido(ID_Ped) on update cascade on delete cascade,
    foreign key (ID_Prod) references Producto(ID_Prod) on update cascade on delete cascade
);

create table ComeProducto(
	ID_ComPr int not null auto_increment,
    Cont_ComPr varchar (150),
    Fecha_ComPr date,
    primary key (ID_ComPr)
);

create table ComeProducto_Usuario(
	ID_ComPr int not null,
    ID_Usr int not null,
    foreign key (ID_ComPr) references ComeProducto(ID_ComPr) on update cascade on delete cascade,
    foreign key (ID_Usr) references Usuarios(ID_Usr) on update cascade on delete cascade
);

create table Chat(
	ID_Chat int not null auto_increment,
    Nom_Chat varchar(30),
    primary key (ID_Chat)
);

create table Tiene(
	ID_Usr int not null,
    ID_Chat int not null,
    foreign key (ID_Usr) references Usuarios(ID_Usr) on update cascade on delete cascade,
    foreign key (ID_Chat) references Chat(ID_Chat) on update cascade on delete cascade
);

create table Mensajes(
	ID_Mnsj int not null auto_increment,
    Cont_Mnsj varchar(200),
    Fecha_Mnsj date,
    primary key (ID_Mnsj)
);

create table Chats_Mensajes(
	ID_Chat int not null,
    ID_Mnsj int not null,
    foreign key (ID_Chat) references Chat(ID_Chat) on update cascade on delete cascade,
    foreign key (ID_Mnsj) references Mensajes(ID_Mnsj) on update cascade on delete cascade
);

create table Mensajes_Usuarios(
	ID_Usr int not null,
    ID_Mnsj int not null,
    foreign key (ID_Usr) references Usuarios(ID_Usr) on update cascade on delete cascade,
    foreign key (ID_Mnsj) references Mensajes(ID_Mnsj) on update cascade on delete cascade
);

create table Posts(
	ID_Posts int not null auto_increment,
    Tit_Post varchar(50),
    Cont_Post varchar(4000),
    Fecha_Post date,
    primary key (ID_Posts)
);

create table Post_Usuario(
	ID_Posts int not null,
    ID_Usr int not null,
    foreign key (ID_Posts) references Posts(ID_Posts) on update cascade on delete cascade,
    foreign key (ID_Usr) references Usuarios(ID_Usr) on update cascade on delete cascade
);

create table Comentarios_Post(
	ID_CoPo int not null auto_increment,
    Cont_CoPo varchar(300),
    Fecha_CoPo date,
    primary key (ID_CoPo)
);

create table ComePo_Usuario(
	ID_CoPo int not null,
    ID_Usr int not null,
    foreign key (ID_CoPo) references Comentarios_Post(ID_CoPo) on update cascade on delete cascade,
    foreign key (ID_Usr) references Usuarios(ID_Usr) on update cascade on delete cascade
);

show tables;
