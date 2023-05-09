import std.stdio;
import std.json;
import std.file;
import get;
import install;
import remove;
import list;

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
		rm_pkg(args[2], args[3]);
	}
	if (args[1] == "cc") {
		mkdirRecurse("/var/cache/dpm/packages/"~args[2]);
	}
	if (args[1] == "rc") {
		rmdirRecurse("/var/cache/dpm/packages/");
	}
	if (args[1] == "in") {
		writeln("Downloading ", args[2]);
		download_file(args[2]);
		unpack(args[2]);
		addtodb(args[2]);	
	}
	if (args[1] == "help") {
		help;
	}
	if (args[1] == "show") {
		show_packages;
	}
}