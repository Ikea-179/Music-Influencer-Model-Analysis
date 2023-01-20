use artists;
select * from data_by_artist;
select * from edges e order by e.influencer, e.follower;
select * from edges where follower =1098;
select e.influencer, a.danceability, a.energy, a.valence, a.tempo, a.loudness, a.mode, a.key, a.acousticness, a.instrumentalness, a.liveness, a.speechiness from edges e
left join data_by_artist a on (e.influencer = a.artist_id)
order by e.influencer, e.follower;
select * from cofluence;
select count(*) from edges;

select e.follower, a.danceability, a.energy, a.valence, a.tempo, a.loudness, a.mode, a.key, a.acousticness, a.instrumentalness, a.liveness, a.speechiness from edges e
left join data_by_artist a on (e.follower = a.artist_id)
order by e.influencer, e.follower;

select count(follower_id), avg(similarity), influencer_id, influencer_name from cofluence group by influencer_id, influencer_name
order by avg(similarity) desc;
select avg(similarity) from cofluence;

set @n = (select count(*) from cofluence);
select count(*)/@n from cofluence where similarity>0.5;
select @n;

select
count(similarity>0.5 or null)/@n as five_count,
count(similarity>0.6 or null)/@n as six_count,
count(similarity>0.7 or null)/@n as seven_count,
count(similarity>0.8 or null)/@n as eight_count,
count(similarity>0.9 or null)/@n as nine_count
from cofluence;

select * from cofluence where 
(similarity in (select similarity from cofluence group by similarity having count(similarity)>1))
order by similarity;

select * from problems where  
(follower_name in (select follower_name from problems group by follower_name having count(follower_name)>1))
order by follower_name;

select
count(similarity>0.5 or null) as five_count,
count(similarity>0.6 or null) as six_count,
count(similarity>0.7 or null) as seven_count,
count(similarity>0.8 or null) as eight_count,
count(similarity>0.9 or null) as nine_count
from cofluence;

select influencer_id, follower_id, influencer_name, follower_name, similarity 
from cofluence
where similarity>0.8
order by influencer_id;

select count(*) as num_fo, influencer_id, influencer_name
from cofluence
where similarity>0.8
group by influencer_id, influencer_name
order by num_fo desc;

select count(*) as num_fo, influencer_main_genre, follower_main_genre
from cofluence
where similarity>0.8
group by influencer_main_genre, follower_main_genre
order by num_fo desc;

select count(*) from influencer_simlarge_numfo where num_fo>20;
select count(*) from influencer_simlarge_numfo where num_fo>30;


select * from cofluence where similarity>0.8