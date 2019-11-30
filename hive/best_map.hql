select event_mode, event_map, count(event_map) as count
from battlelog
group by event_mode, event_map
order by count desc;