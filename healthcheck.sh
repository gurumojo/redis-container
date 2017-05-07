#!/bin/bash -e

ping=$(redis-cli ping)

if [ "$ping" = "PONG" ]; then
	exit 0
fi

exit 1
