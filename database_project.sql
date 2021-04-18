--Customer tabel
create table Customer(
	CustomerId serial,
	Name char(100) not null,
	Address char(500) not null,
	State char(100) not null,
	Country char(100) not null,
	PhoneNumber char(12) not null
);
alter table Customer add constraint CustomerId_pk primary key (CustomerId);

-- Article_categories table
create table Article_Categories(
	Article_catId serial,
	Category char(500) not null
); 
alter table Article_Categories add constraint Article_catId_pk primary key (Article_catId);

--Supplier table
create table Supplier(
	SupplierId serial,
	Name char(100) not null,
	Address char(500) not null,
	City char(100) not null,
	State char(100) not null,
	Country char(100) not null,
	PhoneNumber char(12) not null,
	Code char(10) not null,
	StartDate timestamp
);
alter table Supplier add constraint SupplierId_pk primary key (SupplierId);

--Article table
create table Article(
	ArticleId serial,
	Name char(200) not null,
	Unitprice char(100) not null,
	Createddate timestamp,
	Article_SupplierId int not null,
	Article_Category int not null
);
alter table Article add constraint ArticleId_pk primary key (ArticleId);
alter table Article add constraint "SupplierId_fk" foreign key (Article_SupplierId) references Supplier (SupplierId);
alter table Article add constraint "CategoryId_fk" foreign key (Article_Category) references Article_Categories (Article_catId);

-- Order table
create table Orders(
	OrderId serial,
	Quantity int not null,
	Unitprice char(100) not null,
	Orderdate timestamp not null default now(),
	Ordercompletion timestamp,
	POS int,
	Order_CustomerId int,
	Order_SupplierId int,
	Order_ArticleId int 
);
alter table Orders add constraint OrderId primary key (OrderId);
alter table Orders add constraint "CustomerId_fk" foreign key (Order_CustomerId) references Customer (CustomerId);
alter table Orders add constraint "ArticleId_fk" foreign key (Order_ArticleId) references Article (ArticleId);
alter table Orders add constraint "SupplierId_fk" foreign key (Order_SupplierId) references Supplier (SupplierId);

-- Transporter table
create table Transporter(
	TransporterId serial,
	code char(10) not null,
	Name char(100) not null
);
alter table Transporter add constraint TransporterId_pk primary key (TransporterId);

--Parcel_details
create table Parcel_Details(
	ParcelId serial,
	Origin char(200) not null,
	Destination char(200) not null,
	Status char(100) not null,
	Parceldte timestamp,
	Type char(50) not null,
	Weight char(50) not null,
	Parcel_Transporter int,
	Parcel_Order int
);
alter table Parcel_Details add constraint ParcelId_pk primary key (ParcelId);
alter table Parcel_Details add constraint "OrderId_fk" foreign key (Parcel_Order) references Orders (OrderId);
alter table Parcel_Details add constraint "Parcel_Transporter_fk" foreign key (Parcel_Transporter) references Transporter (TransporterId);

--Parcel_tracking table
create table Parcel_tracking(
	TrackingId serial,
	Trackingdate timestamp,
	TrackingstatusId int not null,
	ParcelId_Tracking int not null,
	comments char(300)
);
alter table Parcel_tracking add constraint TrankingId_pk primary key (TrackingId);
alter table Parcel_tracking add constraint "Parcel_Tracking_fk" foreign key (ParcelId_Tracking) references Parcel_Details (ParcelId);
alter table Parcel_tracking add constraint "Trackingstatus_fk" foreign key (TrackingstatusId) references Trackingstatus (TrackingstatusId);


--Trackingstatus
create table Trackingstatus(
	TrackingstatusId serial,
	Status char(100) not null
);
alter table Trackingstatus add constraint TrackingstatusId_pk primary key (TrackingstatusId); 


--Insert of data into the tables.
--Article categories
insert into public.Article_Categories (Category) values ('Garden');
insert into public.Article_Categories (Category) values ('Tools');
insert into public.Article_Categories (Category) values ('Bathroom');
insert into public.Article_Categories (Category) values ('Kitchen');
insert into public.Article_Categories (Category) values ('Storage / arrangement');
insert into public.Article_Categories (Category) values ('Carpentry');
insert into public.Article_Categories (Category) values ('Construction materials');
insert into public.Article_Categories (Category) values ('Tiles & parquet');
insert into public.Article_Categories (Category) values ('Decoration, Lighting');
insert into public.Article_Categories (Category) values ('Drugstore & painting');
insert into public.Article_Categories (Category) values ('Electricity & home automation');
insert into public.Article_Categories (Category) values ('Heating & Plumbing');
insert into public.Article_Categories (Category) values ('Hardware');


