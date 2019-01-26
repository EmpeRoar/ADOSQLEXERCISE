WITH <CTE_name>
AS
(
  <inner_query>
)
<outer_query>

--------------------

WITH C1 AS
(
    SELECT ...
    FROM T1
    WHERE ...
),
C2 AS
(
    SELECT 
    FROM C1
    WHERE ...
)
SELECT ...
FROM C2
WHERE ...;


-----------------------------


WITH C AS
(
    SELECT ... 
    FROM T1
)
SELECT ...
FROM C AS C1
  INNER JOIN C AS C2
     ON ...;

--------------------------------     
