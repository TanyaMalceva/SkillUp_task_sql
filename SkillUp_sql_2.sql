use MALCEVA_20;

select *
from USERS as t1
join  `PROFILES` as t2 on t1.profiles_id = t2.id;

#JOIN, сделать выборку логинов, имен и фамилий всех игроков из таблиц USERS и PROFILES (where-оператор фильтрации)
select t1.login as user_login,
t2.first_name as profls_frst_name,
t2.last_name as profls_lst_name
from USERS as t1, `PROFILES` as t2
where t1.profiles_id = t2.id;

#JOIN, сделать выборку всех данных из таблиц USERS и PROFILES 
select * 
from `PROFILES` as t2
join USERS as t1 on t1.profiles_id = t2.id;

# 1) JOIN, сделать выборку логинов, имен и фамилий всех игроков из таблиц USERS и PROFILES 
select 	login, 
		first_name, 
        last_name
	from users
	left join `profiles` on users.profiles_id=`profiles`.id;

#2) JOIN, сделать выборку ачивок первых пяти игроков. Выбрать id игрока, имя игрока, 
# email игрока и названия всех его достижений из таблиц PROFILES и ACHIEVEMENTS.

select t1.id,
t1.first_name,
t1.email,
t3.achiev_name
from `profiles` as t1
join player_achievs as t2 on t1.id = t2.player_id
join ARCHIEVEMENTS as t3 on t3.id = t2.achiev_id
and t1.id<6;

# 2) JOIN, сделать выборку ачивок первых пяти игроков. Выбрать id игрока, имя игрока, 
# email игрока и названия всех его достижений из таблиц PROFILES и ACHIEVEMENTS. (тоже самое!!!!)
# ?? почему происходит задвоение данных??
select 
`PROFILES`.id,
`PROFILES`.first_name,
`PROFILES`.email,
ARCHIEVEMENTS.achiev_name
from PLAYER_ACHIEVS
join `PROFILES` on PLAYER_ACHIEVS.player_id = `PROFILES`.id
join ARCHIEVEMENTS on PLAYER_ACHIEVS.achiev_id = ARCHIEVEMENTS.id
and `PROFILES`.id<6;

# 3) Внутреннее соединение, выбрать всю информацию об игроках, которые одержали победу.
# Выбрать id, имена, фамилии, email, возраст и результат игры из таблиц PROFILES и GAME_RESULTS.
# задвоение!!!
select
t1.id,
first_name,
last_name,
email,
age,
t3.result_value
from `profiles` as t1
join player_results as t2 on t1.id = t2.player_id
join games_results as t3 on t3.id = t2.result_id;

# 4) Используя команды JOIN выбрать логины и пароли всех игроков, которые были первыми (first_player_id) во всех играх.
# В результатирующую таблицу вывести поля login, password, id игры из таблиц USERS и GAMES

select 
games.id,
games.first_player_id,
users.login,
users.`password`
from games
join users on games.id = users.id;

# 5) Используя команды JOIN, GROUP BY, COUNT(), ORDER BY посчитать количество игр которые провели игроки указанные в second_player_id. 
# В результатирующую таблицу нужно вывести поля first_name, и количество игр. Полю с функцией COUNT() присвоить псевдоним count_of_games. 
# Результат отсортировать от большего к меньшему

select `profiles`.first_name,
 count(second_player_id) as count_of_games
from `profiles`
join games on games.id = `profiles`.id
group by `profiles`.id
order by count_of_games desc;

# 6)Используя подзапрос выберите имена и email-ы всех first_player_id

select 
`profiles`.first_name,
`profiles`.email
from `profiles`
where `profiles`.id in (SELECT DISTINCT first_player_id from games);





