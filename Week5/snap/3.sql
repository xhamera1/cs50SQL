SELECT messages.to_user_id FROM messages
    WHERE messages.from_user_id IN (
        SELECT id FROM users WHERE username='creativewisdom377')
    GROUP BY messages.to_user_id
    ORDER BY COUNT(messages.to_user_id) DESC
    LIMIT 3;

