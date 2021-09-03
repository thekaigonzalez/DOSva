extern (C) int run_dos();

import std.stdio;
import std.getopt; // for initramfs
import std.file;

void main(string[] args)
{
  bool initialize_fs = false;
  bool nhelp = false;
  bool change_dir = false;
  string ndir = "none";
  try {
   getopt(args, std.getopt.config.bundling, "initramfs|r", &initialize_fs,
   "help|h", &nhelp, "change-working-directory|c", &change_dir, "new-directory|n", &ndir);
  } catch (GetOptException e) { writeln(args[0]~": bad option");  }
  if (change_dir) {
    if (ndir == "none") {
     writeln("'DIR' Option required. '-h OR --help for help.");
    } else { try { chdir(ndir); } catch (Exception e) { writeln("error: directory not legitimate, '"~ndir~"'");  } }
  }
  if (nhelp) {
   writeln(args[0]~": usage: "~args[0]~" [-rhnc] [--change-working-directory=true --new-directory=DIR]");
  }
  if (initialize_fs) {
   writeln("to load into initramfs, please run the ./initramfs file.");
  }
  run_dos();

}


