# how to figure out colors:
# for i in {0..255}; do tput setaf $i; echo -n "$i " ; done
# for i in {0..255}; do echo -n -e "\033[${i}m${i} "; done

clr() {
    local color=$1
    local text=$2
    echo -n "\[\033[${color}m\]${text}\[\033[0m\]"
}

generate_pipe_status() {
    # pipe status should be read on the first line
    for code in "${PIPESTATUS[@]}"; do
        if [[ "$code" == 0 ]]; then
            local code_colored=$(clr 92 "$code")
        else
            local code_colored=$(clr 91 "$code")
        fi
        pipe_status=("${pipe_status[@]}" "$code_colored")
    done
    echo "${pipe_status[*]}"
}

generate_git_status() {
    declare -F __git_ps1 > /dev/null && __git_ps1 "$1"
#     local is_git=$(git rev-parse --is-inside-work-tree 2>/dev/null)
#     if [[ $is_git == 'true' ]]; then
#         local branch=$(git branch --show-current --no-color)
#         if [[ ! -z $branch ]]; then
#             echo "$branch"
#             return 0
#         fi
#         local commit=$(git rev-parse --short HEAD)
#         if [[ ! -z $commit ]]; then
#             echo "<$commit>"
#             return 0
#         fi
#     else
#         echo '-'
#         return 1
#     fi
}

generate_prompt() {
    # this should go first
    local pipe_status=$(generate_pipe_status)

    if [[ $UID -eq 0 ]]; then
        local user=$(clr 91 \\u)
    else
        local user=$(clr 92 \\u)
    fi
    local host=$(clr "$PS1_HOST_COLOR" \\h)
    local terminal=$(clr "$PS1_HOST_COLOR" "$PS1_TERMINAL")
    local path=$(clr 93 \\w)
    local git_status=$(clr 96 "$(generate_git_status '%s')")
    local date_time=$(date +'%a %d %b %H:%M:%S %Z %z')

    local left_prompt="$user @ $host via $terminal $path <$pipe_status> ($git_status)"
    local right_prompt="$date_time"
    PS1="\\[\033[0m\\]\n\\[$(tput sc ; printf '%*s' "$COLUMNS" "$right_prompt" ; tput rc)\\]$left_prompt\n\\$ "
}

PROMPT_COMMAND=generate_prompt
