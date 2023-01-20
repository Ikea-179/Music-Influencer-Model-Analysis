use artists;
SET SQL_SAFE_UPDATES = 0;

select * from influence_data;
select count(1) from artist_identity where (artist_identity.active_start=1930);
SELECT count(*), active_start, genre from artist_identity group by genre,active_start;

-- SELECT count(*), active_start, genre from artist_identity group by genre,active_start;
SELECT count(*), influencer_id, influencer_name from influence_data
where influencer_main_genre = follower_main_genre
group by influencer_id, influencer_name;

select distinct influencer_name from influence_data where influencer_active_start = 1960;

alter table influence_data add column diff_year int;
update influence_data set diff_year = (follower_active_start - influencer_active_start);
select count(*), diff_year from influence_data group by diff_year;
select * from influence_data where diff_year = -50;


select count(*), influencer_name, follower_active_start from influence_data group by influencer_name, follower_active_start;
select count(*), follower_name from influence_data group by follower_name order by count(*) desc;
select count(*), influencer_name from influence_data group by influencer_name order by count(*) desc;

select * from how_many_sons;

select how_many_sons.num_followers, how_many_dads.follower_name, num_influencers from how_many_sons
left join how_many_dads on how_many_sons.influencer_name = how_many_dads.follower_name
UNION
select how_many_sons.num_followers,how_many_dads.follower_name, num_influencers from how_many_sons
right join how_many_dads on how_many_sons.influencer_name = how_many_dads.follower_name;

select count(*), num_influencers from how_many_dads group by num_influencers;

alter table how_many_dads add column test boolean;
update how_many_dads
set test = exists(select * from how_many_sons where how_many_sons.influencer_name = how_many_dads.follower_name);