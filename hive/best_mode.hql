select event_mode, count(event_mode) as mode_count
from battlelog
group by event_mode
order by mode_count desc;