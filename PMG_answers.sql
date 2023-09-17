select date(date) as day, sum(impressions) as total_impressions
From marketing_performance
Group by day
order by day;

select state, sum(revenue) as total_revenue 
from website_revenue
group by state
order by total_revenue desc
limit 3;

select c.name as campaign_name, sum(mp.cost) as total_cost, sum(mp.impressions) as total_impressions, sum(mp.clicks) as total_clicks, sum(wr.revenue) as total_revenue
from marketing_performance mp
join campaign_info c on mp.campaign_id = c.id
join website_revenue wr on mp.campaign_id = wr.campaign_id
group by c.name;

select wr.state, SUM(mp.conversions) as total_conversions
from marketing_performance mp
join website_revenue wr on mp.campaign_id = wr.campaign_id
join campaign_info ci on mp.campaign_id = ci.id
where ci.name = 'Campaign5'
group by wr.state
order by total_conversions desc
limit 1;

# in my opinion, The most efficient campaign is 64441550. I arrived at this decision by calculating the return on investment, the revenue generated was 294 and it cost 107.86 which when compared to other campaigns shows that it is generating more revenue with less cost when compared to the other campaigns. 

select dayname(date) as day_of_week, avg(clicks) as avg_clicks
from marketing_performance
group by day_of_week
order by avg_clicks DESC
limit 1;
