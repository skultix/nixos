{ ... }: {
	# rebuilding the man cache every time config changes is awfully slow
	documentation.man.cache.enable = false;
}
