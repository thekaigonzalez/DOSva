-- DOSva
-- contains logic for DOS bash replacement

require "libdos"

print("DOS-BASH v1.0 [Free Software Version 1.0]\nCopyright (C) nobody 2021-2021");


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
    else
        os.execute(strf)
  end
end
