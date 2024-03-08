if [ -s ~/.env ]; then
	export $(envsubst < ~/.env)
fi
