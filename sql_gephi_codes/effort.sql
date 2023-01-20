use artists;
SET SQL_SAFE_UPDATES = 0;
select * from cofluence;
select follower_name from dads_sons;
select count(*),influencer_id  from cofluence group by influencer_id;
select * from influencer_simlarge_numfo;
select * from dads_sons order by num_followers desc;


select count(*) as th ,influencer_id  from cofluence group by influencer_id;

alter table cofluence add column how_many_fo int;
update cofluence a, influencer_simlarge_numfo
set a.how_many_fo = influencer_simlarge_numfo.num_fo where a.influencer_name = influencer_simlarge_numfo.influencer_name;

select influencer_id, follower_id from cofluence
where similarity>0.8 and how_many_fo >20
order by influencer_id;

select influencer_id, influencer_name, influencer_main_genre, follower_id, follower_name, follower_active_start
from influence_data where follower_main_genre="Pop/Rock" order by follower_active_start, influencer_id;

select count(*), influencer_id, influencer_name, influencer_main_genre, follower_active_start
from influence_data where follower_main_genre="Pop/Rock"
group by influencer_id, follower_active_start, influencer_main_genre, influencer_name
order by follower_active_start, count(*) desc;

select influencer_name from influence_data where follower_name="The Beatles";
select count(*) from influence_data where influencer_name = "Elvis Presley";
select influencer_id, follower_id from influence_data where follower_name = "Nirvana";
select * from dads_sons where follower_name in
(select follower_name from dads_sons group by follower_name having count(follower_name)>1)
order by follower_name;


-- something

select count(*) as num_inf, follower_id, follower_name from cofluence
where similarity>0.8
group by follower_id, follower_name
order by num_inf desc;

alter table influence_data add column num_fo int;
update influence_data i , how_many_sons h
set i.num_fo = h.num_followers where (i.influencer_name = h.influencer_name);

select distinct influencer_name from influence_data order by num_fo desc;

select influencer_id, follower_id, influencer_name, follower_active_start, num_fo from influence_data where num_fo>100
order by follower_active_start, num_fo;

select artist_names, popularity, year, song_title
from music_full_modified 
where popularity>40
order by popularity desc;

select count(*) from music_full_modified 
where popularity>80 and year <2010;




select * from dads_sons order by num_followers desc;