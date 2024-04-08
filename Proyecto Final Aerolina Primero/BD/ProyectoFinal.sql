USE master 
go 

if exists(Select * FROM SysDataBases WHERE name='ProyectoFinal1')
BEGIN
	DROP DATABASE ProyectoFinal1
END
go

CREATE DATABASE ProyectoFinal1
go

USE ProyectoFinal1
go

--Tablas--

CREATE TABLE Clientes
(
	NroPasaporte VARCHAR (7) Primary key check(len(NroPasaporte) = 7),
	Contrasenia VARCHAR(15)not null,
	Nombre VARCHAR (30)not null,
	Tarjeta BIGINT not null	
)
go

CREATE TABLE Empleados
(
	Usuario VARCHAR (10) Primary key,
	Contrasenia VARCHAR (15) not null,
	Nombre VARCHAR (30) not null,
	Puesto VARCHAR (10) check(Puesto in ('Gerente', 'Vendedor', 'Admin'))
)
go

CREATE TABLE Ciudades
(
	CodigoC VARCHAR (6)Primary key,
	NombreC VARCHAR (20) not null,
	Pais VARCHAR (20) not null 
)
go

CREATE TABLE Aeropuertos
(
	CodigoA VARCHAR (3)Primary key check(len(CodigoA) = 3),
	NombreA VARCHAR (20) not null,
	Direccion VARCHAR (30) not null,
	ImpuestoPar Float not null,
	ImpuestoLleg Float not null,
	CodigoC VARCHAR (6) not null Foreign key references Ciudades(CodigoC)
)

CREATE TABLE Vuelos
(
	CodigoV VARCHAR(15) Primary key check(len(codigoV)=15),
	FechaS DATETIME not null,
	FechaLl DATETIME not null,
	Precio Float not null,
	Asientos INT not null, 
	CodigoA VARCHAR (3) not null Foreign key references Aeropuertos(CodigoA),
	CodigoB VARCHAR (3) not null Foreign key references Aeropuertos(CodigoA)
)

CREATE TABLE Pasajes
(
	NroFactura INT IDENTITY (1,1) Primary key,
	Fecha DATETIME not null default getdate(),
	Precio Float not null,
	CodigoV VARCHAR(15) not null Foreign key references Vuelos(CodigoV),
	NroPasaporte VARCHAR (7) not null Foreign key references Clientes(NroPasaporte)	
)
go

--Datos de Prueba--

