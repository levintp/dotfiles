if status is-interactive
    # Commands to run in interactive sessions can go here
    set SHELL /usr/bin/fish
end



# prompt

source ~/.config/fish/functions/superline.fish
function fish_prompt -d "Write out the prompt"
    # Use superline as fish_prompt
    superline
end



# greeting

source ~/.config/fish/functions/greet.fish
function fish_greeting -d "Write a greeting to the user"
    # Use our greeting function instead
    greet
end
