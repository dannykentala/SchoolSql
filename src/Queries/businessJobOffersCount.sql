DROP FUNCTION businessjobofferscount;
CREATE OR REPLACE FUNCTION businessJobOffersCount(
  vfilters JSONB
)
  RETURNS TABLE (
    businessid INT,
    jobOfferCounter BIGINT,
    businessName VARCHAR
  )
LANGUAGE plpgsql
AS $$
DECLARE
  vbusinessid INT := (vfilters->>'businessId')::INT;
BEGIN
  RETURN QUERY
    SELECT
      jof.businessid,
      count(jof.businessid) AS counter,
      b.name AS businessName
    FROM joboffers jof
      LEFT JOIN businesses b
        ON jof.businessid = b.id
    WHERE
      (vbusinessid IS NULL OR jof.businessid = vbusinessid)
    GROUP BY
      jof.businessid,
      b.name
    ORDER BY
      counter DESC;
END;
$$;

SELECT * FROM businessjobofferscount(
  '{
    "businessId": null
  }'::JSONB);