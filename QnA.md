### How long did this assignment take?
> I spent 4 or 5 hours over 2 days

### What was the hardest part?
> I didn't find this very difficult, I have built dozens and dozens of API's however,
I hadn't build a new API recently so it was good practise to go back and remember how to setup a Rails
API from scratch. Some of the decisions you make at this stage can last the lifetime of an app so it's important to think about them. Things like render methods, user authentication, testing approach.

### Did you learn anything new?
> I usually use controller tests and this time I decided to use request tests.
I also usually put JWT methods either in the application_controller but I decided to separate this into a AuthorizeApiRequest which isn't something I've done before.

### Is there anything you would have liked to implement but didn't have the time to?
> I would have used Rails 6 but I haven't had a chance to play with Rails 6 yet so do to time constraints I decided to use 5.2.4.6

### What are the security holes (if any) in your system? If there are any, how would you fix them?
> I tried to make this app as secure as possible. All routes are wrapped with token based authentication except when signing up.

### Do you feel that your skills were well tested?
> No, the decisions you make when setting up a new API are very important but they aren't difficult.
Also, creating a friendship model wasn't difficult

### Notes:
I tried to follow the instructions exactly as specified. The only change I made was to the friendships POST endpoint.
The instructions asked to create an endpoint that responds to /users/:email/friendship but it felt weird to have the email in the URL. I decided to create an endpoint that responds to /friendships and accepts email as a param instead.