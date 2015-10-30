Project Concept: Monthly Challenges

-Create a monthly challenge and populate it with check-ins,
-Users can subscribe to your check-in stream (adds discipline/pressure to maintain commitment)
-View other user's monthly challenges
-Subscribe to other user's challenges

model props and relationships

user
  -current challenge id?
  -has_many challenges

challenge
  -belongs_to user
  -has_many categories
  -has_many updates

category
  -has_many challenges

update
  -belongs_to challenge
