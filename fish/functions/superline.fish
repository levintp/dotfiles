#!/usr/bin/fish


# Superline configuration

set __fish_superline_sections                           "user"      "hostname"  "git"       "path"
set __fish_superline_sections_bg_colors                 "81a1c1"    "434c5e"    "3b4252"    "383a47"
set __fish_superline_sections_fg_colors                 "3b4252"    "c2c7cf"    "c2c7cf"    "c2c7cf"
set __fish_superline_sections_separator                 ""
set __fish_superline_end_bg_color                       "323440"
set __fish_superline_end_fg_color                       "c2c7cf"



# Superline sections

function __fish_superline_section_user \
    --description "Prints the name of the user"

    echo -n $USER
end

function __fish_superline_section_hostname \
    --description "Prints the name of the host"

    echo -n $hostname
end

function __fish_superline_section_git \
    --description "Prints git information"

    echo -n git
end

function __fish_superline_section_path \
    --description "Prints the current working directory"

    prompt_pwd
end



# Superline utility functionalities

function __print_colored --argument-names text bg_color fg_color \
    --description "Prints colored text"

    set_color --background $bg_color $fg_color
    echo -n $text
end

function __fish_superline_print_separator --argument-names section_index \
    --description "Prints the prompt's section separator"

    set prev_section_color $__fish_superline_sections_bg_colors[$section_index]
    set next_section_color $__fish_superline_sections_bg_colors[(math $section_index + 1)]
    if test -z "$next_section_color"
        set next_section_color $__fish_superline_end_bg_color
    end
    __print_colored $__fish_superline_sections_separator $next_section_color $prev_section_color
end

function __fish_superline_print_section --argument-names section_index \
    --description "Prints a section of the prompt"

    set section_text (__fish_superline_section_$__fish_superline_sections[$section_index])
    set section_bg $__fish_superline_sections_bg_colors[$section_index]
    set section_fg $__fish_superline_sections_fg_colors[$section_index]
    __print_colored " $section_text " $section_bg $section_fg
end

function __fish_superline_print_end \
    --description "Prints the end section of the prompt"

    if test $USER = "root"
        set end_section "#"
    else
        set end_section "\$"
    end
    __print_colored " $end_section " $__fish_superline_end_bg_color $__fish_superline_end_fg_color
    __print_colored "$__fish_superline_sections_separator " normal $__fish_superline_end_bg_color
end



# Superline prompt function

function superline \
    --description "Super prompt line for Fish"
    for section_index in (seq (count $__fish_superline_sections))
        __fish_superline_print_section $section_index
        __fish_superline_print_separator $section_index
    end
    __fish_superline_print_end
end
