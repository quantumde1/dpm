import std.stdio;
import std.json;
import std.file;
import get;
import install;
import remove;

void help() {
	writeln("Create cache dir: dpm cc");
	writeln("Install package: dpm in");
	writeln("Remove package: dpm rm");
	writeln("Clear cache dir: dpm rc");
}

void main(string[] args) {
	if (args.length <= 1) {
		writeln("Not enough arguments");
	}
	if (args[1] == "rm") {
		rm_pkg(args[2]);
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
		unpack(args[2]);
		addtodb(args[2]);	
	}
	if (args[1] == "help") {
		help;
	}
}