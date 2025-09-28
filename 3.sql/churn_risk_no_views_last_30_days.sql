SELECT 
    u.user_id,
    u.region,
    u.signup_date
FROM 
    "Users" u
LEFT JOIN (
    SELECT DISTINCT user_id
    FROM "View History"
    WHERE watch_date >= CURRENT_DATE - INTERVAL '30 days'
) recent_views ON u.user_id = recent_views.user_id
WHERE 
    recent_views.user_id IS NULL;
