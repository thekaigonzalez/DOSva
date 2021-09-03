-- DOSva
-- contains logic for DOS bash replacement




package.cpath = package.cpath .. ";" .. os.getenv("DOSHOME") .. "/?.so" 


require "libdos"

print("DOS-BASH [Free Software Version 1.3]\nCopyright (C) nobody 2021-2021");


--- Low level split & higher level split
--- Kux source code used
function lsplit(s, delimiter)
 result = {}
 
 for match in (s..delimiter):gmatch("(.-)"..delimiter) do
  table.insert(result, match);
 end

 return result;
end

function split(string)
 local tblt = {}

 local lns = lsplit(string, " ");

 i = 0
 
 for _,V in ipairs(lns) do
  tblt[i] = V;
  i = i + 1
 end
 return tblt
end

--- Basic Terminal Logic below this line ---

-- add the terminal command checker

while true  do
    local strf = readln("C:" .. getcwd() .. ">");
    local opt_a = split(strf)
   
    if opt_a[0] == "cd" then
	chdir(opt_a[1]);
    elseif opt_a[0] == "help" or opt_a[0] == "HELP" then
	if opt_a[1] == "initramfs" then
	 print("DOS [VA0-host]")
	 print("-------- initramfs --------");
	 print("initramfs - Pre-Terminal for DOSva\n\ninitramfs is a pre-terminal binary located in the DOSva source code. Written in D, it contains a bunch of low level commands to aid in the development process of your DOSva version.\n")
	end
        print("DOS [running on VA 0, host]")
	print("\n-------------- Builtins -----------------");
	print("HELP - Sends the 'help' menu.");
	print("\nDOS VA is a shell terminal emulator with native shell support.")
	print("It is inspired off of the MS-DOS interpreter.");
	print("Pretty statement editing is not supported.")
	print("if you need to use statement editing, either use it in one line, or use a highly recommended BASH interpreter.")
    else
        os.execute(strf)
  end
end
