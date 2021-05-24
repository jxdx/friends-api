### How long did this assignment take?
> I spent 4 or 5 hours over 2 days

### What was the hardest part?
> I didn't find this very difficult, I have built dozens of API's however,
I haven't built a new API recently so it was good practise to setup a Rails
API from scratch. Some of the decisions you make at the early stages can last the lifetime of an app so it's important to think about them properly. Things like render methods, user authentication, and testing approaches.

### Did you learn anything new?
> Normally I use controller tests but this time I decided to use request tests.
I also usually put JWT methods in the application_controller but I decided to separate this into a AuthorizeApiRequest which isn't something I've done before.

### Is there anything you would have liked to implement but didn't have the time to?
> I would have used Rails 6 but I haven't had a chance to play with it yet so due to time constraints I decided to use 5.2.4.6. I also would have liked to use a JSON serializer gem. I am a fan of the JSONAPI.org standards `https://jsonapi.org/format/` and the `jsonapi-serializer` gem but for this test I decided to write my own serialized responses.

### What are the security holes (if any) in your system? If there are any, how would you fix them?
> I tried to make this app as secure as possible. All routes are wrapped with token based authentication except when signing up.

### Do you feel that your skills were well tested?
> No, the decisions you make when setting up a new API are very important but they aren't difficult.
Also, creating a friendship model wasn't difficult.

### Notes:
> I tried to follow the instructions exactly as specified. The only change I made was to the friendships POST endpoint.
The instructions asked to create an endpoint that responds to `/users/:email/friendship` but it felt weird to me to have and email address in the URL. I decided to create an endpoint that responds to `/friendships` and accepts email as a param instead.