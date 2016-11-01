 user signs in for the first time, 
 confirm your email
 gets welcome email
 confirms weekly subscription in email

 user signs in second time
 see list of event/artists/subscription status/change location/user info


 ---
 background jobs:
 1. grab spotify artists for the first time
 2. update spotify artists
 3. send welcome email
 4. send subscription email
 5. grab events


 First login:
 153

 Second login:
 0

 If confirmation:
 weekly-254

 Within another job should you call `perform_later` or `perform_now`?
 ---

 CONFIRMATION
 if user.subscribed? email_weekly