Insert Clientes(NroPasaporte,Contrasenia,Nombre,Tarjeta) values
('d702157','asd123','Rodrigo Amuz',			123456789012345),
('a135431','zxc123','Nicolas Amuz',			123456780123465),
('b135132','123zcx','Marcos Santa Marta',	123456783465901),
('c123165','123asd','Santiago Santa Marta', 123490123465567),
('e143546','qwe123','Facundo Silva',		567890123465123),
('f143546','qwe123','Alejandro Faggiani',	567890123465121),
('c465464','123qwe','Diego Fernandez',		901212345678346),
('a123456','asd076','Julio Montero',123456789012297),
('a123457','asd077','Julio Morales',123456789012298),
('a123458','asd078','Atilio Garcia',123456789012299),
('a123459','asd079','Oscar Morales',123456789012300),
('a123460','asd080','Jose Vanzino',123456789012301),
('a123461','asd081','Alfredo Foglino',123456789012302),
('a123462','asd082','Angel Romano',123456789012303),
('a123463','asd083','Hector Scarone',123456789012304),
('a123464','asd084','Vicrtor Esparrago',123456789012305),
('a123465','asd085','Juan Blanco',123456789012306),
('a123466','asd086','Roberto Sosa',123456789012307),
('a123467','asd087','Jose Pintos',123456789012308),
('a123468','asd088','Rodolfo Rodriguez',123456789012309),
('a123469','asd089','Anibal Ciocca',123456789012310),
('a123470','asd090','Hailton Correia',123456789012311),
('a123471','asd091','Juan Carrasco',123456789012312),
('a123472','asd092','Shubert Gambetta',123456789012313),
('a123473','asd093','Pascual Somma',123456789012314),
('a123474','asd094','Ildo Maneiro',123456789012315),
('a123475','asd095','Santos Urdinaran',123456789012316),
('a123476','asd096','Fabian Cohelo',123456789012317),
('a123477','asd097','Jorge Sere',123456789012318),
('a123478','asd098','Jorge Cardaccio',123456789012319),
('a123479','asd099','Juan Mameli',123456789012320),
('a123480','asd100','Yubert Lemos',123456789012321),
('a123481','asd101','Roberto Porta',123456789012322),
('a123482','asd102','Jose Santamaria',123456789012323),
('a123483','asd103','Tony Gomez',123456789012324),
('a123484','asd104','Jose Moreira',123456789012325),
('a123485','asd105','Felipe Revelez',123456789012326),
('a123486','asd106','EUgenio Galvalisi',123456789012327),
('a123487','asd107','Luis Cruz',123456789012328),
('a123488','asd108','Guillermo Esacalada',123456789012329),
('a123489','asd109','Luis Castro',123456789012330),
('a123490','asd110','Andres Mazali',123456789012331),
('a123491','asd111','Alberto Bica',123456789012332),
('a123492','asd112','Gonzalo Castro',123456789012333),
('a123493','asd113','Luis Ubiña',123456789012334),
('a123494','asd114','Diego Arismendi',123456789012335),
('a123495','asd115','Juan Cabrera',123456789012336),
('a123496','asd116','Juan Mugica',123456789012337),
('a123497','asd117','Raul Pini',123456789012338),
('a123498','asd118','Arsenio Luzardo',123456789012339),
('a123499','asd119','Eduardo Garcia',123456789012340),
('a123500','asd120','Alejandro Lembo',123456789012341),
('a123501','asd121','Luis Cubilla',123456789012342),
('a123502','asd122','Juan Romero',123456789012343),
('a123503','asd123','Gustavo Munua',123456789012344),
('a123504','asd124','Sebastian Fernandez',123456789012345),
('a123505','asd125','Julio Dely Valdes',123456789012346),
('a123506','asd126','Gustavo Varela',123456789012347),
('a123507','asd127','Santiago Demarchi',123456789012348),
('a123508','asd128','Gustavo Mendez',123456789012349),
('a123509','asd129','Hector Castro',123456789012350),
('a123510','asd130','Marco Vanzini',123456789012351),
('a123511','asd131','Horacio Troche',123456789012352),
('a123512','asd132','Ignacio Prieto',123456789012353),
('a123513','asd133','Adan Machado',123456789012354),
('a123514','asd134','Carlos Scarone',123456789012355),
('a123515','asd135','Angel Brunel',123456789012356),
('a123516','asd136','Alfredo Zibechi',123456789012357),
('a123517','asd137','Atilio Ancheta',123456789012358),
('a123518','asd138','Carlos Soca',123456789012359),
('a123519','asd139','Santiago Ostolaza',123456789012360),
('a123520','asd140','Francisco Arispe',123456789012361),
('a123521','asd141','Rodolfo Moran',123456789012362),
('a123522','asd142','Pedro olivieri',123456789012363),
('a123523','asd143','Domingo Perez',123456789012364),
('a123524','asd144','Rafael Villazan',123456789012365),
('a123525','asd145','Antonio Urdinaran',123456789012366),
('a123526','asd146','Wilmar Cabrera',123456789012367),
('a123527','asd147','Alexander Medina',123456789012368),
('a123528','asd148','Diego Polenta',123456789012369),
('a123529','asd149','Damian Rodriguez',123456789012370),
('a123530','asd150','Santiago Romero',123456789012371),
('a123531','asd151','Abdon Porte',123456789012372),
('a123532','asd152','Martin Del Campo',123456789012373),
('a123533','asd153','Ruben Sosa',123456789012374),
('a123534','asd154','Jose Oyarbide',123456789012375),
('a123535','asd155','Ricardo Perdomo',123456789012376),
('a123536','asd156','Felipe Carballo',123456789012377),
('a123537','asd157','Hugo De Leon',123456789012378),
('a123538','asd158','Alfredo de los Santos',123456789012379),
('a123539','asd159','Richard Morales',123456789012380),
('a123540','asd160','Javier Ambrois',123456789012381),
('a123541','asd161','Mauricio Victorino',123456789012382),
('a123542','asd162','Hector Moran',123456789012383),
('a123543','asd163','Eduardo de la Peña',123456789012384),
('a123544','asd164','Jorge Bava',123456789012385),
('a123545','asd165','Alfonso Espino',123456789012386),
('a123546','asd166','Gabriel Alvez',123456789012387),
('a123547','asd167','Gianni Guigou',123456789012388),
('a123548','asd168','Alvaro Recoba',123456789012389),
('a123549','asd169','Jorge Da Costa',123456789012390),
('a123550','asd170','Gonzalo Bergessio',123456789012391),
('a123551','asd171','Adrian Romero',123456789012392),
('a123552','asd172','Esteban Conde',123456789012393),
('a123553','asd173','Carlos Camejo',123456789012394),
('a123554','asd174','Mario Regueiro',123456789012395),
('a123555','asd175','Rafael Garcia',123456789012396)
go

