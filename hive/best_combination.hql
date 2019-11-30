select *, count(*) as count
from (select event_mode, event_map, 
		  case when player1 < player2 and player1 < player3 then
			   (case when player2 < player3 then concat(player1, ',', player2, ',', player3)
					when player3 < player2 then concat(player1, ',', player3, ',', player2)
			   end)
			   when player2 < player1 and player2 < player3 then
			   (case when player1 < player3 then concat(player2, ',', player1, ',', player3)
					when player3 < player1 then concat(player2, ',', player3, ',', player1)
			   end)
			   when player3 < player1 and player3 < player2 then
			   (case when player1 < player2 then concat(player3, ',', player1, ',', player2)
					when player2 < player1 then concat(player3, ',', player2, ',', player1)
		 	   end)
	 	  end as pick
		  from win) as t1
group by event_mode, event_map, pick
order by count desc;
