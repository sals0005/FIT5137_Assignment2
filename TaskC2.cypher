MATCH (r :Review) – [re :REVIEWS] -> (l:Listing) WHERE l.name CONTAINS('Sunny 1950s Apartment, St Kilda East') RETURN count(r) As numberOfReviews;


MATCH (r:Review)–[re:REVIEWS]->(l:Listing) WHERE l.neighbourhood='Port Phillip' RETURN r as review, l.neighbourhood as location;


MATCH(r:Review) -[re:REVIEWS]->(l:Listing), (rev:Reviewer)-- (r:Review) WHERE (rev.reviewerId ='317848') AND (rev.reviewerId<>'4162110') AND (re.reviewScoresRating>=90) RETURN l.name as accommodations;


MATCH (l:Listing) -[r:HAS]-> (a:Amenity) WHERE NOT exists((l)-[:HAS]->(:Amenity {name:'Wifi'})) RETURN DISTINCT l.name as Name, l.neighbourhood as Location;


MATCH (rv:Reviewer) -[p:POST]-> (r:Review) RETURN rv.reviewerName as reviewerName, count(*) as numberOfReviews ORDER by numberOfReviews DESC;


MATCH (l1:Listing) -[:HAS]-> (a:Amenity) <-[:HAS]- (l2:Listing)
WHERE id(l1) < id(l2)
WITH l1, l2, collect(a) as commonAmenities
WHERE size(commonAmenities) > 3
RETURN l1 as listingOne, l2 as listingTwo, commonAmenities;


match (l:Listing) WHERE NOT exists((l:Listing)--(:Review)) return l.name as listingName;


match (h:Hosts)-[:HOSTS]-> (l:Listing) with h,count(l) as cnt, collect(l.name) as AccomedationName,collect(l.price) as Price WHERE cnt > 1 Return h.hostName as hostName, AccomedationName,Price;


Match (l:Listing) WHERE l.neighbourhood='Melbourne' return avg(l.price) as averagePrice;


Match (l:Listing)-- (h:Hosts) return h.hostName as hostName,l.neighbourhood as location,l.name as accommodations ORDER BY l.price DESC LIMIT 5;


Match (r:Review)-[rv:REVIEWS]->(l:Listing) Where r.date > apoc.date.parse('2017-00-00','ms','yyyy-MM-dd' ) AND r.date < apoc.date.parse('2018-00-00','ms','yyyy-MM-dd') Return count(DISTINCT l.name) as numberOfReviewes;


MATCH (r:Review)-[rv:REVIEWS]->(l:Listing) with l.neighbourhood as location ,avg(rv.reviewScoresRating) as avg return location ORDER BY avg DESC LIMIT 10;


match(h:Hosts)--(l:Listing) WITH l,h.hostName as hostName, h.hostLocation as location, h.hostLocation CONTAINS l.neighbourhood as neg where neg= false return DISTINCT hostName,hostLocation,l.name as accommodationName ,l.neighbourhood as accommodationLocation;


Match (l:Listing) with l, (2*l.extraPeople) as extraPeoplePrice, (l.price+l.extraPeople*2)*5 as totoalPrice return l.name as name ,l.neighbourhood as Location ,l.price as price, extraPeoplePrice,totoalPrice ORDER BY totoalPrice;


MATCH (l:Listing),(ls:Listing) WHERE l<>ls RETURN distance(point({latitude: l.latitude, longitude: l.longitude}), point({latitude: ls.latitude, longitude: ls.longitude})) / 1000.0 as distance,l as listingOne,ls as listingTwo ORDER BY distance ASC LIMIT 10;


MATCH (l:Listing) -[r:HAS]-> (a:Amenity) WHERE exists((l)-[:HAS]->(:Amenity {name:'Free parking on premises'})) AND l.roomType='Entire home/apt' AND l.price<100 RETURN DISTINCT l.name as accommodation, l.price as price;


MATCH (h:Hosts) Where size(h.hostVerifications)>3 return h.hostName as hostName, h.hostVerifications as hostVerifications ORDER BY size(hostVerifications);


MATCH (h:Hosts)--(l:Listing) Where h.hostResponseTime='within an hour' AND l.extraPeople=0 return l.name as accommodation,l.neighbourhood as location;


match (r:Review)-[rv:REVIEWS]->(l:Listing) where l.neighbourhood='Yarra Ranges' AND (rv.reviewScoresRating>=85) return l.name as accommodation,rv.reviewScoresRating as reviewScoresRating ,r.comments as comments ORDER BY accommodation,reviewScoresRating DESC;


match (r:Review)-[rv:REVIEWS]->(l:Listing) where l.name='Northcote, A Classic in Melbourne' AND rv.reviewScoresRating IS NOT NULL return l.name as accommodation, rv.reviewScoresRating as reviewScoresRating, apoc.date.format(r.date,'ms','yyyy-MM-dd' ) as reviewDate order by reviewDate DESC LIMIT 10;


CREATE INDEX ON :Listing(neighbourhood);
CREATE INDEX ON :Listing(neighbourhood,name);
CREATE INDEX ON :Hosts(hostName,hostLocation);
