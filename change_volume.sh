AMOUNT=${1:-+10}
CURRENT_VOLUME=$(spt pb --status --format %v)
spt pb --volume "$(($CURRENT_VOLUME $AMOUNT))"
