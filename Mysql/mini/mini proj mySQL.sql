use ipl;
-- 1

select a.BIDDER_ID,a.Won,a.wincoun,b.Lost,b.lostcoun,a.wincoun*100/(a.wincoun+ b.lostcoun) win_percentage 
from 
(select brd.BIDDER_ID,bdd.BID_STATUS Won,count(bdd.BID_STATUS) wincoun from ipl_bidder_details brd left join  ipl_user u  on u.USER_ID = brd.USER_ID
left join ipl_bidding_details bdd on brd.BIDDER_ID = bdd.BIDDER_ID and bdd.BID_STATUS = 'Won' 
left join ipl_bidder_points bp on bp.BIDDER_ID = brd.BIDDER_ID
group by brd.BIDDER_ID,bdd.BID_STATUS
order by brd.BIDDER_ID,bdd.BID_STATUS desc) a,
(select brd.BIDDER_ID,bdd.BID_STATUS Lost,count(bdd.BID_STATUS) lostcoun from ipl_bidder_details brd left join  ipl_user u  on u.USER_ID = brd.USER_ID
left join ipl_bidding_details bdd on brd.BIDDER_ID = bdd.BIDDER_ID and bdd.BID_STATUS = 'Lost' 
left join ipl_bidder_points bp on bp.BIDDER_ID = brd.BIDDER_ID
group by brd.BIDDER_ID,bdd.BID_STATUS
order by brd.BIDDER_ID,bdd.BID_STATUS desc) b
where a.BIDDER_ID = b.BIDDER_ID
order by 6 desc,3 desc ;

-- 2

select a.* from 
(select BID_TEAM,TEAM_NAME,count(BID_TEAM) bid_count,rank() OVER (ORDER BY count(BID_TEAM) DESC) AS rnk from ipl_bidding_details ibd 
join ipl_team it on it.TEAM_ID = ibd.BID_TEAM and ibd.BID_STATUS !='Cancelled' 
group by BID_TEAM)a
where rnk in (1,8);

-- 3



-- 3.	In a given stadium, what is the percentage of wins by a team which had won the toss?
select b.STADIUM_ID,b.STADIUM_NAME,sum(toss_wins)*100/sum(length(b.STADIUM_ID)) from (
select a.STADIUM_ID,a.STADIUM_NAME,a.TEAM_ID1,a.TEAM_ID2,a.Toss_winner,a.match_winner,length(STADIUM_ID),
case when a.Toss_winner =a.match_winner then 1
else 0
end toss_wins
 from 
(select stad.STADIUM_ID ,stad.STADIUM_NAME,Mat.TEAM_ID1,Mat.TEAM_ID2,
case
when Mat.TOSS_WINNER =1 then Mat.TEAM_ID1
when Mat.TOSS_WINNER =2 then Mat.TEAM_ID2
end Toss_winner,
case
when Mat.MATCH_WINNER =1 then Mat.TEAM_ID1
when Mat.MATCH_WINNER =2 then Mat.TEAM_ID2
end match_winner,count(Toss_winner)
 from IPL_Stadium stad 
join IPL_Match_Schedule matchsced on stad.STADIUM_ID = matchsced.STADIUM_ID and matchsced.STATUS ='Completed' -- and stad.STADIUM_ID =2
join IPL_Match Mat on Mat.match_id = matchsced.match_id
group by 1,5
order by 1,6) a
group by 1,5,7) b
group by 1;

-- 4 	What is the total no. of bids placed on the team that has won highest no. of matches?
select BID_TEAM,count(BID_TEAM) 'Total no of bids',c.max_wins 'Total no of matches won'  from ipl_bidding_details b1
join 
(select * from 
(select match_winner,count(MATCH_ID) 'max_wins',rank() OVER (ORDER BY count(MATCH_ID) DESC) AS rnk from (
select MATCH_ID,TEAM_ID1,TEAM_ID2,
case
when MATCH_WINNER =1 then TEAM_ID1
when MATCH_WINNER =2 then TEAM_ID2
end match_winner 
from IPL_Match) a join  ipl_team it on it.TEAM_ID = a.match_winner
group by a.match_winner)b
where rnk =1)c  
where b1.BID_TEAM = c.match_winner  group by BID_TEAM;

--

select * from ipl_user;
select * from ipl_bidder_details;
select * from ipl_bidding_details;
select * from ipl_bidder_points;
select * from ipl_team;
select * from IPL_Match;
select * from IPL_Match_Schedule;
select * from IPL_Stadium;