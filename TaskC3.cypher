CREATE (l:Listing {listingId: "455543", listingName: "The loft, Villa Maria Circa 1890", summary: "*Villa Maria Beaconsfield Circa 1890 This charming old homestead and country chapel, 100 metres from the Old Princess Hwy (train station 13 min walk, Monash Fwy close by) is ideally located on the gateway to Gippsland. This open aired apartment is craftsman built, detailed and has architectural shaped ceilings. A beautiful relaxing space, which has its own parking, private entry foyer and is locked separately form the main house. Situated on a rise, in a quiet court with open undulating views.", listingUrl:"https://www.airbnb.com.au/rooms/35546338?source_impression_id=p3_1571800887_mShQQ8gVMW8%2FwnEV", listingPictureUrl: "https://a0.muscache.com/im/pictures/2b79afba-bef1-4cea-af17-dbc21ffa75c5.jpg?aki_policy=xx_large", hostId: "164193", neighbourhood: "Beaconsfield", street: " Beaconsfield, Victoria, Australia", zipcode: 3807, latitude: -38.040713, longitude: 145.378137, roomType: "Entire home", price: 120.00, extraPeople: 0.00, minimumNights: 1, calculatedHostListingsCount: 4, availability365: 20});


MATCH (l:Listing),(a:Amenity)
WHERE l.listingId="455543" AND a.name="Heating"
CREATE (l)-[:HAS]-> (a);

MATCH(l:Listing),(a:Amenity)
WHERE l.listingId="455543" AND a.name="Hot water"
CREATE(l)-[h:HAS]->(a);


MATCH (l:Listing), (a:Amenity)
WHERE l.listingId = '455543' AND a.name = 'TV'
CREATE (l) -[:HAS]-> (a);


MATCH (l:Listing), (a:Amenity)
WHERE l.listingId = '455543' AND a.name = 'Air conditioning'
CREATE (l) -[:HAS]-> (a);

CREATE (h:Hosts {hostId: "55343", hostUrl: "https://www.airbnb.com.au/users/show/267444171", hostName: "Marc", hostVerifications: apoc.convert.fromJsonList("['email', 'phone', 'selfie', 'government_id']"), hostSince: apoc.date.parse("2019-06-21", 'ms','yyyy-MM-dd'), hostLocation: "Beaconsfield, Victoria, Australia", hostResponseTime: "within an hour", hostIsSuperhost: true});

MATCH (h:Hosts), (l:Listing)
WHERE l.listingId = '455543' AND h.hostId = '55343'
CREATE (h) -[:HOSTS]-> (l);
Creating Review:

CREATE (r:Review {id: "5344", listingId: "455543", date: apoc.date.parse("2019-10-10", 'ms','yyyy-MM-dd'), comments: "Beautifully built loft. Was perfectly cleaned and presented and had everything I needed. Easy access to wifi and a great check in/out experience. Can't wait to stay there again the next time I am in town."});

MATCH (l:Listing), (r:Review)
WHERE l.listingId = '455543' AND r.id = '5344'
CREATE (r) -[rv:REVIEWS{reviewScoresRating:87}]-> (l);

