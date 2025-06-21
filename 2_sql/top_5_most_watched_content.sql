SELECT 
    c.title,
    SUM(v."watch_duration_min") AS total_watch_time
FROM 
    "View History" v
JOIN 
    "Content" c ON v."content_id" = c."content_id"
GROUP BY 
    c.title
ORDER BY 
    total_watch_time DESC
LIMIT 5;
