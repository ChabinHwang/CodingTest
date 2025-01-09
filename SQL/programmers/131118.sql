SELECT info.REST_ID
, info.REST_NAME
, info.FOOD_TYPE
, info.FAVORITES
, info.ADDRESS
, ROUND(sub.SCORE,2) AS SCORE
FROM REST_INFO info
INNER JOIN (
        SELECT REST_ID
            , AVG(REVIEW_SCORE) AS SCORE
        FROM REST_REVIEW
        GROUP BY REST_ID
    ) sub
    ON info.REST_ID = sub.REST_ID
WHERE info.ADDRESS LIKE '서울%'
ORDER BY sub.SCORE DESC
        , info.FAVORITES DESC;