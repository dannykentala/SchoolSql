DROP FUNCTION businessharingcount;
CREATE OR REPLACE FUNCTION businessHaringCount(
  vfilters JSONB
)
  RETURNS TABLE (
    businessid INT,
    haringCount BIGINT,
    businessName VARCHAR
  )
LANGUAGE plpgsql
AS $$
DECLARE
  vbusinessid INT := (vfilters->>'businessId')::INT;
  vapplicationStatus VARCHAR := (vfilters->>'applicationStatus')::VARCHAR;
BEGIN
  RETURN QUERY
    SELECT
      jof.businessid,
      count(aps.id),
      jad.company
    FROM jobapplication_statuses jas
      LEFT JOIN jobapplications ja
        ON jas.jobapplicationid = ja.id
          LEFT JOIN joboffers jof
            ON ja.jobofferid = jof.id
      LEFT JOIN jobapplicationsdetails jad
        ON jas.jobapplicationid = jad.id
      LEFT JOIN applicationstatuses aps
        ON jas.applicationstatusid = aps.id
    WHERE 
      (vbusinessid IS NULL OR jof.businessid = vbusinessid)
      AND (vapplicationStatus IS NULL OR aps.name = vapplicationStatus)
    GROUP BY
      jof.businessid,
      jad.company;
END;
$$;

SELECT * FROM businessharingcount(
  '{
    "businessId": null,
    "applicationStatus": "hired"
  }'::JSONB);