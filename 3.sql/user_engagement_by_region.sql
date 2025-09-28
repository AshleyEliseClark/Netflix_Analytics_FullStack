SELECT 
    u.region,
    COUNT(DISTINCT v.user_id) AS active_users,
    SUM(v.watch_duration_min) AS total_watch_time
FROM 
    "View History" v
JOIN 
    "Users" u ON v.user_id = u.user_id
GROUP BY 
    u.region
ORDER BY 
    total_watch_time DESC;