Insert Empleados(Usuario,Contrasenia,Nombre,Puesto) values
('Emp1','123asd','Richard Porta','Vendedor'),
('Emp2','123asd','Luis Mejía','Gerente'),
('Emp3','123asd','Jere Recoba','Admin')
go

insert Ciudades(CodigoC,NombreC,Pais) values
('MVDURU','Montevideo','Uruguay'),
('BASARG','Buenos Aires','Argentina'),
('RJABRS','Rio de Janeiro','Brasil'),
('FLOBRS','Florianopolis','Brasil'),
('LMAPRU','Lima','Peru'),
('ASUPAR','Asunción','Paraguay')
go

insert Aeropuertos(CodigoA,CodigoC,Direccion,ImpuestoPar,ImpuestoLleg,NombreA) values
('MVD','MVDURU','Av de las Americas S/N',0.00,100.00,'Carrasco'),
('BAS','BASARG','Acceso a Aeropueto ',2000.00,1000.00,'Ezeiza'),
('RJA','RJABRS','Praca Salgado filho S/N',80.00,70.00,'Santos Dumont'),
('FLO','FLOBRS','Rua ac ao Aeroporto',90.00,65.00,'Hercilio Luz'),
('LMA','LMAPRU','Av Elmer Faucetti S/N',30.00,20.00,'Jorge Chavez'),
('ASU','ASUPAR','Silvio Petirossi S/N',777.00,666.00,'Silvio Petirossi')
go

insert Vuelos(CodigoV,FechaS,FechaLl,Precio,Asientos,CodigoA,CodigoB) values
('202408211940FLO','20240821 19:40','20240822 07:20' ,600.00,250,'FLO','LMA'),
('202412101840FLO','20241210 19:40','20241211 07:20' ,600.00,250,'FLO','LMA'),
('202409221650ASU','20240922 16:50','20240923 13:10' ,850.00,250,'ASU','RJA'),
('202405221650ASU','20240522 16:50','20240523 13:10' ,850.00,250,'ASU','RJA'),
('202410221350RJA','20241022 13:50','20241023 06:50' ,320.00,104,'RJA','FLO'),
('202407221350RJA','20240722 13:50','20240723 06:50' ,320.00,250,'RJA','FLO'),
('202407202050LMA','20240720 20:50','20240722 19:30' ,700.00,250,'LMA','BAS'),
('202408201900BAS','20240820 21:00','20240821 17:50' ,900.00,250,'BAS','RJA'),
('202406202100BAS','20240620 21:00','20240621 17:50' ,900.00,250,'BAS','RJA'),
('202407211530MVD','20240721 15:30','20240722 16:40' ,1000.00,250,'MVD','ASU'),
('202405202050MVD','20240520 20:50','20240521 19:30' ,700.00,250,'MVD','LMA'),
('202401230850MVD','20240123 08:50','20240125 14:30' ,280.00,258,'MVD','BAS'),
('202409211530MVD','20240921 15:30','20240923 16:40' ,1000.00,250,'MVD','ASU'),
('202404230850MVD','20240423 08:50','20240424 14:30' ,280.00,258,'MVD','FLO')
go

