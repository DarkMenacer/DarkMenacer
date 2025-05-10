SI_DEV="si_dev"
SI_FIREBASE_SERVER="firebase-server"
SI_ADMIN_SERVER="admin-server"
SI_WEB_SERVER="web-server"
SI_EDITOR="editor"
SI_WORKING_DIRECTORY="~/SocialIncome/public"

tmux has-session -t $SI_DEV 2>/dev/null

if [ $? != 0 ]; then
	tmux new -d -s $SI_DEV -n $SI_FIREBASE_SERVER
	tmux send -t $SI_DEV:$SI_FIREBASE_SERVER "cd $SI_WORKING_DIRECTORY;npm run firebase:serve" Enter

	tmux new-window -t $SI_DEV -n $SI_ADMIN_SERVER
	tmux send -t $SI_DEV:$SI_ADMIN_SERVER "cd $SI_WORKING_DIRECTORY;npm run admin:serve" Enter

	tmux new-window -t $SI_DEV -n $SI_WEB_SERVER
	tmux send -t $SI_DEV:$SI_WEB_SERVER "cd $SI_WORKING_DIRECTORY;npm run website:serve" Enter

	tmux new-window -t $SI_DEV -n $SI_EDITOR
	tmux send -t $SI_DEV:$SI_EDITOR "cd $SI_WORKING_DIRECTORY/website;vim" Enter
fi

tmux attach -t $SI_DEV:$SI_EDITOR -c $SI_WORKING_DIRECTORY