CREATE (rvr:Reviewer {reviewerId: "322", reviewerName: “Emma"});

MATCH (rv:Reviewer), (r:Review)
WHERE rv.reviewerId = '322' AND r.id = '5344'
CREATE (rv) -[:POSTS]-> (r);


CREATE (l:Listing {listingId: "43321", listingName: "Two private rooms in a Luxury newly built home", summary: "Guess Access - Two private rooms one with double bed & one with queen bed. Open plan living with separate toilet and bathroom and nice backyard and specious alfresco area with BBQ. House is in Berwick waters estate. Ten minutes drive to restaurants and train station.", listingUrl:"https://www.airbnb.com.au/rooms/29543258?source_impression_id=p3_1571815727_3GVkQEjmNmeO%2FMak", listingPictureUrl: "https://a0.muscache.com/im/pictures/d8e10ee6-0303-42ed-b2d5-981fbd94cc71.jpg?aki_policy=xx_large", hostId: "3221", neighbourhood: "Clyde North", street: " Clyde North, Victoria, Australia", zipcode: 3978, latitude: -38.140030, longitude: 145.340133, roomType: "Private room", price: 75.00, extraPeople: 0.00, minimumNights: 1, calculatedHostListingsCount: 2, availability365: 100});


MATCH (l:Listing),(a:Amenity)
WHERE l.listingId="455543" AND a.name="TV"
CREATE (l)-[:HAS]-> (a);

MATCH(l:Listing),(a:Amenity)
WHERE l.listingId="455543" AND a.name="Hot water"
CREATE(l)-[h:HAS]->(a);

MATCH (l:Listing), (a:Amenity)
WHERE l.listingId = '455543' AND a.name = 'Air conditioning'
CREATE (l) -[:HAS]-> (a);

MATCH (l:Listing), (a:Amenity)
WHERE l.listingId = '455543' AND a.name = 'Essentials'
CREATE (l) -[:HAS]-> (a);

CREATE (h:Hosts {hostId: "3221", hostUrl: "https://www.airbnb.com.au/users/show/222451313", hostName: "Chamika", hostVerifications: apoc.convert.fromJsonList("['email', 'phone']"), hostSince: apoc.date.parse("2018-10-21", 'ms','yyyy-MM-dd'), hostLocation: "Clyde North, Victoria, Australia", hostResponseTime: "within an hour", hostIsSuperhost: false});

MATCH (h:Hosts), (l:Listing)
WHERE l.listingId = '43321' AND h.hostId = '3221'
CREATE (h) -[:HOSTS]-> (l);

CREATE (r:Review {id: "3321", listingId: "43321", date: apoc.date.parse("2019-05-10", 'ms','yyyy-MM-dd'), comments: "My stay with Chamika was very comfortable and relaxing after a day of work. Thank you for have us Chamika."});

MATCH (l:Listing), (r:Review)
WHERE l.listingId = '43321' AND r.id = '3321'
CREATE (r) -[rv:REVIEWS{reviewScoresRating:90}]-> (l);

CREATE (rvr:Reviewer {reviewerId: "112", reviewerName: “Gavin"});

CREATE (rvr:Reviewer {reviewerId: "112", reviewerName: “Gavin"});


MATCH (rv:Reviewer), (r:Review)
WHERE rv.reviewerId = '112' AND r.id = '3321'
CREATE (rv) -[:POSTS]-> (r);

CREATE (l:Listing {listingId: "1244", listingName: "The Seaside Cottage - Heritage protected property", summary: "Come and enjoy the beautiful Tooradin seaside village in a heritage listed fisherman’s cottage (circa 1880s) On a cold winters day, enjoy the ambiance and warmth of the wood fire. This cottage provides modern amenities while still allowing you to enjoy the charm of yesteryear. Walking distance to all cafes, restaurant and shops, and is across the road from the modern playground, BBQ facilities and foreshore.", listingUrl:"//www.airbnb.com.au/rooms/31338740?source_impression_id=p3_1571816549_5brtndVBxxsXV2X2", listingPictureUrl: "https://a0.muscache.com/im/pictures/cdfa9c87-b9f3-474b-9539-639b3f2f6c95.jpg?aki_policy=xx_large", hostId: "12456", neighbourhood: "Tooradin",  street: " Tooradin, Victoria, Australia", zipcode: 3980, latitude: -38.142998, longitude: 145.353181, roomType: "Entire home", price: 150.00, extraPeople: 0.00, minimumNights: 1, calculatedHostListingsCount: 11, availability365: 270});

MATCH (l:Listing),(a:Amenity)
WHERE l.listingId="1244" AND a.name="Kitchen"
CREATE (l)-[:HAS]-> (a);

MATCH(l:Listing),(a:Amenity)
WHERE l.listingId="455543" AND a.name="wifi"
CREATE(l)-[h:HAS]->(a);

CREATE (h:Hosts {hostId: "12456", hostUrl:"//www.airbnb.com.au/users/show/234622522", hostName: "Marg", hostVerifications: apoc.convert.fromJsonList("['email', 'phone']"), hostSince: apoc.date.parse("2019-01-12", 'ms','yyyy-MM-dd'), hostLocation: "Tooradin, Victoria, Australia", hostResponseTime: "within an hour", hostIsSuperhost: true});


MATCH (h:Hosts), (l:Listing)
WHERE l.listingId = '1244' AND h.hostId = '12456'
CREATE (h) -[:HOSTS]-> (l);


CREATE (r:Review {id: "3567", listingId: "1244", date: apoc.date.parse("2018-05-10", 'ms','yyyy-MM-dd'), comments: "Lovely cottage with everything we needed. Very clean and comfortable, only wish we were able to spend more time there. Would stay there again for sure."});


MATCH (l:Listing), (r:Review)
WHERE l.listingId = '1244' AND r.id = '544'
CREATE (r) -[rv:REVIEWS{reviewScoresRating:80}]-> (l);



MATCH (l:Listing), (r:Review)
WHERE l.listingId = '1244' AND r.id = '3567'
CREATE (r) -[rv:REVIEWS{reviewScoresRating:90}]-> (l);


CREATE (rvr:Reviewer {reviewerId: "142", reviewerName: “Susan"});

MATCH (rv:Reviewer), (r:Review)
WHERE rv.reviewerId = '142' AND r.id = '3567'
CREATE (rv) -[:POSTS]-> (r);





match (h:Hosts) where h.hostSince> apoc.date.parse('2009-00-00','ms','yyyy-MM-dd' ) AND h.hostSince < apoc.date.parse('2010-00-0','ms','yyyy-MM-dd') AND not "facebook" in h.hostVerifications SET h.hostVerifications= h.hostVerifications +"facebook" return h.hostName as hostName,h.hostVerifications as hostVerifications ,apoc.date.format(h.hostSince,'ms','yyyy-MM-dd') as date;


match (h:Hosts) WHERE h.hostResponseTime='within an hour' SET h.hostIsSuperhost = true return h.hostResponseTime as hostResponseTime , h.hostIsSuperhost as hostIsSuperhost;


match (h:Hosts)--(l:Listing) Match (r:Review)-[:REVIEWS]->(l) where r.date <apoc.date.parse(‘2017-00-00','ms','yyyy-MM-dd') SET h.active=(case h.active when 't' then true else false end) 
return DISTINCT h.hostId as hostId,h.active as active;



match (l:Listing) WHERE NOT ()-[:REVIEWS]->(l) AND l.availability365=0 return l.name as name;
match (l:Listing) WHERE NOT ()-[:REVIEW]->(l) AND l.availability365=0 DETACH DELETE l;
