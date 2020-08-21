# Guild Chat App
Time: About 4.5 hours between two sessions

### Rationale
Welcome to my submission! I am please to present a very basic chat app featuring
**ActionCable**, **Minimal JavaScript**, and **a Silly Emoji Feature**.

I chose ActionCable mostly because I haven't used it. I was very impressed with
Phoenix LiveView after I completed a tutorial on it, but I did not feel
confident reapplying those lessons for a quick but serious project like this.

I also made a very early decision to go light on the front end. React felt like
overkill, and the options to write a bunch of JQuery all over the place seemed
to defeat the justification of ActionCable.

Thinking of potential extensions, I had two options. One was spending a few
hours adding "other user is typing" and the other was adding Emoji support. I
decided to do the Emoji support because I am more impressed by that solution.
Looking at them, they both have potential to become toxic. I personally believe
that knowing when someone is drafting something they may never send is bad for
both sides of the conversation. Additionally like most people, I have personally
seen emoji used to marginalize and offend people in live chats. Ultimately,
emoji add more value than they take away, so I did it.

### Challenging Technical Bits
Setting up the models was non-trivial. I had to make an early decision on how
exactly to have users congregate. Do I focus on staying open to future extension
or doing what I need to do concisely and correctly? I chose more toward the
latter without completely forgoing the former. This particular choice manifested
in deciding whether to use has_and_belongs_to_many which uses an anonymous,
powerless join table which can be hard to extend and undo or whether to create a
real join table which may absolutely become cruft a week down the line.

The second out of the ordinary thing I came across was the ActionCable working
and then suddenly not. I never got to the bottom of it, going even so far as to
recreate the project minimally and getting to the same stage without running
into the same problem. Eventually I just switched the adapter to Redis which
made me feel like I was putting more burden on the evaluators and less on me.
Not the best feeling, but I didn't want to go too far down any rabbit holes.

Lastly, a typo on a missing period in a JQuery selector cost me the better part
of an hour, but once I found it, the rest went quite smoothly.

### Leftovers
I did not do thorough testing. I tested the ActionCable mostly to help me ensure
it was up and working, and I also tested the services well because that is where
the fun parts all actually happen. Leaving out Rails model and controller tests
was very deliberate. I find these tests which are mostly testing the framework
add nominal value to a project. The tests which break (and are therefore
doing their job!) are usually unit tests on custom logic and large system or
integration tests. I did not go into those bigger tests simply due to
constraining myself to a limited time frame. If I were to pick this project back
up, that's where I would start.

I'm not exactly happy with the way current user is handled. It leads to a bug I
[described in this commit](). The other small problem I have is with the hidden
fields I use to add data to the message being passed around. I think using a
more sophisticated form which knows from the outset those things. Essentially
instead of working on `form_with Message`, use `form_with
@my_decorator_message`. More control in that thing being passed around usually
opens these things up to extensibility. Fighting against the Rails forms or
whatever is never a battle you are happy about winning.
