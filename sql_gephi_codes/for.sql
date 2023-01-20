use artists;
SET SQL_SAFE_UPDATES = 0;

select* from how_many_dads;
select* from dads_sons;
select* from fivecos;
select* from edges;

select count(1) from cossimilarity2;


-- alter table how_many_dads add column test boolean;
-- update how_many_dads
-- set test = exists(select * from how_many_sons where how_many_sons.influencer_name = how_many_dads.follower_name);

alter table fivecos add column AtoB boolean;
alter table fivecos add column BtoA boolean;

select* from fivecos where AtoB = 1 or BtoA = 1;

update fivecos
set AtoB = exists(select * from edges e
	where e.influencer = fivecos.Aid and e.follower = fivecos.Bid);
    
update fivecos
set BtoA = exists(select * from edges e
	where e.influencer = fivecos.Bid and e.follower = fivecos.Aid);
    
select e.influencer, e.follower, s.similarity from edges e
inner join cossimilarity2 s on (s.Aid=e.influencer)
where (s.Bid=e.follower)
union
select e.influencer, e.follower, s.similarity from edges e
inner join cossimilarity2 s on (s.Bid=e.influencer)
where (s.Aid=e.follower)
union 
select e.influencer, e.follower, s.similarity from edges e
inner join cosa s on (s.Aid=e.influencer)
where (s.Bid=e.follower)
union 
select e.influencer, e.follower, s.similarity from edges e
inner join cosa s on (s.Bid=e.influencer)
where (s.Aid=e.follower);

select * from cofluence where influencer_name = "Wolfgang Amadeus Mozart";

select count(*) from data_by_artist where  
(artist_name in (select artist_name from data_by_artist group by artist_name having count(artist_name)>1))
order by artist_name;

select * from artist_identity where  
(name in (select name from artist_identity group by name having count(name)>1))
order by name;