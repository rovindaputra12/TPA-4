-- Membuat Database
create database store_online;

-- Membuat Table
Use store_online; 

create table customer(
	id int primary key not null auto_increment,
    nama varchar(25),
    alamat varchar(30),
    no_hp varchar(20),
    jenis_kelamin varchar(10)
);

create table category(
	id int primary key not null auto_increment,
    nama_kategori varchar(25)
);

create table product(
	id int primary key not null auto_increment,
    nama_barang varchar(23),
    harga_barang int,
    stok_barang int,
    id_kategori int,
    foreign key (id_kategori) references category(id)
);


create table transaction(
	id int primary key not null auto_increment,
    tanggal_transaksi date,
    jumlah_pembelian int,
    id_pelanggan int,
    id_barang int,
    foreign key (id_pelanggan) references customer(id),
    foreign key (id_barang) references product(id)
);

-- mengisi data tabel
insert into customer (nama, alamat, no_hp, jenis_kelamin) values
("Arif", "Ngawi", "085747048022", "Laki-laki"),
("Agung", "Solo", "081937200301", "Laki-laki"),
("Rafif", "Ngawi", "087442656788", "Laki-Laki"),
("Farid", "Ngawi", "083425184027", "Laki-Laki"),
("Rafky", "Ngawi", "086372946104", "Laki-Laki"),
("Putri", "toraja", "082845381047", "Perempuan"),
("Duta", "Solo", "087880993232", "Laki-laki"),
("Azella", "Blitar", "082445678990", "Perempuan"),
("Ferry", "Surabaya", "085688543201", "Laki-laki"),
("Khoriunissa", "Manggarai", "081788234220", "Perempuan");

insert into category (nama_kategori) values
("Elektronik"),
("Makanan & Minuman"),
("Otomotif"),
("Pakaian Pria"),
("Pakain Wanita"),
("Handphone & Aksesoris"),
("Perlengkapan Rumah"),
("Kesehatan"),
("Buku & Alat Tulis"),
("Olahraga & Outdor");

insert into product (nama_barang, harga_barang, stok_barang, id_kategori) values
("Hoodie Eiger", 110000, 50, 4),
("Celana Tartan Color", 50000, 30, 4),
("Kebaya Merah", 110000, 20, 5),
("Iphone 8+ ", 3400000, 20, 6),
("Pop Mie", 7000, 200, 2),
("Ac Panasonic", 1200000, 10, 1),
("Vitamin C", 10000, 500, 8),
("Kertas Folio", 5000, 80, 9),
("Treadmill", 3300000, 40, 10),
("Rak Sepatu", 70000, 50, 7),
("Shock Double", 500000, 250, 3),
("Hijab Wolfis", 50000, 300, 5),
("Hand Sanitizer", 15000, 100, 8),
("Realme 6 Pro", 2800000, 60, 6),
("Mie Sedaap", 5000, 600, 2),
("Mesin Cuci", 500000, 40, 1),
("Wajan", 17000, 100, 7),
("Helm fullface", 500000, 180, 3),
("Sepeda Polygon", 340000, 90, 10),
("Crayon", 20000, 280, 9);


insert into transaction (tanggal_transaksi, jumlah_pembelian, id_pelanggan, id_barang) values
("2022-10-20", 1, 1, 1),
("2022-10-20", 1, 5, 3),
("2022-10-20", 1, 2, 4),
("2022-10-21", 1, 3, 2),
("2022-10-21", 1, 4, 2),
("2022-10-22", 1, 9, 9),
("2022-10-22", 1, 3, 6),
("2022-10-22", 1, 1, 2),
("2022-10-25", 1, 1, 19),
("2022-10-25", 1, 6, 12),
("2022-09-22", 1, 8, 12),
("2022-09-22", 1, 7, 18),
("2022-09-22", 1, 10, 10),
("2022-08-22", 1, 5, 17),
("2022-08-22", 1, 5, 13);

-- 1 pelanggan membeli 3 barang yang berbeda
select id_pelanggan, customer.nama, id_barang, nama_barang, jumlah_pembelian
from transaction inner join customer
on transaction.id_pelanggan = customer.id
inner join product
on transaction.id_barang = product.id
where id_pelanggan = 1;

-- Melihat 3 produk yang paling sering dibeli oleh pelanggan
select * from transaction order by jumlah_pembelian desc limit 3 ;

-- Melihat Kategori barang yang paling banyak barangnya
select nama_barang, id_kategori, nama_kategori, max(stok_barang)
from product inner join category
on product.id_kategori = category.id;

-- Melihat pendapat rata-rata tiap bulan terakhir
select transaction.tanggal_transaksi, AVG(transaction.jumlah_pembelian*product.harga_barang) as rata_rata_transaksi
FROM transaction inner join product
on transaction.id = product.id
GROUP BY YEAR(transaction.tanggal_transaksi), MONTH(transaction.tanggal_transaksi);

select * from product;
select * from category;
select * from customer;
select * from transaction;
select * from transaction where tanggal_transaksi = "2022-10-21";
select * from customer where id = 1;
select * from product where id = 1;
select nama_barang, harga_barang from product where id = 5;
select nama_kategori from category;

update customer set nama = "Anjis" where id = 2;

update product set harga_barang = 3000000 where id = 4;

update category set nama_kategori = "perlengkapan sekolah" where id = 9;

update transaction set tanggal_transaksi = "2022-09-20" where id = 14;


delete from transaksi where id = 1;
delete from barang where id = 2;
delete from pelanggan where id = 3;
delete from kategori where id = 4;


drop table transaksi;
drop table barang;
drop table pelanggan;
drop table kategori;

drop database online_retail;
