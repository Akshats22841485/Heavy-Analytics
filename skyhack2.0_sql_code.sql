-- query to find agent_id vs AST(Average Speed to Answer) 
select agent_id , avg(extract(minute from agent_assign_delay))as avg_assign_time from callsbbc
group by agent_id
order by avg_assign_time desc;

-- query to find agent_id vs AHT(average handling time)
select agent_id , avg(extract(minute from agent_time_taken))as avg_time_taken from callsbbc
group by agent_id
order by avg_time_taken desc;

-- query to find call_reason vs AHT(average handling time)
select r.primary_call_reason2,avg(extract(minute from c.agent_time_taken))as avg_time_taken from callsbbc c
join reason r on c.call_id = r.call_id
group by r.primary_call_reason2
order by avg_time_taken desc;


-- query to find tone used by agent vs AHT(average handling time)
select s.agent_tone, avg(extract(minute from c.agent_time_taken))as avg_time_taken from callsbbc c
join sentiment_statistics s on c.call_id = s.call_id
group by s.agent_tone
order by avg_time_taken desc
limit  5;

-- query to find tone used by customer vs AHT(average handling time)
select s.customer_tone, avg(extract(minute from c.agent_time_taken))as avg_time_taken from callsbbc c
join sentiment_statistics s on c.call_id = s.call_id
group by s.customer_tone
order by avg_time_taken desc;


-- query to find the top 10 agents who had angry or frustated tone
select agent_id, count(agent_tone) from sentiment_statistics
where agent_tone='angry' or agent_tone= 'frustrated'
group by agent_id
order by count(agent_tone) desc
limit 10;


-- query to find the most frequent reasons to call 
select Primary_call_reason2 as imp_reason,count(call_id) from reason
group by imp_reason
order by count(call_id) desc












