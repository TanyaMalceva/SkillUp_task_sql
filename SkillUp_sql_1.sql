# Создаем БД
create database IF NOT EXISTS MALCEVA_20;

		# Подключаемся к БД
use MALCEVA_20;

		# Создаем таблицу USERS с полями id, login, password
create table IF NOT EXISTS USERS (
id int auto_increment primary key,
login varchar(20) not null,
`password` varchar(20) not null
);

		#  Заполняем таблицу USERS 15 записями
insert into USERS values
(null, 'Bob', 111),
(null, 'Lik', 222),
(null, 'Kit', 333),
(null, 'Tan', 444),
(null, 'Rut', 555),
(null, 'Nik', 666),
(null, 'Ami', 777),
(null, 'Ori', 888),
(null, 'Mir', 999),
(null, 'Kap', 109),
(null, 'Ott', 108),
(null, 'Pon', 107),
(null, 'Top', 106),
(null, 'Sam', 105),
(null, 'Dis', 104);

		# Создаем таблицу PROFILES с полями id, first_name, last_name, email, age
create table IF NOT EXISTS `PROFILES` (
id int auto_increment primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
email varchar(30) not null,
age varchar(3) not null
);

		# Заполняем таблицу PROFILES 10 записями
insert into PROFILES values
(null, 'Bob', 'Rier', 'bob@gmail.com',18),
(null, 'Lika', 'Braiton', 'lik@gmail.com',23),
(null, 'Kito', 'Trau', 'kit@gmail.com',24),
(null, 'Tann', 'Patov', 'tan@gmail.com',21),
(null, 'Rutr', 'Avik', 'rut@gmail.com',21),
(null, 'Nika', 'Vuvich', 'nik@gmail.com',26),
(null, 'Ami', 'Jein', 'ami@gmail.com',20),
(null, 'Ori', 'Fraim', 'ori@gmail.com',22),
(null, 'Mir', 'Nitov', 'mir@gmail.com',18),
(null, 'Kapt', 'Dream', 'kap@gmail.com', 19);

		#  Создаем таблицу GAMES с полями id, first_player_id, second_player_id
create table IF NOT EXISTS GAMES (
id int auto_increment primary key,
first_player_id int,
second_player_id int
);
		# Заполняем таблицу GAMES 10 записями
        # в полях first_player_id, second_player_id должны быть
        # значения id из таблицы profiles
insert into GAMES values
(null, 1, 2),
(null, 2, 3),
(null, 3, 4),
(null, 4, 5),
(null, 5, 6),
(null, 6, 7),
(null, 7, 8),
(null, 8, 9),
(null, 9, 10),
(null, 10, 1);

# Создаем таблицу GAMES_RESULTS с полями id, result_value
create table IF NOT EXISTS GAMES_RESULTS (
id int auto_increment primary key,
result_value varchar(20) not null
);

# Заполняем таблицу GAMES_RESULTS
insert into GAMES_RESULTS values
(null, 'Win'),
(null, 'Lose'),
(null, 'Drow');

# Создаем таблицу ARCHIEVEMENTS с полями id, achiev_name
create table IF NOT EXISTS ARCHIEVEMENTS (
id int auto_increment primary key,
achiev_name varchar(15) not null
);

# Заполняем таблицу ARCHIEVEMENTS несколькими ачивками
insert into ARCHIEVEMENTS values
(null, 'grandmatser'),
(null, 'master'),
(null, 'expert'),
(null, 'middle'),
(null, 'beginer'),
(null, 'newbie');

# Создаем таблицу PLAYER_ACHIEVS с полями id, player_id, achiev_id
create table IF NOT EXISTS PLAYER_ACHIEVS (
id int auto_increment primary key,
player_id int,
achiev_id int
);

# Заполняем таблицу ARCHIEVEMENTS несколькими ачивками
insert into PLAYER_ACHIEVS values
(null, 1, 1),
(null, 1, 2),
(null, 2, 4),
(null, 3, 4),
(null, 4, 4),
(null, 4, 5),
(null, 5, 6),
(null, 6, 1),
(null, 6, 3),
(null, 7, 4),
(null, 8, 5),
(null, 9, 6),
(null, 10, 3),
(null, 10, 4);

# Создаем таблицу PLAYER_RESULTS с полями id, player_id, result_id, game_id 
create table IF NOT EXISTS PLAYER_RESULTS (
id int auto_increment primary key,
player_id int,
result_id int,
game_id int
);

# Заполняем таблицу PLAYER_RESULTS
insert into PLAYER_RESULTS values
(null, 1, 1, 1),
(null, 2, 1, 2),
(null, 3, 2, 3),
(null, 4, 3, 4),
(null, 5, 3, 5),
(null, 6, 1, 6),
(null, 7, 1, 7),
(null, 8, 2, 8),
(null, 9, 3, 9),
(null, 10, 1, 10);

# Удалите последние 2 записи в таблице users
delete
from USERS
where id>13;

#в таблице profiles измените имя пятого игрока на 'Bob'
update `PROFILES`
set first_name='Bob'
where id=5;

# в таблицу users добавить новое поле profiles_id 
alter table USERS
add column profiles_id int;

# заполнить profiles_id в таблицу users идентификаторами профилей
update USERS
set profiles_id = case
				when id = 1 then 1
                when id = 2 then 2
                when id = 3 then 3
                when id = 4 then 4
                when id = 5 then 5
                when id = 6 then 6
                when id = 7 then 7
                when id = 8 then 8
                when id = 9 then 9
				when id = 10 then 10
                else profiles_id
                end;
                
#создать связи между таблицами users -> profiles
alter table USERS
	add constraint FK_USERS_PROFILES
    foreign key (profiles_id)
    references `PROFILES`(id);
    
#создать связи между таблицами games -> profiles по first_player_id 
alter table GAMES
	add constraint FK_GAMES_PROFILES
    foreign key (first_player_id)
    references `PROFILES`(id);
    
#создать связи между таблицами games -> profiles по second_player_id
alter table GAMES
	add constraint FK_GAMES_2_PROFILES
    foreign key (second_player_id)
    references `PROFILES`(id);

#создать связи между таблицами player_achievs -> profiles
alter table PLAYER_ACHIEVS
	add constraint FK_PLAYER_ACHIEVS_PROFILES
    foreign key (player_id)
    references `PROFILES`(id);

#создать связи между таблицами player_achievs -> achievements
alter table PLAYER_ACHIEVS
	add constraint FK_PLAYER_ACHIEVS_ARCHIEVEMENTS
	foreign key (achiev_id)
	references ARCHIEVEMENTS (id);
    
#создать связи между таблицами player_results -> profiles
alter table PLAYER_RESULTS
	add constraint FK_PLAYER_RESULTS_PROFILES
	foreign key (player_id)
	references `PROFILES`(id);
    
#создать связи между таблицами player_results -> game_results
alter table PLAYER_RESULTS
	add constraint FK_PLAYER_RESULTS_GAMES_RESULTS
	foreign key (result_id)
	references GAMES_RESULTS (id);

#создать связи между таблицами player_results -> games
    alter table PLAYER_RESULTS
	add constraint FK_1_PLAYER_RESULTS_GAMES
	foreign key (game_id)
	references GAMES (id);
    
    # Удалите последние 10 записей в таблице profiles
delete
from `PROFILES`
where id>10;

# Удалите последние 10 записей в таблице archievements
delete
from archievements
where id>6;

delete
from games
where id>10;

delete
from player_achievs
where id>15;

delete
from player_results
where id>10;

delete
from `profiles`
where id>10;