insert Pasajes(Fecha,Precio,CodigoV,nroPasaporte) values
('20240120 18:35',456.00,	'202410221350RJA','a135431'),
('20240125 08:50',456.00,	'202407221350RJA','b135132'),
('20240125 08:50',456.00,	'202410221350RJA','e143546'),
('20240122 11:30',456.00,	'202410221350RJA','e143546'),
('20240120 07:50',456.00,	'202407221350RJA','c465464'),
('20240120 16:40',1730.00 ,	'202407202050LMA','a135431'),
('20240121 15:35',1280.00,	'202401230850MVD','d702157'),
('20240122 11:30',720.00,	'202405202050MVD','e143546'),
('20240119 13:22',1666.00,	'202409211530MVD','c465464'),
('20240312 13:22',345.00,	'202404230850MVD','b135132'),
('20240119 13:22',710.00,	'202408211940FLO','c465464'),
('20240120 10:30',710.00,	'202412101840FLO','e143546'),
('20240120 16:40',1730.00 ,	'202407202050LMA','a135431'),
('20240120 16:40',1730.00 ,	'202407202050LMA','d702157'),
('20240121 15:35',1697.00,	'202409221650ASU','d702157'),
('20240128 20:05',1697.00 ,	'202405221650ASU','b135132'),
('20240120 21:05',1697.00 ,	'202405221650ASU','c123165'),
('20240121 15:10',2970.00,	'202408201900BAS','c465464'),
('20240128 20:05',2970.00 ,	'202408201900BAS','d702157'),
('20240120 13:10',2970.00,	'202406202100BAS','e143546'),
('20240112 18:10',2970.00,	'202406202100BAS','c123165'),
('20240111 18:10',2970.00,	'202406202100BAS','a135431'),
('20240120 18:36',456.00,'202410221350RJA','a123457'),
('20240121 18:35',456.00,'202410221350RJA','a123458'),
('20240121 18:36',456.00,'202410221350RJA','a123459'),
('20240122 18:35',456.00,'202410221350RJA','a123460'),
('20240122 18:36',456.00,'202410221350RJA','a123461'),
('20240123 18:35',456.00,'202410221350RJA','a123462'),
('20240123 18:36',456.00,'202410221350RJA','a123463'),
('20240124 18:35',456.00,'202410221350RJA','a123464'),
('20240124 18:36',456.00,'202410221350RJA','a123465'),
('20240125 18:35',456.00,'202410221350RJA','a123466'),
('20240125 18:36',456.00,'202410221350RJA','a123467'),
('20240126 18:35',456.00,'202410221350RJA','a123468'),
('20240126 18:36',456.00,'202410221350RJA','a123469'),
('20240127 18:35',456.00,'202410221350RJA','a123470'),
('20240127 18:36',456.00,'202410221350RJA','a123471'),
('20240128 18:35',456.00,'202410221350RJA','a123472'),
('20240128 18:36',456.00,'202410221350RJA','a123473'),
('20240129 18:35',456.00,'202410221350RJA','a123474'),
('20240129 18:36',456.00,'202410221350RJA','a123475'),
('20240130 18:35',456.00,'202410221350RJA','a123476'),
('20240130 18:36',456.00,'202410221350RJA','a123477'),
('20240131 18:35',456.00,'202410221350RJA','a123478'),
('20240201 18:36',456.00,'202410221350RJA','a123479'),
('20240102 18:35',456.00,'202410221350RJA','a123480'),
('20240102 18:36',456.00,'202410221350RJA','a123481'),
('20240103 18:35',456.00,'202410221350RJA','a123482'),
('20240103 18:36',456.00,'202410221350RJA','a123483'),
('20240104 18:35',456.00,'202410221350RJA','a123484'),
('20240104 18:36',456.00,'202410221350RJA','a123485'),
('20240105 18:35',456.00,'202410221350RJA','a123486'),
('20240105 18:36',456.00,'202410221350RJA','a123487'),
('20240106 18:35',456.00,'202410221350RJA','a123488'),
('20240106 18:36',456.00,'202410221350RJA','a123489'),
('20240107 18:35',456.00,'202410221350RJA','a123490'),
('20240107 18:36',456.00,'202410221350RJA','a123491'),
('20240108 18:35',456.00,'202410221350RJA','a123492'),
('20240108 18:36',456.00,'202410221350RJA','a123493'),
('20240109 18:35',456.00,'202410221350RJA','a123494'),
('20240109 18:36',456.00,'202410221350RJA','a123495'),
('20240110 18:35',456.00,'202410221350RJA','a123496'),
('20240110 18:36',456.00,'202410221350RJA','a123497'),
('20240111 18:35',456.00,'202410221350RJA','a123498'),
('20240111 18:36',456.00,'202410221350RJA','a123499'),
('20240112 18:35',456.00,'202410221350RJA','a123500'),
('20240112 18:36',456.00,'202410221350RJA','a123501'),
('20240113 18:35',456.00,'202410221350RJA','a123502'),
('20240113 18:36',456.00,'202410221350RJA','a123503'),
('20240114 18:35',456.00,'202410221350RJA','a123504'),
('20240114 18:36',456.00,'202410221350RJA','a123505'),
('20240115 18:35',456.00,'202410221350RJA','a123506'),
('20240115 18:36',456.00,'202410221350RJA','a123507'),
('20240116 18:35',456.00,'202410221350RJA','a123508'),
('20240116 18:36',456.00,'202410221350RJA','a123509'),
('20240117 18:35',456.00,'202410221350RJA','a123510'),
('20240117 18:36',456.00,'202410221350RJA','a123511'),
('20240118 18:35',456.00,'202410221350RJA','a123512'),
('20240118 18:36',456.00,'202410221350RJA','a123513'),
('20240119 18:35',456.00,'202410221350RJA','a123514'),
('20240119 18:36',456.00,'202410221350RJA','a123515'),
('20240120 18:35',456.00,'202410221350RJA','a123516'),
('20240120 18:36',456.00,'202410221350RJA','a123517'),
('20240121 18:35',456.00,'202410221350RJA','a123518'),
('20240121 18:36',456.00,'202410221350RJA','a123519'),
('20240122 18:35',456.00,'202410221350RJA','a123520'),
('20240122 18:36',456.00,'202410221350RJA','a123521'),
('20240123 18:35',456.00,'202410221350RJA','a123522'),
('20240123 18:36',456.00,'202410221350RJA','a123523'),
('20240124 18:35',456.00,'202410221350RJA','a123524'),
('20240124 18:36',456.00,'202410221350RJA','a123525'),
('20240125 18:35',456.00,'202410221350RJA','a123526'),
('20240125 18:36',456.00,'202410221350RJA','a123527'),
('20240126 18:35',456.00,'202410221350RJA','a123528'),
('20240126 18:36',456.00,'202410221350RJA','a123529'),
('20240127 18:35',456.00,'202410221350RJA','a123530'),
('20240127 18:36',456.00,'202410221350RJA','a123531'),
('20240128 18:35',456.00,'202410221350RJA','a123532'),
('20240128 18:36',456.00,'202410221350RJA','a123533'),
('20240129 18:35',456.00,'202410221350RJA','a123534'),
('20240129 18:36',456.00,'202410221350RJA','a123535'),
('20240130 18:35',456.00,'202410221350RJA','a123536'),
('20240130 18:36',456.00,'202410221350RJA','a123537'),
('20240201 18:35',456.00,'202410221350RJA','a123538'),
('20240201 18:36',456.00,'202410221350RJA','a123539'),
('20240202 18:35',456.00,'202410221350RJA','a123540'),
('20240202 18:36',456.00,'202410221350RJA','a123541'),
('20240203 18:35',456.00,'202410221350RJA','a123542'),
('20240203 18:36',456.00,'202410221350RJA','a123543'),
('20240204 18:35',456.00,'202410221350RJA','a123544'),
('20240204 18:36',456.00,'202410221350RJA','a123545'),
('20240205 18:35',456.00,'202410221350RJA','a123546'),
('20240205 18:36',456.00,'202410221350RJA','a123547'),
('20240206 18:35',456.00,'202410221350RJA','a123548'),
('20240206 18:36',456.00,'202410221350RJA','a123549'),
('20240207 18:35',456.00,'202410221350RJA','a123550'),
('20240207 18:36',456.00,'202410221350RJA','a123551'),
('20240208 18:35',456.00,'202410221350RJA','a123552'),
('20240208 18:36',456.00,'202410221350RJA','a123553'),
('20240209 18:35',456.00,'202410221350RJA','a123554'),
('20240209 18:36',456.00,'202410221350RJA','a123555')
go