--Customer
insert into public.Customer (Name,Address,State,Country,PhoneNumber) values ('Krrishi yadav','29 Av kremlin','Paris','France','855662228');
insert into public.Customer (Name,Address,State,Country,PhoneNumber) values ('Nikhil gavin','11 Av villejuif','Paris','France','755446892');
insert into public.Customer (Name,Address,State,Country,PhoneNumber) values ('Tahsya justin','28 Av kremlin','Paris','France','988546785');
insert into public.Customer (Name,Address,State,Country,PhoneNumber) values ('Keerthi ch','Emile zola villejuif','Paris','France','288559997');
insert into public.Customer (Name,Address,State,Country,PhoneNumber) values ('Kajol jain','9 Av vitry sur seine','Paris','France','744666892');
insert into public.Customer (Name,Address,State,Country,PhoneNumber) values ('Adithya','Eugene thomas bicetre','Paris','France','988776664');
insert into public.Customer (Name,Address,State,Country,PhoneNumber) values ('Nayani','Emile zola villejuif','Paris','France','235568945');
insert into public.Customer (Name,Address,State,Country,PhoneNumber) values ('Jathi rathnalu','Le kremlin becetre','Paris','France','6547896523');
insert into public.Customer (Name,Address,State,Country,PhoneNumber) values ('Radhe shyma','2021 Oct rue India','Paris','France','986532147');


--TrackingStatus
insert into public.Trackingstatus (Status) values ('Ordered');
insert into public.Trackingstatus (Status) values ('Packed');
insert into public.Trackingstatus (Status) values ('Shipped');
insert into public.Trackingstatus (Status) values ('Delivered');
insert into public.Trackingstatus (Status) values ('Returned');


--Suppiler
insert into public.Supplier (Name,Address,City,State,Country,PhoneNumber,Code,StartDate) values ('Superprof','51 rue du faubourg','Saint-Denis','Paris','France','985446588','FR001','28-Jan-2021');
insert into public.Supplier (Name,Address,City,State,Country,PhoneNumber,Code,StartDate) values ('Rodrigues Bokolo Charles','Rue Marcel Sembat','Le Kremlin-Bicetre','Paris','France','820254696','FR002','1-Feb-2021');
insert into public.Supplier (Name,Address,City,State,Country,PhoneNumber,Code,StartDate) values ('UASAC','2 Rue Joseph','Sansboeuf','Paris','France','0144908600','FR003','05-Mar-2021');
insert into public.Supplier (Name,Address,City,State,Country,PhoneNumber,Code,StartDate) values ('United Parcel Service France Sas','20 Rue','Escoffier','Paris','France','01559896655','FR004','15-Apr-2021');
insert into public.Supplier (Name,Address,City,State,Country,PhoneNumber,Code,StartDate) values ('Mon courrier de France','149 Avenue','Saint-Denis','Paris','France','0778101479','FR005','6-May-2021');
insert into public.Supplier (Name,Address,City,State,Country,PhoneNumber,Code,StartDate) values ('France Cravates','166 Rue','de la Roquette','Paris','France','0143483559','FR006','20-Jun-2021');
insert into public.Supplier (Name,Address,City,State,Country,PhoneNumber,Code,StartDate) values ('Not Courrier','31 Rue Jean','de la Fontaine','Paris','France','0145258144','FR007','25-Jul-2021');


--Article
insert into public.Article (Name,Unitprice,Createddate,Article_SupplierId,Article_Category) values ('Bussiness Man','€100','01-May-2002',1,10);
insert into public.Article (Name,Unitprice,Createddate,Article_SupplierId,Article_Category) values ('Mind collapse','€150','15-Jun-2015',5,6);
insert into public.Article (Name,Unitprice,Createddate,Article_SupplierId,Article_Category) values ('Self confidence','€75','26-Apr-2020',7,2);
insert into public.Article (Name,Unitprice,Createddate,Article_SupplierId,Article_Category) values ('Big boxer','€25','12-Jan-2019',4,9);


--Parcel Tracking
insert into public.Parcel_Tracking (Trackingdate,TrackingstatusId,ParcelId_Tracking) values (now(),1,3);
insert into public.Parcel_Tracking (Trackingdate,TrackingstatusId,ParcelId_Tracking) values (now(),2,5);
insert into public.Parcel_Tracking (Trackingdate,TrackingstatusId,ParcelId_Tracking) values (now(),3,6);
insert into public.Parcel_Tracking (Trackingdate,TrackingstatusId,ParcelId_Tracking) values (now(),4,7);
insert into public.Parcel_Tracking (Trackingdate,TrackingstatusId,ParcelId_Tracking) values (now(),5,9);


