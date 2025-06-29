SELECT 
    c.title,
    ROUND(SUM(v.watch_duration_min) / (COUNT(v.log_id) * c.duration_min) * 100, 2) AS avg_completion_rate_pct
FROM 
    "View History" v
JOIN 
    "Content" c ON v.content_id = c.content_id
GROUP BY 
    c.title, c.duration_min
ORDER BY 
    avg_completion_rate_pct DESC;
