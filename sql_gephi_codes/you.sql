use artists;
SET SQL_SAFE_UPDATES = 0;

select * from armyofbeatles;
alter table armyofbeatles add column fathers int;
update armyofbeatles a, how_many_dads b
set a.fathers=b.num_influencers where (a.follower_name = b.follower_name);

select count(*) from armyofbeatles
where ((fathers>21) and follower_main_genre = "Pop/Rock" and (diff_year = 0 or diff_year = 10 or diff_year = 20));

select count(*) from armyofbeatles
where ((fathers>21) and follower_main_genre = "Pop/Rock" and (diff_year = -10 or diff_year = 30));

select count(*) from armyofbeatles
where ((fathers>21) and follower_main_genre = "Pop/Rock" and (diff_year = -20 or diff_year = 40 or diff_year = 50));

select count(*) from armyofbeatles
where ((fathers>21) and follower_main_genre = "Pop/Rock");