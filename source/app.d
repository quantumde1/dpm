import std.stdio;
import std.json;
import std.file;
import get;

void help() {
	writeln("Create cache dir: dpm cc");
	writeln("Install package: dpm in");
	writeln("Remove package: dpm rm");
	writeln("Clear cache dir: dpm rc");
}

void main(string[] args) {
	if (args.length <= 1) {
		writeln("Not enough arguments");
		assert(1);
	}
	if (args[1] == "rm") {
		writeln("Not implemented");
	}
	if (args[1] == "cc") {
		mkdir("/var/cache/dpm/packages/");
	}
	if (args[1] == "rc") {
		rmdir("/var/cache/dpm/packages");
	}
	if (args[1] == "in") {
		mkdir("/var/cache/dpm/packages/"~args[2]);
		writeln("Downloading ", args[2]);
		download_file(args[2]);
	}
}