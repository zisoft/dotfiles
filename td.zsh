# [Create and] open project todo
# If you don't pass a name as an argument, it's pulled from the directory name
function td() {
	if [[ -n $1 ]]; then
		proj=$1
		todofile=$proj.taskpaper
	else
		proj=${PWD##*/}
		todofile=$proj.taskpaper
		todofile=${todofile#.}
	fi
	if [ ! -e "$todofile" ]; then
		touch "$todofile"
		echo -e "Inbox:\n$proj:\n\tNew Features:\n\tIdeas:\n\tBugs:\nArchive:\nSearch Definitions:\n\tTop Priority @search(@priority = 1 and not @done)\n\tHigh Priority @search(@priority < 3 and not @done)\n\tMaybe @search(@maybe)\n\tNext @search(@na and not @done and not project = \"Archive\")\n" >> $todofile
	fi
	open -a TaskPaper "$todofile"
}
