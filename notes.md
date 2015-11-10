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
  <!-- -has_many categories -->
  -has_many updates

<!-- category
  -has_many challenges -->

update
  -belongs_to challenge


Features:

  <!-- I want to be able to add an update to a challenge with text body -->
  <!-- I want to be able to add an update to a challenge with images -->
  I want to be able to add an update to a challenge with other media?

  I want to subscribe to other's challenges

  I want to be notified (via email) if I haven't checked in (in 3 days?)

  I want all images I upload to be stored in the cloud (carrierwave with S3?)

  I want to be able to check in/send update from Instagram

  I want to be able to search challenges by category

  I want to see a condensed, paginated listing of updates for a challenge

APIs

Mailchimp - send mails on
AWS S3
Instagram
