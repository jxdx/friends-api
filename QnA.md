### How long did this assignment take?
> I spent ~6 to 8 hours over multiple days

### What was the hardest part?
> Managing all the different friendships was harder than I expected.
I created a FriendshipService class with an error handler to make this as clean as possible.
I also don't normally use request tests but I tried them for this assignement, request specs
drive behavior through the full stack, including routing. However, it doesn't allow you
to use let in context blocks as controller tests do. If I was to do this again I would
have used controller tests instead.

### Did you learn anything new?
> I learned to use request specs. I have created APIs several times but it was fun to go over everything
again from scratch.

### Is there anything you would have liked to implement but didn't have the time to?
> I would have used Rails 6 but I haven't had a chance to play with it yet so due to time constraints I decided to use 5.2.4.6. I also would have liked to use a JSON serializer gem. I am a fan of the JSONAPI.org standards `https://jsonapi.org/format/` and the `jsonapi-serializer` gem but for this test I decided to write my own serialized responses.

### What are the security holes (if any) in your system? If there are any, how would you fix them?
> I tried to make this app as secure as possible. All routes are wrapped with token based authentication except when signing up. I was careful to avoid sql injection and all params are validated before being used anywhere in the code.

### Do you feel that your skills were well tested?
> This was a real lesson in being thorough, I mistakenly missed a lot of the friendship functionality, namely, only allowing one friendship between 2 users and not being able to add yourself. I read the instructions quickly and though to myself this seems way too easy. I should have trusted my gut and been more complete.  

### Notes:
> I made a change to the friendships POST endpoint.
The instructions asked to create an endpoint that responds to `/users/:email/friendship` but it felt weird to me to have and email address in the URL. I decided to create an endpoint that responds to `/friendships` and accepts email as a param instead.