--Parcel Details
insert into Parcel_Details (Origin,Destination,Status,Type,Weight,Parcel_Transporter,Parcel_Order) values ('France','Le kremlin becetre','Not Delivered','Big Cardboard Box','5 kilo',1,45);
insert into Parcel_Details (Origin,Destination,Status,Type,Weight,Parcel_Transporter,Parcel_Order) values ('France','Lyon','Delivered','Matel instruments','8 kilo',1,115);
insert into Parcel_Details (Origin,Destination,Status,Type,Weight,Parcel_Transporter,Parcel_Order) values ('France','Marseille','In progress','Computer','5 kilo',1,550);
insert into Parcel_Details (Origin,Destination,Status,Type,Weight,Parcel_Transporter,Parcel_Order) values ('Germany','Berlin','Not Delivered','Home Materials','10 kilo',1,220);
insert into Parcel_Details (Origin,Destination,Status,Type,Weight,Parcel_Transporter,Parcel_Order) values ('Germany','Startgurd','In progress','Electronics','2 kilo',1,265);
insert into Parcel_Details (Origin,Destination,Status,Type,Weight,Parcel_Transporter,Parcel_Order) values ('Italy','Rome','Delivered','Garden Materials','5 kilo',1,72);
insert into Parcel_Details (Origin,Destination,Status,Type,Weight,Parcel_Transporter,Parcel_Order) values ('France','Le kremlin becetre','Delivered','Big Cardboard Box','5 kilo',1,116);
insert into Parcel_Details (Origin,Destination,Status,Type,Weight,Parcel_Transporter,Parcel_Order) values ('France','Le kremlin becetre','Not Delivered','Wodden Bpx','5 kilo',1,136);


--MIGRATE DATABASE

create table Mig_transporter
(
    code  varchar(8) not null
        constraint pk_transport
            primary key,
    label varchar(30)
);

comment on table Mig_transporter is 'Transporters table';

alter table transporter
    owner to postgres;

INSERT INTO public.Mig_transporter (code, label) VALUES ('BM', 'Brico');
INSERT INTO public.Mig_transporter (code, label) VALUES ('LD', 'LDD Provider');
INSERT INTO public.Mig_transporter (code, label) VALUES ('AF', 'Preparation');
INSERT INTO public.Mig_transporter (code, label) VALUES ('AN', 'Order Cancellation');
INSERT INTO public.Mig_transporter (code, label) VALUES ('CX', 'parcelSIMO EXPERT');
INSERT INTO public.Mig_transporter (code, label) VALUES ('EN', 'Pickup');
INSERT INTO public.Mig_transporter (code, label) VALUES ('HC', 'Messagerie BtC');
INSERT INTO public.Mig_transporter (code, label) VALUES ('KF', 'KIALA France');
INSERT INTO public.Mig_transporter (code, label) VALUES ('TA', 'TATEX');
INSERT INTO public.Mig_transporter (code, label) VALUES ('TH', 'TATEX');
INSERT INTO public.Mig_transporter (code, label) VALUES ('TN', 'TNT National');
INSERT INTO public.Mig_transporter (code, label) VALUES ('ZA', 'Other (stats)');


--transporter
insert into public.Transporter (code,Name) select code,label from public.Mig_transporter;


--Orders
insert into public.Orders (Quantity,Unitprice,Orderdate,Ordercompletion,POS,Order_CustomerId,Order_ArticleId,Order_SupplierId) select 5,'€1000',coalesce(date_order,now()),coalesce(date_delivery_expected,now()),cast(num_pos as int),1,4,1 from public.order_header;


create table order_header
(
    id                     serial      not null
        constraint pk_header_cde
            primary key,
    num_package_om         varchar(30) not null,
    num_cde_om             varchar(30) not null,
    customer_name          varchar(35),
    num_pos                varchar(10),
    code_transporter       varchar(8),
    origin                 varchar(5)  not null,
    date_expedition        timestamp,
    date_order             date,
    date_delivery_expected date,
    date_delivery_actual   date,
    date_mod               timestamp,
    date_cre               timestamp
);

comment on table order_header is 'order headers table';

alter table order_header
    owner to postgres;

create index fki_code_transport
    on order_header (code_transporter);

INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (11, '17504425-001', '17504425', 'M custo', '25001', 'BM', 'BASE', '2013-02-25 17:50:44.000000', null, null, null, null, '2013-04-22 10:06:06.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (18, '201303000004-LDD', '201303000004', 'Inconnu', null, null, 'LDD', null, '2013-03-05', '2013-03-10', '2013-07-10', null, '2013-04-22 10:45:46.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (9, '17474025-001', '17474025', 'M custo', '20119', 'BM', 'BASE', '2013-02-25 17:47:40.000000', null, null, null, null, '2013-04-22 09:56:15.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (16, '15402105-001', '15402105', '[custom', '20119', 'BM', 'BASE', '2013-03-05 15:40:21.000000', null, null, null, null, '2013-04-22 10:21:15.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (19, '201303000007-LDD', '201303000007', 'Inconnu', null, null, 'LDD', null, '2013-03-05', '2013-03-10', '2013-07-08', null, '2013-04-22 10:45:46.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (160, '201306000215011', '201306000215', ' PAULET', '20176', 'BM', 'BASE', '2013-06-26 11:40:09.000000', null, null, null, null, '2013-06-27 16:20:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (99, '201305000005011', '201305000005', ' REMI D', '20101', 'BM', 'BASE', '2013-05-14 14:41:10.000000', null, null, null, null, '2013-05-14 17:50:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (102, '201305000005020', '201305000022', ' REMI D', '20307', 'BM', 'BASE', '2013-05-14 14:41:10.000000', null, null, null, null, '2013-05-16 15:58:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (6, '15462605-001', '15462605', '[custom', '20119', 'BM', 'BASE', '2013-03-05 15:46:26.000000', null, null, null, null, '2013-04-22 09:40:19.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (104, '201305000004011', '201305000004', ' PATRIC', '01864', 'BM', 'BASE', '2013-05-17 14:20:25.000000', null, null, null, null, '2013-05-17 16:13:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (7, '16562625-001', '16562625', 'M custo', '20119', 'BM', 'BASE', '2013-02-25 16:56:26.000000', null, null, null, null, '2013-04-22 09:47:26.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (8, '16570325-001', '16570325', 'M custo', '20119', 'BM', 'BASE', '2013-02-25 16:57:03.000000', null, null, null, null, '2013-04-22 09:53:23.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (10, '17482825-001', '17482825', 'M custo', '20119', 'BM', 'BASE', '2013-02-25 17:48:28.000000', null, null, null, null, '2013-04-22 09:58:27.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (20, '201303000008-LDD', '201303000008', 'Inconnu', null, null, 'LDD', null, '2013-03-05', '2013-03-10', '2013-07-01', null, '2013-04-22 10:45:47.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (12, '12590226-001', '12590226', 'M custo', '20119', 'BM', 'BASE', '2013-02-26 12:59:02.000000', null, null, null, null, '2013-04-22 10:10:13.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (13, '13050526-001', '13050526', 'M custo', '20119', 'BM', 'BASE', '2013-02-26 13:05:05.000000', null, null, null, null, '2013-04-22 10:12:48.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (14, '17363426-001', '17363426', 'M custo', '20119', 'BM', 'BASE', '2013-02-26 17:36:34.000000', null, null, null, null, '2013-04-22 10:14:33.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (15, '15103601-001', '15103601', 'M custo', '20119', 'BM', 'BASE', '2013-03-01 15:10:36.000000', null, null, null, null, '2013-04-22 10:16:11.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (105, '201305000007011', '201305000007', ' PATRIC', '20119', 'BM', 'BASE', '2013-05-17 14:20:25.000000', null, null, null, null, '2013-05-17 16:13:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (107, '201305000006011', '201305000006', ' REMI D', '20101', 'BM', 'BASE', '2013-05-24 16:12:27.000000', null, null, null, null, '2013-05-28 09:05:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (17, '201302000040-LDD', '201302000040', 'Inconnu', null, null, 'LDD', null, '2013-03-05', '2013-03-10', '2013-05-29', null, '2013-04-22 10:45:45.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (21, '201303000009-LDD', '201303000009', 'Inconnu', null, null, 'LDD', null, '2013-03-05', '2013-03-10', '2013-07-01', null, '2013-04-22 10:45:47.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (141, '201305000003011', '201305000003', ' BRICOM', '20101', 'BM', 'BASE', '2013-05-14 14:41:51.000000', null, null, null, null, '2013-06-21 15:36:54.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (135, '201306000168011', '201306000168', ' DIDIER', '20211', 'BM', 'BASE', '2013-06-20 11:21:01.000000', null, null, null, null, '2013-06-21 11:17:15.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (143, '201306000171011', '201306000171', ' BENEDI', '20341', 'BM', 'BASE', '2013-06-24 11:10:01.000000', null, null, null, null, '2013-06-24 17:32:06.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (145, '201306000120011', '201306000120', ' ANDRE ', '01483', 'BM', 'BASE', '2013-06-24 11:10:02.000000', null, null, null, null, '2013-06-24 17:34:24.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (147, '201306000185011', '201306000185', 'MR NATH', '02283', 'BM', 'BASE', '2013-06-24 11:10:03.000000', null, null, null, null, '2013-06-24 17:34:51.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (149, '201306000189011', '201306000189', ' JEAN M', '20314', 'BM', 'BASE', '2013-06-24 11:10:04.000000', null, null, null, null, '2013-06-24 17:35:08.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (151, '201306000175011', '201306000175', ' JEROME', '06288', 'BM', 'BASE', '2013-06-24 11:10:04.000000', null, null, null, null, '2013-06-24 17:35:27.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (23, '201304000018-LDD', '201304000018', 'Inconnu', null, null, 'LDD', null, '2013-04-10', '2013-04-15', '2013-04-23', null, '2013-04-22 10:45:48.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (153, '201306000180011', '201306000180', ' EMILIE', '20384', 'BM', 'BASE', '2013-06-21 10:51:00.000000', null, null, null, null, '2013-06-25 11:38:30.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (155, '201306000197011', '201306000197', ' LIONEL', '05518', 'BM', 'BASE', '2013-06-25 14:10:19.000000', null, null, null, null, '2013-06-25 19:20:04.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (157, '201306000089011', '201306000089', ' ARNAUD', '02380', 'BM', 'BASE', '2013-06-25 14:10:20.000000', null, null, null, null, '2013-06-25 19:21:42.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (22, '201303000012-LDD', '201303000012', 'Inconnu', null, null, 'LDD', null, '2013-03-05', '2013-03-10', '2013-04-01', null, '2013-04-22 10:45:47.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (159, '201306000011011', '201306000011', ' FRANCI', '04971', 'BM', 'BASE', '2013-06-26 11:40:08.000000', null, null, null, null, '2013-06-27 11:43:14.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (101, '201305000003015', '201305000015', ' BRICOM', '02711', 'BM', 'BASE', '2013-05-14 14:41:51.000000', null, null, null, null, '2013-05-16 15:56:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (106, '201305000009011', '201305000009', ' PATRIC', '01864', 'CX', 'BASE', '2013-05-23 17:31:26.000000', null, null, null, null, '2013-05-27 15:43:01.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (92, '201304000033-LDD', '201304000033', 'Inconnu', null, null, 'LDD', null, '2013-04-23', '2013-04-28', '2013-04-24', null, '2013-04-24 08:59:33.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (94, '201304000042011', '201304000042', ' REMI D', '20119', 'BM', 'BASE', '2013-05-02 10:32:15.000000', null, null, null, null, '2013-05-06 10:27:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (5, '12471106-001', '12471106', 'M JEAN ', '01206', 'BM', 'BASE', '2013-03-06 12:47:11.000000', null, null, null, null, '2013-04-20 13:08:49.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (93, '201304000041011', '201304000041', 'M REMI ', '20119', 'BM', 'BASE', '2013-05-02 10:31:34.000000', null, null, null, null, '2013-05-06 10:27:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (95, '201304000052011', '201304000052', ' JOEl C', '02206', 'BM', 'BASE', '2013-05-02 10:32:15.000000', null, null, null, null, '2013-05-10 17:19:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (173, '201306000281011', '201306000281', 'MME JUL', '20191', 'BM', 'BASE', '2013-07-01 12:00:35.000000', null, null, null, null, '2013-07-01 17:41:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (142, '201306000153011', '201306000153', 'MR NICO', '20325', 'BM', 'BASE', '2013-06-20 11:21:00.000000', null, null, null, null, '2013-06-24 16:57:21.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (144, '201306000110011', '201306000110', ' KARINE', '03023', 'BM', 'BASE', '2013-06-24 11:10:02.000000', null, null, null, null, '2013-06-24 17:34:07.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (146, '201306000183011', '201306000183', ' RODOLP', '03505', 'BM', 'BASE', '2013-06-24 11:10:03.000000', null, null, null, null, '2013-06-24 17:34:36.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (148, '201306000188011', '201306000188', ' ANNABE', '04866', 'BM', 'BASE', '2013-06-24 11:10:03.000000', null, null, null, null, '2013-06-24 17:35:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (150, '201306000193011', '201306000193', ' CAROLE', '02068', 'BM', 'BASE', '2013-06-24 11:10:04.000000', null, null, null, null, '2013-06-24 17:35:17.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (152, '201306000182011', '201306000182', ' ARNAUD', '20176', 'BM', 'BASE', '2013-06-21 10:51:00.000000', null, null, null, null, '2013-06-24 17:46:15.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (154, '201306000005011', '201306000005', ' CECILE', '01864', 'BM', 'BASE', '2013-06-25 14:10:18.000000', null, null, null, null, '2013-06-25 18:53:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (156, '201306000078011', '201306000078', ' NATHAL', '02294', 'BM', 'BASE', '2013-06-25 14:10:20.000000', null, null, null, null, '2013-06-25 19:21:31.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (158, '201306000143011', '201306000143', 'MME SEV', '04789', 'BM', 'BASE', '2013-06-25 14:10:21.000000', null, null, null, null, '2013-06-25 19:21:53.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (190, '201307000282011', '201307000282', 'MR PATR', '20313', 'BM', 'BASE', '2013-07-17 12:00:28.000000', null, null, null, null, '2013-07-17 16:16:31.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (163, '201306000250011', '201306000250', 'MR GUIL', '25001', 'BM', 'BASE', '2013-06-27 13:40:26.000000', null, null, null, null, '2013-06-28 16:27:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (161, '201306000227011', '201306000227', ' MIKAEL', '20162', 'BM', 'BASE', '2013-06-27 13:50:14.000000', null, null, null, null, '2013-06-28 13:27:45.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (162, '201306000240011', '201306000240', 'MR JEAN', '06306', 'BM', 'BASE', '2013-06-27 13:40:26.000000', null, null, null, null, '2013-06-28 16:26:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (164, '201306000219011', '201306000219', ' BRICE ', '04789', 'BM', 'BASE', '2013-06-27 13:40:23.000000', null, null, null, null, '2013-06-28 17:02:11.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (165, '201306000226011', '201306000226', ' GUILLA', '20126', 'BM', 'BASE', '2013-06-27 13:40:24.000000', null, null, null, null, '2013-06-28 17:25:01.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (166, '201306000228011', '201306000228', ' MIKAEL', '20162', 'BM', 'BASE', '2013-06-27 13:40:24.000000', null, null, null, null, '2013-06-28 17:25:01.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (168, '201306000264011', '201306000264', 'MME MAR', '20356', 'BM', 'BASE', '2013-07-01 12:00:33.000000', null, null, null, null, '2013-07-01 17:36:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (169, '201306000274011', '201306000274', 'MR ANTH', '20176', 'BM', 'BASE', '2013-07-01 12:00:33.000000', null, null, null, null, '2013-07-01 17:37:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (170, '201306000276011', '201306000276', 'MR DANI', '20089', 'BM', 'BASE', '2013-07-01 12:00:33.000000', null, null, null, null, '2013-07-01 17:38:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (172, '201306000280011', '201306000280', 'MR BRIC', '20307', 'BM', 'BASE', '2013-07-01 12:00:35.000000', null, null, null, null, '2013-07-01 17:40:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (167, '201306000253011', '201306000253', 'MR CHRI', '20211', 'BM', 'BASE', '2013-07-01 12:00:32.000000', null, null, null, null, '2013-07-01 17:35:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (171, '201306000278011', '201306000278', 'MR CEDR', '06903', 'BM', 'BASE', '2013-07-01 12:00:34.000000', null, null, null, null, '2013-07-01 17:39:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (174, '201306000194011', '201306000194', ' NATHAL', '05345', 'BM', 'BASE', '2013-07-03 18:10:32.000000', null, null, null, null, '2013-07-04 10:38:10.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (175, '201307000026011', '201307000026', 'MME MAR', '20304', 'BM', 'BASE', '2013-07-03 18:10:32.000000', null, null, null, null, '2013-07-04 10:38:18.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (176, '201306000311011', '201306000311', 'MME CHR', '02982', 'BM', 'BASE', '2013-07-03 18:20:32.000000', null, null, null, null, '2013-07-04 10:38:35.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (191, '201307000304011', '201307000304', 'MR FRED', '01483', 'BM', 'BASE', '2013-07-17 12:00:29.000000', null, null, null, null, '2013-07-17 16:16:32.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (192, '201306000141011', '201306000141', ' ROELOF', '20161', 'BM', 'BASE', '2013-07-17 12:00:29.000000', null, null, null, null, '2013-07-17 16:16:32.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (193, '201307000307011', '201307000307', 'MME JOA', '20181', 'BM', 'BASE', '2013-07-17 12:00:29.000000', null, null, null, null, '2013-07-17 16:16:32.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (103, '201305000006-LDD', '201305000006', 'Inconnu', null, null, 'LDD', null, '2013-05-16', '2013-05-26', '2013-06-03', null, '2013-05-17 10:32:46.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (194, '201306000094011', '201306000094', 'MR PIER', '06840', 'BM', 'BASE', '2013-07-18 16:10:41.000000', null, null, null, '2013-07-22 11:30:33.000000', '2013-07-19 12:37:25.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (195, '201307000003011', '201307000003', 'MR FRAN', '03493', 'BM', 'BASE', '2013-07-18 16:10:41.000000', null, null, null, '2013-07-22 11:31:00.000000', '2013-07-19 12:37:25.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (196, '201307000221011', '201307000221', 'MME EMI', '02470', 'BM', 'BASE', '2013-07-18 16:10:42.000000', null, null, null, '2013-07-22 11:32:00.000000', '2013-07-19 12:37:25.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (197, '201307000225011', '201307000225', 'MME NAD', '20369', 'BM', 'BASE', '2013-07-18 16:10:42.000000', null, null, null, null, '2013-07-22 11:33:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (180, '201307000118011', '201307000118', 'MR CYRI', '04961', 'BM', 'BASE', '2013-07-09 18:30:42.000000', null, null, null, '2013-07-17 15:51:00.000000', '2013-07-10 17:47:31.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (182, '201307000027011', '201307000027', 'MR RENE', '04646', 'BM', 'BASE', '2013-07-17 12:00:25.000000', null, null, null, '2013-07-18 11:38:00.000000', '2013-07-17 16:02:26.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (198, '201307000240011', '201307000240', 'MME HEL', '20178', 'BM', 'BASE', '2013-07-18 16:10:42.000000', null, null, null, null, '2013-07-22 11:34:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (199, '201307000263011', '201307000263', 'MR SEBA', '02279', 'BM', 'BASE', '2013-07-18 16:10:42.000000', null, null, null, null, '2013-07-22 11:54:17.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (200, '201307000273011', '201307000273', 'MME ANN', '20053', 'BM', 'BASE', '2013-07-18 16:10:43.000000', null, null, null, null, '2013-07-22 11:54:17.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (186, '201307000290011', '201307000290', 'MME STE', '20389', 'BM', 'BASE', '2013-07-17 12:00:27.000000', null, null, null, null, '2013-07-17 16:16:30.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (187, '201306000102011', '201306000102', ' OLIVIE', '06345', 'BM', 'BASE', '2013-07-17 12:00:27.000000', null, null, null, null, '2013-07-17 16:16:31.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (188, '201306000146011', '201306000146', 'MR OLIV', '02355', 'BM', 'BASE', '2013-07-17 12:00:27.000000', null, null, null, null, '2013-07-17 16:16:31.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (189, '201307000296011', '201307000296', 'MR NICO', '20372', 'BM', 'BASE', '2013-07-17 12:00:28.000000', null, null, null, null, '2013-07-17 16:16:31.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (183, '201307000284011', '201307000284', 'MR FRED', '20301', 'BM', 'BASE', '2013-07-17 12:00:26.000000', null, null, null, '2013-07-18 11:39:00.000000', '2013-07-17 16:14:40.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (184, '201307000285011', '201307000285', 'MR WILL', '20204', 'BM', 'BASE', '2013-07-17 12:00:26.000000', null, null, null, '2013-07-18 11:40:00.000000', '2013-07-17 16:14:40.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (185, '201307000210011', '201307000210', 'MR JACQ', '05027', 'BM', 'BASE', '2013-07-17 12:00:26.000000', null, null, null, '2013-07-18 11:41:00.000000', '2013-07-17 16:16:30.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (202, '201307000527011', '201307000527', 'MME CLA', '20188', 'BM', 'BASE', '2013-07-26 14:30:32.000000', null, null, null, '2013-07-29 15:14:55.000000', '2013-07-29 14:13:45.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (207, '201307000545011', '201307000545', 'MR JEAN', '20104', 'BM', 'BASE', '2013-07-26 14:30:34.000000', null, null, null, null, '2013-07-29 14:14:34.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (208, '201307000559011', '201307000559', 'MR FRED', '20330', 'BM', 'BASE', '2013-07-26 14:30:34.000000', null, null, null, '2013-07-29 15:11:57.000000', '2013-07-29 14:14:43.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (201, '201307000280011', '201307000280', 'MR PATR', '04076', 'BM', 'BASE', '2013-07-18 16:10:43.000000', null, null, null, '2013-07-29 15:14:47.000000', '2013-07-22 11:54:17.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (203, '201307000533011', '201307000533', 'MME CHA', '01883', 'BM', 'BASE', '2013-07-26 14:30:32.000000', null, null, null, '2013-07-29 15:15:05.000000', '2013-07-29 14:13:53.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (204, '201307000536011', '201307000536', 'MR RODO', '05327', 'BM', 'BASE', '2013-07-26 14:30:33.000000', null, null, null, '2013-07-29 15:15:14.000000', '2013-07-29 14:14:03.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (205, '201307000583011', '201307000583', 'MME EDW', '04775', 'BM', 'BASE', '2013-07-26 14:30:33.000000', null, null, null, '2013-07-29 15:15:26.000000', '2013-07-29 14:14:15.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (206, '201307000544011', '201307000544', 'MME MIC', '20205', 'BM', 'BASE', '2013-07-26 14:30:33.000000', null, null, null, '2013-07-29 15:15:35.000000', '2013-07-29 14:14:24.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (209, '201308000466011', '201308000466', 'MME CLA', '20212', 'BM', 'BASE', '2013-08-16 15:00:55.000000', null, null, null, null, '2013-08-21 09:08:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (210, '201308000467011', '201308000467', 'MR FLOR', '20354', 'BM', 'BASE', '2013-08-16 15:00:55.000000', null, null, null, null, '2013-08-21 09:09:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (211, '201308000005011', '201308000005', 'MR XAVI', '20094', 'BM', 'BASE', '2013-08-16 15:00:56.000000', null, null, null, null, '2013-08-21 09:10:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (212, '201308000009011', '201308000009', 'MR DAVI', '20256', 'BM', 'BASE', '2013-08-16 15:00:56.000000', null, null, null, null, '2013-08-21 09:11:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (213, '201308000184011', '201308000184', 'MR DAVI', '20200', 'BM', 'BASE', '2013-08-16 15:00:56.000000', null, null, null, null, '2013-08-21 09:12:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (214, '201308000108011', '201308000108', 'MR ALAI', '02241', 'BM', 'BASE', '2013-08-16 15:00:57.000000', null, null, null, null, '2013-08-21 09:13:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (215, '201308000367011', '201308000367', 'MR JEAN', '03042', 'BM', 'BASE', '2013-08-16 15:00:57.000000', null, null, null, null, '2013-08-21 09:14:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (216, '201308000420011', '201308000420', 'MR EGID', '06013', 'BM', 'BASE', '2013-08-16 15:00:57.000000', null, null, null, null, '2013-08-21 09:15:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (217, '201308000470011', '201308000470', 'MR JOSE', '20366', 'BM', 'BASE', '2013-08-16 15:00:58.000000', null, null, null, null, '2013-08-21 09:16:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (218, '201308000471011', '201308000471', 'MR MICH', '20147', 'BM', 'BASE', '2013-08-16 15:00:58.000000', null, null, null, null, '2013-08-21 09:17:00.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (219, '201309000314011', '201309000314', 'MME ISA', '20217', 'BM', 'BASE', '2013-10-08 13:10:48.000000', null, null, null, null, '2013-10-15 18:28:32.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (220, '201309000462011', '201309000462', 'MME ELO', '20204', 'BM', 'BASE', '2013-10-01 11:40:23.000000', null, null, null, null, '2013-10-17 16:47:44.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (221, '201309000069011', '201309000069', 'MR CHRI', '04378', 'BM', 'BASE', '2013-10-01 11:40:19.000000', null, null, null, null, '2013-10-17 17:49:46.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (222, '201306000046011', '201306000046', ' JULIEN', '20336', 'BM', 'BASE', '2013-06-11 17:30:40.000000', null, null, null, null, '2013-10-22 12:36:01.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (223, '201311000593-LDD', '201311000593', 'Monsieu', null, null, 'LDD', null, '2013-11-21', '2013-12-12', '2013-11-26', null, '2013-11-26 17:37:56.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (224, '201312000224-LDD', '201312000224', 'Monsieu', null, null, 'LDD', null, '2013-12-11', '2014-01-04', '2013-12-12', null, '2013-12-12 11:54:39.000000');
INSERT INTO public.order_header (id, num_package_om, num_cde_om, customer_name, num_pos, code_transporter, origin, date_expedition, date_order, date_delivery_expected, date_delivery_actual, date_mod, date_cre) VALUES (225, '201312000231-LDD', '201312000231', 'Madame ', null, null, 'LDD', null, '2013-12-11', '2013-12-27', '2013-12-12', null, '2013-12-12 11:54:42.000000');






