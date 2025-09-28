SELECT 
    signup_date,
    COUNT(*) AS user_count
FROM 
    "Users"
GROUP BY 
    signup_date
ORDER BY 
    signup_date;
