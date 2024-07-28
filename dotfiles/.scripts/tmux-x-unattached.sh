# Get all tmux sessions and filter out the attached ones
tmux list-sessions | grep -v attached | while read -r session
do
    # Extract the session name
    session_name=$(echo "$session" | cut -d ':' -f 1)
    
    # Kill the detached session
    tmux kill-session -t "$session_name"
done

