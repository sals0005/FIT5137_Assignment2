
LOAD CSV WITH HEADERS FROM "file:///host.csv"
AS row
WITH row WHERE row.host_id IS NOT NULL
MERGE (h:Hosts {hostId: row.host_id})
ON CREATE SET h.hostUrl = row.host_url, h.hostName = row.host_name, h.hostVerifications = apoc.convert.fromJsonList(row.host_verifications), h.hostSince = apoc.date.parse(row.host_since, 'ms','yyyy-MM-dd'), h.hostLocation = row.host_location, h.hostResponseTime = row.host_response_time, h.hostIsSuperhost =(case row.host_is_superhost when 't' then true else false end);


LOAD CSV WITH HEADERS FROM "file:///listing.csv"
AS row
WITH row WHERE row.id IS NOT NULL
MERGE (l:Listing {listingId: row.id})
ON CREATE SET l.name = row.name, l.summary = row.summary, l.listingUrl = row.listing_url, l.pictureUrl = row.picture_url, l.hostId = row.host_id, l.neighbourhood = row.neighbourhood, l.street = row.street,  l.zipcode = toInteger(row.zipcode), l.latitude = toFloat(row.latitude), l.longitude =toFloat(row.longitude), l.roomType = row.room_type, l.price= toFloat(row.price), l.extraPeople = toFloat(substring(row.extra_people,1)), l.minimumNights = toInteger(row.minimum_nights), l.calculatedHostListingsCount = toInteger(row.calculated_host_listings_count), l.availability365 = toInteger(row.availability_365);

CREATE CONSTRAINT ON (a:Amenity) ASSERT a.name IS UNIQUE;


LOAD CSV WITH HEADERS FROM "file:///listing.csv" AS row
WITH row WHERE row.id IS NOT NULL
MATCH (l:Listing {listingId: row.id})
WITH l, split(replace(replace(replace(row.amenities, "{", ""), "}", ""), "\"", ""), ",") AS amenities
UNWIND amenities AS amenity
MERGE (a:Amenity {name: amenity})
MERGE (l)-[:HAS]->(a);


MATCH (l:Listing), (h:Hosts) 
WHERE EXISTS (l.hostId) AND l.hostId=h.hostId 
MERGE (h)-[:HOSTS]->(l);



LOAD CSV WITH HEADERS FROM "file:///review.csv" AS row
WITH row WHERE row.id IS NOT NULL
MERGE (r:Review {id: row.id})
ON CREATE SET r.date =apoc.date.parse(row.date,’ms’,'yyyy-MM-dd'),
    r.comments = row.comments, r.listingId = row.listing_id;


LOAD CSV WITH HEADERS FROM "file:///review.csv" AS
row
MATCH (r:Review {id: row.id})
MATCH (l:Listing {listingId: row.listing_id})
CREATE (r)-[:REVIEWS{reviewScoresRating:toInteger(row.review_scores_rating)}]->(l);


CREATE CONSTRAINT ON (rv:Reviewer) ASSERT rv.reviewerId IS UNIQUE;


LOAD CSV WITH HEADERS FROM "file:///review.csv" AS row
WITH row WHERE row.id IS NOT NULL
MATCH (r:Review {id: row.id})
MERGE (rv:Reviewer {reviewerId:row.reviewer_id})
SET rv.reviewerName = row.reviewer_name
MERGE (rv)-[:POST]->(r)
