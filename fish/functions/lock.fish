function lock --description 'suspend and lock the screen'
    i3lock -c 999999 & systemctl suspend
end