---SP-----

--Cliente
create proc LoginC
@pasaporte varchar(7),
@pass varchar(15)
as
begin
	select *
	from Clientes
	where NroPasaporte = @pasaporte
 	and Contrasenia = @pass
end 
go

create proc BuscarC
@pasaporte varchar(7)
as
begin 
	select *
	from Clientes
	where NroPasaporte = @pasaporte
end	
go

create proc AltaCliente
@pasaporte varchar (7),
@pass varchar(15),
@nom varchar(30),
@tarj bigint
as
begin
	if exists(select * from Clientes where NroPasaporte = @pasaporte)
		return -1
	
	insert into Clientes values (@pasaporte,@pass,@nom ,@tarj)
		if @@ERROR <> 0
			return -2
		
	return	1
end
go

create proc BajaCliente
@pasaporte varchar(7)
as
begin 
	if not exists(select * from Clientes where NroPasaporte = @pasaporte)
		return -1
		
	if exists (select * from Pasajes where nroPasaporte = @pasaporte)
		return -2 
				
	delete from Clientes where NroPasaporte = @pasaporte
		if @@ERROR <> 0
			return -3
	
	return 1
end
go

create proc ModificarCliente 
@pasaporte varchar (7),
@pass varchar(15),
@nom varchar(30),
@tarj bigint
as
begin
	if not exists(select * from Clientes where NroPasaporte = @pasaporte)
		return -1
		
	update Clientes
	set 
	Contrasenia = @pass,
	Nombre = @nom, 
	Tarjeta = @tarj
	where NroPasaporte = @pasaporte
		if @@ERROR <> 0
			return -2
	
	return 1
