set __fish_greet_quotes \
"We're no strangers to love" \
"You know the rules and so do I" \
"A full commitment's what I'm thinking of
You wouldn't get this from any other guy" \
"I just wanna tell you how I'm feeling
Gotta make you understand" \
"Never gonna give you up" \
"Never gonna let you down" \
"Never gonna run around and desert you" \
"Never gonna make you cry" \
"Never gonna say goodbye" \
"Never gonna tell a lie and hurt you" \
"We've known each other for so long" \
"Your heart's been aching, but you're too shy to say it" \
"Inside, we both know what's been going on
We know the game and we're gonna play it" \
"And if you ask me how I'm feeling
Don't tell me you're too blind to see"

set __fish_greet_quoters \
"George Washington" \
"John Adams " \
"Thomas Jefferson" \
"James Madison" \
"James Monroe" \
"John Quincy Adams" \
"Andrew Jackson" \
"Martin Van Buren" \
"William Henry Harrison" \
"John Tyler" \
"James K. Polk" \
"Zachary Taylor" \
"Millard Fillmore" \
"Franklin Pierce" \
"James Buchanan" \
"Abraham Lincoln" \
"Andrew Johnson" \
"Ulysses S. Grant" \
"Rutherford B. Hayes" \
"James A. Garfield" \
"Chester A. Arthur" \
"Grover Cleveland" \
"Benjamin Harrison" \
"William McKinley" \
"Theodore Roosevelt" \
"William Howard Taft" \
"Woodrow Wilson" \
"Warren G. Harding" \
"Calvin Coolidge" \
"Herbert Hoover" \
"Franklin D. Roosevelt" \
"Harry S. Truman" \
"Dwight D. Eisenhower" \
"John F. Kennedy" \
"Lyndon B. Johnson" \
"Richard Nixon" \
"Gerald Ford" \
"Jimmy Carter" \
"Ronald Reagan" \
"George H. W. Bush" \
"Bill Clinton" \
"George W. Bush" \
"Barack Obama" \
"Donald Trump" \
"Joe Biden"


function greet \
    --description "Greet the user with an encouraging quote from a famous U.S president"

    set quote {$__fish_greet_quotes[(math (random) % (count $__fish_greet_quotes) + 1)]}
    set quoter {$__fish_greet_quoters[(math (random) % (count $__fish_greet_quoters) + 1)]}
    echo "\"$quote\""
    set_color --italics
    echo "~ $quoter"
end
