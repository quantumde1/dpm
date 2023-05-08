all:
	dub build --force
	g++ source/main.cpp -o ./dpm_search
install:
	dub build --force
	g++ source/main.cpp -o ./dpm_search
	mv ./dpm /usr/bin/
	mv ./dpm_search /usr/bin/