end
go

--Empleados--
create proc LoginE 
@usu varchar(10),
@pass varchar(15)
as
begin 
	select *
	from Empleados
	where Usuario = @usu and
	Contrasenia = @pass
end
go

--Ciudades--
create proc BuscarCiudades
@cod varchar(6)
as
begin
	select *
	from Ciudades
	where CodigoC = @cod
end
go

create proc AltaCiudad
@cod varchar(6),
@pais varchar(20),
@nom varchar(20)
as
begin
	if exists(select * from Ciudades where CodigoC = @cod)
		return -1
		
	insert into Ciudades values	(@cod,@nom,@pais)
		if @@ERROR <> 0
			return -2
			
	return 1
end 
go

create proc BajaCiudad
@cod varchar(6)
as
begin 
	if not exists(select * from Ciudades where CodigoC = @cod)
		return -1
	
	if exists (select * from Aeropuertos where CodigoC = @cod)
		return - 2
		
	delete from Ciudades where CodigoC = @cod
		if @@ERROR <> 0
			return -3	
	
	return	1
end
go

create proc ModificarCiudad
@cod varchar(6),
@pais varchar(20),
@nom varchar(20)
as
begin 
	if not exists(select * from Ciudades where CodigoC = @cod)
		return -1
		
	update Ciudades
	set 
	Pais = @pais,
	NombreC = @nom 
	where CodigoC = @cod
		if @@ERROR <> 0
			return -2
	
	return 1
end
go

--Aeropuerto--
create proc BuscarAeropuerto
@cod varchar(3)
as
begin 
	select *
	from Aeropuertos
	where CodigoA = @cod
end
go

create proc AltaAeropuerto
@cod varchar(3),
@nom varchar(20),
@dir varchar (30),
@partida float,
@llegada float,
@ciu varchar(6)
as
begin
	if exists(select * from Aeropuertos where CodigoA = @cod)
		return -1
	
	if not exists(select * from Ciudades where CodigoC = @ciu)
		return -2
		
	insert into Aeropuertos values(@cod,@nom,@dir,@partida,@llegada,@ciu)
		if @@ERROR <> 0
			return -3
			
	return 1
end
go

create proc BajaAeropuerto
@cod varchar(3)
as
begin 
	if not exists(select * from Aeropuertos where CodigoA = @cod)
		return -1
		
	if exists (select * from Vuelos	where CodigoA = @cod or CodigoB = @cod)
		return -2
	
		
	delete from Aeropuertos where CodigoA = @cod
		if @@ERROR <> 0
			return -3
	
	return 1		
end
go

create proc ModificarAeropuerto
@cod varchar(3),
@nom varchar(20),
@dir varchar (30),
@partida float,
@llegada float,
@CodC varchar(6)
as
begin 
	if not exists(select * from Aeropuertos where CodigoA = @cod)
		return -1
		
	if not exists (select * from Ciudades where CodigoC = @CodC)
		return -2
		
	
	update Aeropuertos
	set 
	Direccion = @dir,
	NombreA = @nom,
	ImpuestoPar= @partida,
	ImpuestoLleg =@llegada, 
	codigoc = @CodC
	where CodigoA = @cod
		if @@ERROR <> 0
			return -3
			
	return 1
end
go

create proc ListarAeropuerto
as
begin 
	Select * from Aeropuertos
end
go


--Alta vuelos
create proc AltaVuelos
@fechaS datetime,
@fechaL datetime,
@precio float,
@asientos int,
@codA varchar(3),
@codB varchar(3)
as
begin 
	if not exists(select * from Aeropuertos where CodigoA = @codA)
		return -1

	if not exists(select * from Aeropuertos where CodigoA = @codB)
		return -2

	declare @codigoV varchar(15) 
	set @codigoV = CONVERT(varchar(8),@fechas,112)+ CONVERT(varchar(2),DATEPART(hour,@fechas)) + CONVERT(varchar(2),DATEPART(MINUTE,@fechas))+ @codA
	
	if exists(select * from Vuelos where CodigoV = @codigoV)
		return -3
	 
	Insert into Vuelos (FechaS,FechaLl,Precio,Asientos,CodigoA,CodigoB,codigov) 
	values(@fechaS,@fechaL,@precio,@asientos,@codA,@codB,@codigoV)
		if @@ERROR <>0
			return -4
		else
			return 1
end 
go


--Alta pasajes
create proc AltaPasaje
@precio float,
@codigo varchar(15),
@pasaporte varchar(7)
as
begin
	if not exists (select * from Vuelos where CodigoV = @codigo)
		return -1
		
	if exists(select * from	Vuelos where CodigoV = @codigo and FechaS < GETDATE())
		return -2
		
	if not exists (select * from Clientes where NroPasaporte = @pasaporte)
		return -3
	
	declare @cant int
	declare @asientos int
	
	select @asientos = asientos from Vuelos Where CodigoV = @codigo
	select @cant = COUNT(*) from Pasajes Where CodigoV = @codigo
	if @cant >= @asientos
		return -4
		
	insert into Pasajes (precio,codigoV, nroPasaporte) 
	values (@precio,@codigo,@pasaporte)
		if @@ERROR = 0
			return @@identity
		else 
			return -5
end
go
			
--listado vuelos
create proc ListaVuelosPartidas
@cod varchar(3)
as
begin 
	select * 
	from Vuelos 
	where FechaS > GETDATE() and CodigoA = @cod
	order by FechaS
end
go

create proc ListaVuelosArribos
@cod varchar(3)
as
begin 
	select * 
	from Vuelos
	where FechaLl > GETDATE() and CodigoB = @cod
	order by FechaLl
end
go		

--listado historico de compras.
create proc HistoricoCompras
@pasaporte varchar(7)
as
begin 
	select *
	from Pasajes 
	where nroPasaporte = @pasaporte
	order by Fecha
end
go

create proc BuscarVuelo
@codV varchar(15)
as
begin 
	select *
	from Vuelos 
	where CodigoV = @codV
end 
go

create proc listadoP
as
begin 
	select *
	from Pasajes 
end
go